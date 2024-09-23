// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'series_details_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SeriesDetailsStore on _SeriesDetailsStore, Store {
  Computed<bool>? _$isEverythingLoadedComputed;

  @override
  bool get isEverythingLoaded => (_$isEverythingLoadedComputed ??=
          Computed<bool>(() => super.isEverythingLoaded,
              name: '_SeriesDetailsStore.isEverythingLoaded'))
      .value;

  late final _$selectedSeriesAtom =
      Atom(name: '_SeriesDetailsStore.selectedSeries', context: context);

  @override
  Series get selectedSeries {
    _$selectedSeriesAtom.reportRead();
    return super.selectedSeries;
  }

  bool _selectedSeriesIsInitialized = false;

  @override
  set selectedSeries(Series value) {
    _$selectedSeriesAtom.reportWrite(
        value, _selectedSeriesIsInitialized ? super.selectedSeries : null, () {
      super.selectedSeries = value;
      _selectedSeriesIsInitialized = true;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_SeriesDetailsStore.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$loadedCharactersAtom =
      Atom(name: '_SeriesDetailsStore.loadedCharacters', context: context);

  @override
  ObservableList<Character> get loadedCharacters {
    _$loadedCharactersAtom.reportRead();
    return super.loadedCharacters;
  }

  @override
  set loadedCharacters(ObservableList<Character> value) {
    _$loadedCharactersAtom.reportWrite(value, super.loadedCharacters, () {
      super.loadedCharacters = value;
    });
  }

  late final _$isErrorAtom =
      Atom(name: '_SeriesDetailsStore.isError', context: context);

  @override
  bool get isError {
    _$isErrorAtom.reportRead();
    return super.isError;
  }

  @override
  set isError(bool value) {
    _$isErrorAtom.reportWrite(value, super.isError, () {
      super.isError = value;
    });
  }

  late final _$totalAtom =
      Atom(name: '_SeriesDetailsStore.total', context: context);

  @override
  int get total {
    _$totalAtom.reportRead();
    return super.total;
  }

  @override
  set total(int value) {
    _$totalAtom.reportWrite(value, super.total, () {
      super.total = value;
    });
  }

  late final _$offsetAtom =
      Atom(name: '_SeriesDetailsStore.offset', context: context);

  @override
  int get offset {
    _$offsetAtom.reportRead();
    return super.offset;
  }

  @override
  set offset(int value) {
    _$offsetAtom.reportWrite(value, super.offset, () {
      super.offset = value;
    });
  }

  late final _$loadCharactersAsyncAction =
      AsyncAction('_SeriesDetailsStore.loadCharacters', context: context);

  @override
  Future<void> loadCharacters(LoadingMode loadingMode) {
    return _$loadCharactersAsyncAction
        .run(() => super.loadCharacters(loadingMode));
  }

  @override
  String toString() {
    return '''
selectedSeries: ${selectedSeries},
isLoading: ${isLoading},
loadedCharacters: ${loadedCharacters},
isError: ${isError},
total: ${total},
offset: ${offset},
isEverythingLoaded: ${isEverythingLoaded}
    ''';
  }
}
