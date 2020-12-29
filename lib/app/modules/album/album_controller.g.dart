// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AlbumController on _AlbumControllerBase, Store {
  final _$paletteColorAtom = Atom(name: '_AlbumControllerBase.paletteColor');

  @override
  Color get paletteColor {
    _$paletteColorAtom.reportRead();
    return super.paletteColor;
  }

  @override
  set paletteColor(Color value) {
    _$paletteColorAtom.reportWrite(value, super.paletteColor, () {
      super.paletteColor = value;
    });
  }

  final _$playlistAtom = Atom(name: '_AlbumControllerBase.playlist');

  @override
  List<MusicModel> get playlist {
    _$playlistAtom.reportRead();
    return super.playlist;
  }

  @override
  set playlist(List<MusicModel> value) {
    _$playlistAtom.reportWrite(value, super.playlist, () {
      super.playlist = value;
    });
  }

  final _$updatePaletteColorAsyncAction =
      AsyncAction('_AlbumControllerBase.updatePaletteColor');

  @override
  Future<void> updatePaletteColor() {
    return _$updatePaletteColorAsyncAction
        .run(() => super.updatePaletteColor());
  }

  final _$getAllMusicAsyncAction =
      AsyncAction('_AlbumControllerBase.getAllMusic');

  @override
  Future<void> getAllMusic() {
    return _$getAllMusicAsyncAction.run(() => super.getAllMusic());
  }

  @override
  String toString() {
    return '''
paletteColor: ${paletteColor},
playlist: ${playlist}
    ''';
  }
}
