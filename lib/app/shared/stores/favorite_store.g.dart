// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FavoriteStore on _FavoriteStoreBase, Store {
  final _$favoriteListAtom = Atom(name: '_FavoriteStoreBase.favoriteList');

  @override
  ObservableList<MusicModel> get favoriteList {
    _$favoriteListAtom.reportRead();
    return super.favoriteList;
  }

  @override
  set favoriteList(ObservableList<MusicModel> value) {
    _$favoriteListAtom.reportWrite(value, super.favoriteList, () {
      super.favoriteList = value;
    });
  }

  final _$isFavoriteAtom = Atom(name: '_FavoriteStoreBase.isFavorite');

  @override
  bool get isFavorite {
    _$isFavoriteAtom.reportRead();
    return super.isFavorite;
  }

  @override
  set isFavorite(bool value) {
    _$isFavoriteAtom.reportWrite(value, super.isFavorite, () {
      super.isFavorite = value;
    });
  }

  final _$_initAsyncAction = AsyncAction('_FavoriteStoreBase._init');

  @override
  Future _init() {
    return _$_initAsyncAction.run(() => super._init());
  }

  final _$saveDataAsyncAction = AsyncAction('_FavoriteStoreBase.saveData');

  @override
  Future<void> saveData() {
    return _$saveDataAsyncAction.run(() => super.saveData());
  }

  final _$_FavoriteStoreBaseActionController =
      ActionController(name: '_FavoriteStoreBase');

  @override
  void addFavoriteMusic(MusicModel newMusic) {
    final _$actionInfo = _$_FavoriteStoreBaseActionController.startAction(
        name: '_FavoriteStoreBase.addFavoriteMusic');
    try {
      return super.addFavoriteMusic(newMusic);
    } finally {
      _$_FavoriteStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool hasFavoriteMusic(MusicModel music) {
    final _$actionInfo = _$_FavoriteStoreBaseActionController.startAction(
        name: '_FavoriteStoreBase.hasFavoriteMusic');
    try {
      return super.hasFavoriteMusic(music);
    } finally {
      _$_FavoriteStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
favoriteList: ${favoriteList},
isFavorite: ${isFavorite}
    ''';
  }
}
