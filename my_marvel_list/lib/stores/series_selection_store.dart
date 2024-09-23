import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';
import 'package:my_marvel_list/models/loading_mode.dart';
import 'package:my_marvel_list/models/series.dart';
import 'package:my_marvel_list/utils/app_logger.dart';
import 'package:my_marvel_list/utils/marvel_comics_api_utils.dart';

part 'series_selection_store.g.dart';

class SeriesSelectionStore extends _SeriesSelectionStore
    with _$SeriesSelectionStore {
  SeriesSelectionStore(final Map<String, dynamic> specificQueryParameters,
      [final String? specificSubpath]) {
    super.specificSubpath = specificSubpath;
    super.specificQueryParameters = specificQueryParameters;
  }
}

abstract class _SeriesSelectionStore with Store {
  String? specificSubpath;
  late Map<String, dynamic> specificQueryParameters;

  @observable
  bool isShowSearchBar = false;

  @observable
  bool isLoading = false;

  @observable
  ObservableList<Series> loadedSeries = ObservableList<Series>();

  @observable
  bool isError = false;

  @observable
  int total = 0;

  @observable
  int offset = 0;

  @computed
  bool get isEverythingLoaded =>
      !isLoading && !isError && loadedSeries.length == total;

  @action
  void showSearchBar() {
    isShowSearchBar = true;
  }

  @action
  void hideSearchBar() {
    isShowSearchBar = false;
  }

  @action
  Future<void> loadSeries(final LoadingMode loadingMode) async {
    if (isLoading) {
      return;
    }
    if (loadingMode == LoadingMode.loadIfNotLoaded && loadedSeries.isNotEmpty) {
      return;
    }
    if (loadingMode == LoadingMode.reload ||
        (loadingMode == LoadingMode.loadIfNotLoaded && loadedSeries.isEmpty)) {
      offset = 0;
      loadedSeries.clear();
    }
    isError = false;
    isLoading = true;
    try {
      final Map<String, dynamic> queryParameters = <String, dynamic>{
        ...<String, dynamic>{
          'orderBy': '-modified',
        },
        ...specificQueryParameters,
      };
      final http.Response response = await http.get(
        MarvelComicsApiUtils.createUri(
            specificSubpath ?? '/series', offset, queryParameters),
      );
      final Map<String, dynamic> body = jsonDecode(response.body);
      final Map<String, dynamic> data = body['data'];
      final List<dynamic> results = data['results'];
      for (final result in results) {
        loadedSeries.add(
          Series.fromJson(result),
        );
      }
      total = data['total'];
      offset += int.parse(dotenv.env['MARVEL_COMICS_API_LIMIT']!);
    } catch (e) {
      logger.e(e);
      isError = true;
    } finally {
      isLoading = false;
    }
  }
}
