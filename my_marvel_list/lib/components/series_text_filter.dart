import 'package:flutter/material.dart';
import 'package:my_marvel_list/screens/series_selection_screen.dart';

class SeriesTextFilter extends StatelessWidget {
  const SeriesTextFilter({
    super.key,
    required this.label,
    required this.title,
    required this.routeName,
    required this.specificQueryParameters,
  });

  final String label;
  final String title;
  final String routeName;
  final Map<String, dynamic> specificQueryParameters;

  @override
  Widget build(final BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7),
      child: ElevatedButton(
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => SeriesSelectionScreen(
              title: title,
              routeName: routeName,
              specificQueryParameters: specificQueryParameters,
            ),
            settings: RouteSettings(
              name: routeName,
            ),
          ),
        ),
        child: Text(label),
      ),
    );
  }
}
