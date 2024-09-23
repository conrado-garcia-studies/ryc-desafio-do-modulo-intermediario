import 'package:my_marvel_list/models/my_series_status.dart';
import 'package:my_marvel_list/models/series.dart';

class MySeries extends Series {
  final MySeriesStatus? status;
  final DateTime lastUpdate;

  MySeries({
    required super.id,
    required super.title,
    super.description,
    required super.thumbnailUrl,
    this.status,
    required this.lastUpdate,
  });

  factory MySeries.fromKeyAndValue(final String key, final value) {
    final String? statusString = value['status'];
    return MySeries(
      id: int.parse(key),
      title: value['title'],
      description: value['description'],
      thumbnailUrl: value['thumbnailUrl'],
      status: statusString == null
          ? null
          : MySeriesStatus.values.byName(statusString),
      lastUpdate: DateTime.parse(value['lastUpdate']),
    );
  }

  static Map<String, dynamic> toValue(
      final Series series, final MySeriesStatus? status) {
    return {
      'title': series.title,
      'description': series.description,
      'thumbnailUrl': series.thumbnailUrl,
      'status': status?.name,
      'lastUpdate': DateTime.now().toIso8601String(),
    };
  }
}
