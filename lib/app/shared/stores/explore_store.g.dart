// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'explore_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ExploreStore on _ExploreStoreBase, Store {
  final _$recentListAtom = Atom(name: '_ExploreStoreBase.recentList');

  @override
  ObservableList<MusicModel> get recentList {
    _$recentListAtom.reportRead();
    return super.recentList;
  }

  @override
  set recentList(ObservableList<MusicModel> value) {
    _$recentListAtom.reportWrite(value, super.recentList, () {
      super.recentList = value;
    });
  }

  final _$_initAsyncAction = AsyncAction('_ExploreStoreBase._init');

  @override
  Future _init() {
    return _$_initAsyncAction.run(() => super._init());
  }

  final _$saveRecentPlayedMusicAsyncAction =
      AsyncAction('_ExploreStoreBase.saveRecentPlayedMusic');

  @override
  Future<void> saveRecentPlayedMusic() {
    return _$saveRecentPlayedMusicAsyncAction
        .run(() => super.saveRecentPlayedMusic());
  }

  final _$_ExploreStoreBaseActionController =
      ActionController(name: '_ExploreStoreBase');

  @override
  void addRecentPlayedMusic(MusicModel music) {
    final _$actionInfo = _$_ExploreStoreBaseActionController.startAction(
        name: '_ExploreStoreBase.addRecentPlayedMusic');
    try {
      return super.addRecentPlayedMusic(music);
    } finally {
      _$_ExploreStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
recentList: ${recentList}
    ''';
  }
}
