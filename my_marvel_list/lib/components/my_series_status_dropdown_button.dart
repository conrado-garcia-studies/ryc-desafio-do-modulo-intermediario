import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:my_marvel_list/models/loading_mode.dart';
import 'package:my_marvel_list/models/my_series.dart';
import 'package:my_marvel_list/models/my_series_status.dart';
import 'package:my_marvel_list/models/series.dart';
import 'package:my_marvel_list/stores/my_list_store.dart';
import 'package:my_marvel_list/stores/shared_preferences_store.dart';
import 'package:my_marvel_list/utils/constants.dart';

class MySeriesStatusDropdownButton extends StatefulWidget {
  const MySeriesStatusDropdownButton({
    super.key,
    required this.series,
  });

  final Series series;

  @override
  State<MySeriesStatusDropdownButton> createState() =>
      _MySeriesStatusDropdownButtonState();
}

class _MySeriesStatusDropdownButtonState
    extends State<MySeriesStatusDropdownButton> {
  MySeriesStatus? dropdownValue;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _loadStatus());
  }

  _loadStatus() async {
    final Map<String, dynamic> map =
        await SharedPreferencesStore.getMap(Constants.mySeries);
    final String? statusString = map['${widget.series.id}']?['status'];
    if (statusString != null) {
      setState(() {
        dropdownValue = MySeriesStatus.values.byName(statusString);
      });
    }
  }

  @override
  Widget build(final BuildContext context) {
    return DropdownButton<MySeriesStatus>(
      items: <DropdownMenuItem<MySeriesStatus>>[
        ...[
          const DropdownMenuItem<MySeriesStatus>(
            value: null,
            child: Text('None'),
          ),
        ],
        ...MySeriesStatus.values.map<DropdownMenuItem<MySeriesStatus>>(
            (final MySeriesStatus status) {
          return DropdownMenuItem<MySeriesStatus>(
            value: status,
            child: Text(status.label),
          );
        }),
      ],
      value: dropdownValue,
      onChanged: _saveSeriesList,
      elevation: 16,
      icon: const Icon(
        Icons.arrow_downward,
      ),
    );
  }

  Future<void> _saveSeriesList(final MySeriesStatus? value) async {
    final Map<String, dynamic> map =
        await SharedPreferencesStore.getMap(Constants.mySeries);
    final Series series = widget.series;
    map['${series.id}'] = MySeries.toValue(series, value);
    SharedPreferencesStore.saveMap(Constants.mySeries, map);
    final MyListStore store = GetIt.I<MyListStore>();
    store.loadStatusToSeries(LoadingMode.reload);
    setState(() {
      dropdownValue = value;
    });
  }
}
