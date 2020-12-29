// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SearchController on _SearchControllerBase, Store {
  final _$searchTextAtom = Atom(name: '_SearchControllerBase.searchText');

  @override
  String get searchText {
    _$searchTextAtom.reportRead();
    return super.searchText;
  }

  @override
  set searchText(String value) {
    _$searchTextAtom.reportWrite(value, super.searchText, () {
      super.searchText = value;
    });
  }

  final _$pageAtom = Atom(name: '_SearchControllerBase.page');

  @override
  int get page {
    _$pageAtom.reportRead();
    return super.page;
  }

  @override
  set page(int value) {
    _$pageAtom.reportWrite(value, super.page, () {
      super.page = value;
    });
  }

  final _$musicListAtom = Atom(name: '_SearchControllerBase.musicList');

  @override
  ObservableFuture<List<MusicModel>> get musicList {
    _$musicListAtom.reportRead();
    return super.musicList;
  }

  @override
  set musicList(ObservableFuture<List<MusicModel>> value) {
    _$musicListAtom.reportWrite(value, super.musicList, () {
      super.musicList = value;
    });
  }

  final _$fetchMusicAsyncAction =
      AsyncAction('_SearchControllerBase.fetchMusic');

  @override
  Future<void> fetchMusic() {
    return _$fetchMusicAsyncAction.run(() => super.fetchMusic());
  }

  final _$loadMoreAsyncAction = AsyncAction('_SearchControllerBase.loadMore');

  @override
  Future<void> loadMore() {
    return _$loadMoreAsyncAction.run(() => super.loadMore());
  }

  final _$_SearchControllerBaseActionController =
      ActionController(name: '_SearchControllerBase');

  @override
  void changeSearchText(String value) {
    final _$actionInfo = _$_SearchControllerBaseActionController.startAction(
        name: '_SearchControllerBase.changeSearchText');
    try {
      return super.changeSearchText(value);
    } finally {
      _$_SearchControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
searchText: ${searchText},
page: ${page},
musicList: ${musicList}
    ''';
  }
}
