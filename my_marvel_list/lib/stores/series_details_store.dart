import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';
import 'package:my_marvel_list/models/character.dart';
import 'package:my_marvel_list/models/loading_mode.dart';
import 'package:my_marvel_list/models/series.dart';
import 'package:my_marvel_list/utils/app_logger.dart';
import 'package:my_marvel_list/utils/marvel_comics_api_utils.dart';

part 'series_details_store.g.dart';

class SeriesDetailsStore extends _SeriesDetailsStore with _$SeriesDetailsStore {
  SeriesDetailsStore(final Series selectedSeries) {
    super.selectedSeries = selectedSeries;
  }
}

abstract class _SeriesDetailsStore with Store {
  @observable
  late Series selectedSeries;

  @observable
  bool isLoading = false;

  @observable
  ObservableList<Character> loadedCharacters = ObservableList<Character>();

  @observable
  bool isError = false;

  @observable
  int total = 0;

  @observable
  int offset = 0;

  @computed
  bool get isEverythingLoaded =>
      !isLoading && !isError && loadedCharacters.length == total;

  @action
  Future<void> loadCharacters(final LoadingMode loadingMode) async {
    if (isLoading) {
      return;
    }
    if (loadingMode == LoadingMode.loadIfNotLoaded &&
        loadedCharacters.isNotEmpty) {
      return;
    }
    if (loadingMode == LoadingMode.reload ||
        (loadingMode == LoadingMode.loadIfNotLoaded &&
            loadedCharacters.isEmpty)) {
      offset = 0;
      loadedCharacters.clear();
    }
    isError = false;
    isLoading = true;
    try {
      final http.Response response = await http.get(
        MarvelComicsApiUtils.createUri(
            '/series/${selectedSeries.id}/characters',
            offset, <String, dynamic>{}),
      );
      final Map<String, dynamic> body = jsonDecode(response.body);
      final Map<String, dynamic> data = body['data'];
      final List<dynamic> results = data['results'];
      for (final result in results) {
        loadedCharacters.add(
          Character.fromJson(result),
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
