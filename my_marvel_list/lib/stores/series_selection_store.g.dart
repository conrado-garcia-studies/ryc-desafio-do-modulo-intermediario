// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'series_selection_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SeriesSelectionStore on _SeriesSelectionStore, Store {
  Computed<bool>? _$isEverythingLoadedComputed;

  @override
  bool get isEverythingLoaded => (_$isEverythingLoadedComputed ??=
          Computed<bool>(() => super.isEverythingLoaded,
              name: '_SeriesSelectionStore.isEverythingLoaded'))
      .value;

  late final _$isShowSearchBarAtom =
      Atom(name: '_SeriesSelectionStore.isShowSearchBar', context: context);

  @override
  bool get isShowSearchBar {
    _$isShowSearchBarAtom.reportRead();
    return super.isShowSearchBar;
  }

  @override
  set isShowSearchBar(bool value) {
    _$isShowSearchBarAtom.reportWrite(value, super.isShowSearchBar, () {
      super.isShowSearchBar = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_SeriesSelectionStore.isLoading', context: context);

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

  late final _$loadedSeriesAtom =
      Atom(name: '_SeriesSelectionStore.loadedSeries', context: context);

  @override
  ObservableList<Series> get loadedSeries {
    _$loadedSeriesAtom.reportRead();
    return super.loadedSeries;
  }

  @override
  set loadedSeries(ObservableList<Series> value) {
    _$loadedSeriesAtom.reportWrite(value, super.loadedSeries, () {
      super.loadedSeries = value;
    });
  }

  late final _$isErrorAtom =
      Atom(name: '_SeriesSelectionStore.isError', context: context);

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
      Atom(name: '_SeriesSelectionStore.total', context: context);

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
      Atom(name: '_SeriesSelectionStore.offset', context: context);

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

  late final _$loadSeriesAsyncAction =
      AsyncAction('_SeriesSelectionStore.loadSeries', context: context);

  @override
  Future<void> loadSeries(LoadingMode loadingMode) {
    return _$loadSeriesAsyncAction.run(() => super.loadSeries(loadingMode));
  }

  late final _$_SeriesSelectionStoreActionController =
      ActionController(name: '_SeriesSelectionStore', context: context);

  @override
  void showSearchBar() {
    final _$actionInfo = _$_SeriesSelectionStoreActionController.startAction(
        name: '_SeriesSelectionStore.showSearchBar');
    try {
      return super.showSearchBar();
    } finally {
      _$_SeriesSelectionStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void hideSearchBar() {
    final _$actionInfo = _$_SeriesSelectionStoreActionController.startAction(
        name: '_SeriesSelectionStore.hideSearchBar');
    try {
      return super.hideSearchBar();
    } finally {
      _$_SeriesSelectionStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isShowSearchBar: ${isShowSearchBar},
isLoading: ${isLoading},
loadedSeries: ${loadedSeries},
isError: ${isError},
total: ${total},
offset: ${offset},
isEverythingLoaded: ${isEverythingLoaded}
    ''';
  }
}
