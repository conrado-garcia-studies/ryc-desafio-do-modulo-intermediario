import 'package:flutter/material.dart';
import 'package:my_marvel_list/screens/series_selection_screen.dart';

class SeriesSymbolFilter extends StatelessWidget {
  const SeriesSymbolFilter({
    super.key,
    required this.label,
    required this.tooltipMessage,
    required this.title,
    required this.routeName,
    this.specificSubpath,
    required this.specificQueryParameters,
  });

  final String label;
  final String tooltipMessage;
  final String title;
  final String routeName;
  final String? specificSubpath;
  final Map<String, dynamic> specificQueryParameters;

  @override
  Widget build(final BuildContext context) {
    return Tooltip(
      message: tooltipMessage,
      child: TextButton(
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => SeriesSelectionScreen(
              title: title,
              routeName: routeName,
              specificSubpath: specificSubpath,
              specificQueryParameters: specificQueryParameters,
            ),
            settings: RouteSettings(
              name: routeName,
            ),
          ),
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 40,
            fontFamily: 'Hall of Heroes',
          ),
        ),
      ),
    );
  }
}
