import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:my_marvel_list/components/app_drawer.dart';
import 'package:my_marvel_list/components/go_back_button.dart';
import 'package:my_marvel_list/components/loading.dart';
import 'package:my_marvel_list/components/my_list_button.dart';
import 'package:my_marvel_list/components/my_series_status_dropdown_button.dart';
import 'package:my_marvel_list/components/thumbnail_card.dart';
import 'package:my_marvel_list/models/character.dart';
import 'package:my_marvel_list/models/loading_mode.dart';
import 'package:my_marvel_list/models/series.dart';
import 'package:my_marvel_list/screens/error_screen.dart';
import 'package:my_marvel_list/stores/series_details_store.dart';

class SeriesDetailsScreen extends StatefulWidget {
  const SeriesDetailsScreen({
    super.key,
    required this.selectedSeries,
  });

  final Series selectedSeries;

  @override
  State<SeriesDetailsScreen> createState() => _SeriesDetailsScreenState();
}

class _SeriesDetailsScreenState extends State<SeriesDetailsScreen> {
  late SeriesDetailsStore _store;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _store = SeriesDetailsStore(widget.selectedSeries);
    _scrollController.addListener(_loadMore);
    _store.loadCharacters(LoadingMode.loadIfNotLoaded);
  }

  void _loadMore() async {
    final ScrollPosition position = _scrollController.position;
    if (position.pixels == position.maxScrollExtent &&
        !_store.isEverythingLoaded) {
      final double newScrollValue =
          50 + _scrollController.position.maxScrollExtent;
      await _store.loadCharacters(LoadingMode.loadMore);
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

  @override
  Widget build(final BuildContext context) {
    return Observer(
      builder: (_) {
        if (_store.isLoading) {
          return const Loading();
        }
        final Series selectedSeries = _store.selectedSeries;
        final String title = selectedSeries.title.trim();
        if (_store.isError) {
          return ErrorScreen(
            message: 'It was not possible to load the details of "$title".',
            tryAgain: () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (_) => SeriesDetailsScreen(
                  selectedSeries: widget.selectedSeries,
                ),
              ),
            ),
          );
        }
        final String? description = selectedSeries.description;
        final ObservableList<Character> loadedCharacters =
            _store.loadedCharacters;
        final bool isPortrait =
            MediaQuery.of(context).orientation == Orientation.portrait;
        return Scaffold(
          body: CustomScrollView(
            controller: _scrollController,
            slivers: <Widget>[
              SliverAppBar(
                actions: const <Widget>[
                  GoBackButton(),
                ],
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(title),
                  background: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Hero(
                        tag: selectedSeries.id,
                        child: Image.network(
                          selectedSeries.thumbnailUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                      DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: const Alignment(0, 0.8),
                            end: const Alignment(0, 0),
                            colors: <Color>[
                              Theme.of(context).colorScheme.surface,
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                backgroundColor: Colors.black26,
                expandedHeight: 298,
                pinned: true,
              ),
              SliverList(
                delegate: SliverChildListDelegate.fixed(
                  [
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Bubble(
                            nip: description == null
                                ? BubbleNip.leftTop
                                : BubbleNip.rightTop,
                            nipWidth: 30,
                            nipHeight: 10,
                            nipOffset: 15,
                            color: Theme.of(context).colorScheme.inversePrimary,
                            padding: const BubbleEdges.all(20),
                            margin: const BubbleEdges.only(
                              top: 20,
                              bottom: 10,
                            ),
                            alignment: description == null
                                ? Alignment.topLeft
                                : Alignment.topRight,
                            child: Column(
                              children: <Widget>[
                                RichText(
                                  text: TextSpan(
                                    children: <TextSpan>[
                                      const TextSpan(
                                        text: 'My',
                                      ),
                                      TextSpan(
                                        text: ' status ',
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                          fontSize: 27,
                                        ),
                                      ),
                                      const TextSpan(
                                        text: '(click below to select):',
                                      ),
                                    ],
                                  ),
                                ),
                                MySeriesStatusDropdownButton(
                                  series: selectedSeries,
                                ),
                              ],
                            ),
                          ),
                          Builder(
                            builder: (_) {
                              if (description == null) {
                                return Container();
                              }
                              return Bubble(
                                nip: BubbleNip.leftTop,
                                nipWidth: 30,
                                nipHeight: 10,
                                nipOffset: 15,
                                color: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary,
                                padding: const BubbleEdges.all(20),
                                margin: const BubbleEdges.only(
                                  top: 20,
                                  bottom: 10,
                                ),
                                alignment: Alignment.topLeft,
                                child: Text(description),
                              );
                            },
                          ),
                          if (loadedCharacters.isNotEmpty)
                            Bubble(
                              nip: BubbleNip.rightTop,
                              nipWidth: 30,
                              nipHeight: 10,
                              nipOffset: 15,
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                              padding: const BubbleEdges.all(20),
                              margin: const BubbleEdges.only(
                                top: 20,
                                bottom: 20,
                              ),
                              alignment: Alignment.topRight,
                              child: RichText(
                                text: TextSpan(
                                  children: <TextSpan>[
                                    const TextSpan(
                                      text: 'This',
                                    ),
                                    TextSpan(
                                      text: ' series ',
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        fontSize: 20,
                                      ),
                                    ),
                                    const TextSpan(
                                      text: 'has the following',
                                    ),
                                    TextSpan(
                                      text: ' characters',
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        fontSize: 27,
                                      ),
                                    ),
                                    const TextSpan(
                                      text: ':',
                                      style: TextStyle(
                                        fontSize: 27,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
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
                              final Character character = loadedCharacters[i];
                              return ThumbnailCard(
                                id: character.id,
                                thumbnailUrl: character.thumbnailUrl,
                                title: character.name,
                                tooltipMessage: _buildTooltipMessage(character),
                              );
                            },
                            itemCount: loadedCharacters.length,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          floatingActionButton: const MyListButton(),
          drawer: const AppDrawer(),
        );
      },
    );
  }

  _buildTooltipMessage(final Character character) {
    return <String>[
      'Name: ${character.name.trim()}',
      'Description: ${_getDescription(character)}',
    ].join('\n');
  }

  String _getDescription(final Character character) {
    final String? description = character.description;
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
