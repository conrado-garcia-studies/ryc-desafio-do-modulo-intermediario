import 'package:collection/collection.dart';
import 'package:mobx/mobx.dart';
import 'package:my_marvel_list/models/loading_mode.dart';
import 'package:my_marvel_list/models/my_series.dart';
import 'package:my_marvel_list/models/my_series_status.dart';
import 'package:my_marvel_list/stores/shared_preferences_store.dart';
import 'package:my_marvel_list/utils/app_logger.dart';
import 'package:my_marvel_list/utils/constants.dart';

part 'my_list_store.g.dart';

class MyListStore extends _MyListStore with _$MyListStore {}

abstract class _MyListStore with Store {
  @observable
  bool isLoading = false;

  @observable
  ObservableMap<MySeriesStatus, List<MySeries>> loadedStatusToSeries =
      ObservableMap<MySeriesStatus, List<MySeries>>();

  @observable
  bool isError = false;

  @action
  Future<void> loadStatusToSeries(final LoadingMode loadingMode) async {
    if (isLoading) {
      return;
    }
    if (loadingMode == LoadingMode.loadMore ||
        (loadingMode == LoadingMode.loadIfNotLoaded &&
            loadedStatusToSeries.isNotEmpty)) {
      return;
    }
    isError = false;
    isLoading = true;
    try {
      final Map<String, dynamic> map =
          await SharedPreferencesStore.getMap(Constants.mySeries);
      loadedStatusToSeries.clear();
      loadedStatusToSeries.addAll(
        groupBy(
          map.keys
              .map<MySeries>(
                (final String key) => MySeries.fromKeyAndValue(key, map[key]),
              )
              .where(
                (final MySeries series) => series.status != null,
              )
              .sorted(
                (final MySeries b, final MySeries a) =>
                    a.lastUpdate.compareTo(b.lastUpdate),
              )
              .toList(),
          (final MySeries series) => series.status!,
        ),
      );
    } catch (e) {
      logger.e(e);
      isError = true;
    } finally {
      isLoading = false;
    }
  }
}
