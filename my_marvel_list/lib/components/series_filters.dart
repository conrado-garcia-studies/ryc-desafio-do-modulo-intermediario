import 'package:flutter/material.dart';
import 'package:my_marvel_list/components/more_series_symbol_filters.dart';
import 'package:my_marvel_list/components/series_symbol_filter.dart';
import 'package:my_marvel_list/components/series_text_filter.dart';

class SeriesFilters extends StatelessWidget {
  const SeriesFilters({super.key});

  @override
  Widget build(final BuildContext context) {
    final int currentYear = DateTime.now().year;
    final int lastYear = currentYear - 1;
    final Map<String, dynamic> commonSpecificQueryParameters =
        <String, dynamic>{};
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
            left: 13,
            top: 13,
            right: 13,
          ),
          child: SizedBox(
            height: 60,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <SeriesTextFilter>[
                SeriesTextFilter(
                  label: '$currentYear',
                  title: '$currentYear Comic Series',
                  routeName: '/$currentYear-series-selection',
                  specificQueryParameters: <String, dynamic>{
                    'startYear': currentYear,
                  },
                ),
                SeriesTextFilter(
                  label: '$lastYear',
                  title: '$lastYear Comic Series',
                  routeName: '/$lastYear-series-selection',
                  specificQueryParameters: <String, dynamic>{
                    'startYear': lastYear,
                  },
                ),
                const SeriesTextFilter(
                  label: 'Limited',
                  title: 'Limited Comic Series',
                  routeName: '/limited-series-selection',
                  specificQueryParameters: <String, dynamic>{
                    'seriesType': 'limited',
                  },
                ),
                const SeriesTextFilter(
                  label: 'One Shot',
                  title: 'One Shot Comic Series',
                  routeName: '/one-shot-series-selection',
                  specificQueryParameters: <String, dynamic>{
                    'seriesType': 'one shot',
                  },
                ),
                const SeriesTextFilter(
                  label: 'Collection',
                  title: 'Collection Comic Series',
                  routeName: '/collection-series-selection',
                  specificQueryParameters: <String, dynamic>{
                    'seriesType': 'collection',
                  },
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
            bottom: 10,
          ),
          child: SizedBox(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                SeriesSymbolFilter(
                  label: 'a',
                  tooltipMessage: 'Avengers',
                  title: 'Avengers Comic Series',
                  routeName: '/avengers-series-selection',
                  specificSubpath: '/characters/1009165/series',
                  specificQueryParameters: commonSpecificQueryParameters,
                ),
                SeriesSymbolFilter(
                  label: 'u',
                  tooltipMessage: 'Spider-Man (Peter Parker)',
                  title: 'Spider-Man (Peter Parker) Comic Series',
                  routeName: '/avengers-series-selection',
                  specificSubpath: '/characters/1009610/series',
                  specificQueryParameters: commonSpecificQueryParameters,
                ),
                SeriesSymbolFilter(
                  label: '_',
                  tooltipMessage: 'Wolverine',
                  title: 'Wolverine Comic Series',
                  routeName: '/wolverine-series-selection',
                  specificSubpath: '/characters/1009718/series',
                  specificQueryParameters: commonSpecificQueryParameters,
                ),
                SeriesSymbolFilter(
                  label: '.',
                  tooltipMessage: 'Hulk',
                  title: 'Hulk Comic Series',
                  routeName: '/hulk-series-selection',
                  specificSubpath: '/characters/1009351/series',
                  specificQueryParameters: commonSpecificQueryParameters,
                ),
                SeriesSymbolFilter(
                  label: '\$',
                  tooltipMessage: 'Iron Man',
                  title: 'Iron Man Comic Series',
                  routeName: '/iron-man-series-selection',
                  specificSubpath: '/characters/1009368/series',
                  specificQueryParameters: commonSpecificQueryParameters,
                ),
                SeriesSymbolFilter(
                  label: 'c',
                  tooltipMessage: 'Captain America',
                  title: 'Captain America Comic Series',
                  routeName: '/captain-america-series-selection',
                  specificSubpath: '/characters/1009220/series',
                  specificQueryParameters: commonSpecificQueryParameters,
                ),
                SeriesSymbolFilter(
                  label: 'V',
                  tooltipMessage: 'Thor',
                  title: 'Thor Comic Series',
                  routeName: '/thor-series-selection',
                  specificSubpath: '/characters/1009664/series',
                  specificQueryParameters: commonSpecificQueryParameters,
                ),
                SeriesSymbolFilter(
                  label: 'x',
                  tooltipMessage: 'X-Men',
                  title: 'X-men Comic Series',
                  routeName: '/x-men-series-selection',
                  specificSubpath: '/characters/1009165/series',
                  specificQueryParameters: commonSpecificQueryParameters,
                ),
                SeriesSymbolFilter(
                  label: 'S',
                  tooltipMessage: 'Venom',
                  title: 'Venom (Eddie Brock) Comic Series',
                  routeName: '/venom-series-selection',
                  specificSubpath: '/characters/1010787/series',
                  specificQueryParameters: commonSpecificQueryParameters,
                ),
                SeriesSymbolFilter(
                  label: 'd',
                  tooltipMessage: 'Daredevil',
                  title: 'Daredevil Comic Series',
                  routeName: '/daredevil-series-selection',
                  specificSubpath: '/characters/1009262/series',
                  specificQueryParameters: commonSpecificQueryParameters,
                ),
                SeriesSymbolFilter(
                  label: 'P',
                  tooltipMessage: 'Punisher',
                  title: 'Punisher Comic Series',
                  routeName: '/punisher-series-selection',
                  specificSubpath: '/characters/1009515/series',
                  specificQueryParameters: commonSpecificQueryParameters,
                ),
                const MoreSeriesSymbolFilters(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
