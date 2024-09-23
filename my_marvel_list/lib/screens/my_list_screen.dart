import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:my_marvel_list/components/app_drawer.dart';
import 'package:my_marvel_list/components/go_back_button.dart';
import 'package:my_marvel_list/components/loading.dart';
import 'package:my_marvel_list/components/thumbnail_card.dart';
import 'package:my_marvel_list/models/loading_mode.dart';
import 'package:my_marvel_list/models/my_series.dart';
import 'package:my_marvel_list/models/my_series_status.dart';
import 'package:my_marvel_list/screens/error_screen.dart';
import 'package:my_marvel_list/screens/series_details_screen.dart';
import 'package:my_marvel_list/stores/my_list_store.dart';
import 'package:my_marvel_list/utils/app_routes.dart';

class MyListScreen extends StatelessWidget {
  const MyListScreen({super.key});

  @override
  Widget build(final BuildContext context) {
    final MyListStore store = GetIt.I<MyListStore>();
    store.loadStatusToSeries(LoadingMode.loadIfNotLoaded);
    final ObservableMap<MySeriesStatus, List<MySeries>> loadedStatusToSeries =
        store.loadedStatusToSeries;
    return Observer(builder: (_) {
      if (store.isLoading) {
        return const Loading();
      }
      if (store.isError) {
        return ErrorScreen(
          message: 'It was not possible to load your list.',
          tryAgain: () =>
              Navigator.of(context).pushReplacementNamed(AppRoutes.myList),
        );
      }
      return DefaultTabController(
        length: MySeriesStatus.values.length,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('My List'),
            actions: const <Widget>[
              GoBackButton(),
            ],
            bottom: TabBar(
              tabs: MySeriesStatus.values.map<Tab>(
                (final MySeriesStatus status) {
                  final int count = loadedStatusToSeries[status]?.length ?? 0;
                  return Tab(
                    text: '${status.label} (${count.toString()})',
                  );
                },
              ).toList(),
              isScrollable: true,
              tabAlignment: TabAlignment.start,
            ),
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          ),
          body: TabBarView(
            children: MySeriesStatus.values.map<Widget>(
              (final MySeriesStatus status) {
                final List<MySeries> loadedSeries =
                    loadedStatusToSeries[status] ?? [];
                if (loadedSeries.isEmpty) {
                  return const Center(
                    child: Text('No items have been added yet.'),
                  );
                }
                final bool isPortrait =
                    MediaQuery.of(context).orientation == Orientation.portrait;
                return Scrollbar(
                  thickness: 3,
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(20),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: isPortrait ? 3 : 5,
                        mainAxisSpacing: 30,
                        crossAxisSpacing: 20,
                        mainAxisExtent: isPortrait ? 180 : 205,
                      ),
                      itemBuilder: (_, final int i) {
                        final MySeries series = loadedSeries[i];
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
                  ),
                );
              },
            ).toList(),
          ),
          floatingActionButton: FloatingActionButton(
            tooltip: 'All Comic Series',
            onPressed: () => Navigator.of(context).popUntil(
              (final Route<dynamic> route) {
                final String? name = route.settings.name;
                return name != null && name.endsWith('series-selection');
              },
            ),
            child: const Icon(
              IconData(
                0xf3e7,
                fontFamily: CupertinoIcons.iconFont,
                fontPackage: CupertinoIcons.iconFontPackage,
              ),
            ),
          ),
          drawer: const AppDrawer(),
        ),
      );
    });
  }

  String _buildTooltipMessage(final MySeries series) {
    return <String>[
      'Last update: ${DateFormat.yMMMMd('en_US').add_jm().format(series.lastUpdate)}',
      'Name: ${series.title.trim()}',
      'Description: ${_getDescription(series)}',
    ].join('\n');
  }

  String _getDescription(final MySeries series) {
    final String? description = series.description;
    if (description?.trim().isEmpty ?? true) {
      return 'N/A';
    }
    return series.description!.trim();
  }
}
