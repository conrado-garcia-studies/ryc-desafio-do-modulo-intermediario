// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MyListStore on _MyListStore, Store {
  late final _$isLoadingAtom =
      Atom(name: '_MyListStore.isLoading', context: context);

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

  late final _$loadedStatusToSeriesAtom =
      Atom(name: '_MyListStore.loadedStatusToSeries', context: context);

  @override
  ObservableMap<MySeriesStatus, List<MySeries>> get loadedStatusToSeries {
    _$loadedStatusToSeriesAtom.reportRead();
    return super.loadedStatusToSeries;
  }

  @override
  set loadedStatusToSeries(
      ObservableMap<MySeriesStatus, List<MySeries>> value) {
    _$loadedStatusToSeriesAtom.reportWrite(value, super.loadedStatusToSeries,
        () {
      super.loadedStatusToSeries = value;
    });
  }

  late final _$isErrorAtom =
      Atom(name: '_MyListStore.isError', context: context);

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

  late final _$loadStatusToSeriesAsyncAction =
      AsyncAction('_MyListStore.loadStatusToSeries', context: context);

  @override
  Future<void> loadStatusToSeries(LoadingMode loadingMode) {
    return _$loadStatusToSeriesAsyncAction
        .run(() => super.loadStatusToSeries(loadingMode));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
loadedStatusToSeries: ${loadedStatusToSeries},
isError: ${isError}
    ''';
  }
}
