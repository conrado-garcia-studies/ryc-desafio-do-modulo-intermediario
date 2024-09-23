import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';
import 'package:my_marvel_list/components/app_drawer.dart';
import 'package:my_marvel_list/components/app_search_bar.dart';
import 'package:my_marvel_list/components/go_back_button.dart';
import 'package:my_marvel_list/components/loading.dart';
import 'package:my_marvel_list/components/my_list_button.dart';
import 'package:my_marvel_list/components/next_mcu_film_toast.dart';
import 'package:my_marvel_list/components/series_filters.dart';
import 'package:my_marvel_list/components/thumbnail_card.dart';
import 'package:my_marvel_list/models/loading_mode.dart';
import 'package:my_marvel_list/models/series.dart';
import 'package:my_marvel_list/screens/error_screen.dart';
import 'package:my_marvel_list/screens/series_details_screen.dart';
import 'package:my_marvel_list/stores/series_selection_store.dart';
import 'package:my_marvel_list/utils/app_logger.dart';
import 'package:my_marvel_list/utils/app_routes.dart';

class SeriesSelectionScreen extends StatefulWidget {
  const SeriesSelectionScreen({
    super.key,
    required this.title,
    required this.routeName,
    this.specificSubpath,
    required this.specificQueryParameters,
  });

  final String title;
  final String routeName;
  final String? specificSubpath;
  final Map<String, dynamic> specificQueryParameters;

  @override
  State<SeriesSelectionScreen> createState() => _SeriesSelectionScreenState();
}

class _SeriesSelectionScreenState extends State<SeriesSelectionScreen> {
  late SeriesSelectionStore _store;
  final ScrollController _scrollController = ScrollController();
  final FToast _fToast = FToast();

  @override
  void initState() {
    super.initState();
    _store = SeriesSelectionStore(
        widget.specificQueryParameters, widget.specificSubpath);
    _scrollController.addListener(_loadMore);
    _store.loadSeries(LoadingMode.loadIfNotLoaded);
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _showNextMcuFilmToast());
  }

  void _loadMore() async {
    final ScrollPosition position = _scrollController.position;
    if (position.pixels == position.maxScrollExtent &&
        !_store.isEverythingLoaded) {
      final double newScrollValue =
          50 + _scrollController.position.maxScrollExtent;
      await _store.loadSeries(LoadingMode.loadMore);
      Future.delayed(
        const Duration(
          milliseconds: 50,
        ),
        () {
          _scrollController.jumpTo(newScrollValue);
        },
      );
    }
  }

  void _showNextMcuFilmToast() async {
    try {
      if (widget.routeName != AppRoutes.seriesSelection) {
        return;
      }
      _fToast.init(context);
      final String uri = dotenv.env['WHEN_IS_THE_NEXT_MCU_FILM_API_URI']!;
      final http.Response response = await http.get(
        Uri.parse(uri),
      );
      final Map<String, dynamic> body = jsonDecode(response.body);
      _fToast.showToast(
        toastDuration: const Duration(
          seconds: 2,
          milliseconds: 500,
        ),
        gravity: ToastGravity.CENTER,
        child: NextMcuFilmToast(
          body: body,
        ),
      );
    } catch (e) {
      logger.e(e);
    }
  }

  @override
  Widget build(final BuildContext context) {
    return Observer(
      builder: (_) {
        if (_store.isLoading) {
          return const Loading();
        }
        if (_store.isError) {
          return ErrorScreen(
            message: 'It was not possible to load the list of series.',
            tryAgain: () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (_) => SeriesSelectionScreen(
                  title: widget.title,
                  routeName: widget.routeName,
                  specificQueryParameters: widget.specificQueryParameters,
                ),
                settings: RouteSettings(
                  name: widget.routeName,
                ),
              ),
            ),
          );
        }
        return GestureDetector(
          onTap: () {
            _store.hideSearchBar();
            FocusScope.of(context).requestFocus(
              FocusNode(),
            );
          },
          child: Scaffold(
            appBar: AppBar(
              title: Builder(
                builder: (_) {
                  if (_store.isShowSearchBar) {
                    return AppSearchBar(
                      store: _store,
                    );
                  }
                  return Text(widget.title);
                },
              ),
              actions: <Widget>[
                if (widget.routeName == AppRoutes.seriesSelection &&
                    !_store.isShowSearchBar)
                  IconButton(
                    onPressed: _store.showSearchBar,
                    icon: const Icon(
                      IconData(
                        0xf4a5,
                        fontFamily: CupertinoIcons.iconFont,
                        fontPackage: CupertinoIcons.iconFontPackage,
                      ),
                    ),
                  ),
                Builder(builder: (_) {
                  return const GoBackButton();
                }),
              ],
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            ),
            body: Builder(
              builder: (_) {
                final ObservableList<Series> loadedSeries = _store.loadedSeries;
                if (loadedSeries.isEmpty) {
                  return const Center(
                    child: Text('No series have been found.'),
                  );
                }
                final bool isPortrait =
                    MediaQuery.of(context).orientation == Orientation.portrait;
                return Scrollbar(
                  controller: _scrollController,
                  thickness: 3,
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    controller: _scrollController,
                    child: Column(
                      children: <Widget>[
                        if (widget.routeName == AppRoutes.seriesSelection)
                          const SeriesFilters(),
                        GridView.builder(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          padding: const EdgeInsets.all(20),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: isPortrait ? 3 : 5,
                            mainAxisSpacing: 30,
                            crossAxisSpacing: 20,
                            mainAxisExtent: isPortrait ? 180 : 205,
                          ),
                          itemBuilder: (_, final int i) {
                            final Series series = loadedSeries[i];
                            return ThumbnailCard(
                              id: series.id,
                              thumbnailUrl: series.thumbnailUrl,
                              title: series.title,
                              tooltipMessage: _buildTooltipMessage(series),
                              onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => SeriesDetailsScreen(
                                    selectedSeries: series,
                                  ),
                                ),
                              ),
                            );
                          },
                          itemCount: loadedSeries.length,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            floatingActionButton: const MyListButton(),
            drawer: const AppDrawer(),
          ),
        );
      },
    );
  }

  String _buildTooltipMessage(final Series series) {
    return <String>[
      'Title: ${series.title.trim()}',
      'Description: ${_getDescription(series)}',
    ].join('\n');
  }

  String _getDescription(final Series series) {
    final String? description = series.description;
    if (description?.trim().isEmpty ?? true) {
      return 'N/A';
    }
    return description!.trim();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
