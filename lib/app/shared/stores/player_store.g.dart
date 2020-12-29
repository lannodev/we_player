// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PlayerStore on _PlayerStoreBase, Store {
  Computed<String> _$durationTimeComputed;

  @override
  String get durationTime =>
      (_$durationTimeComputed ??= Computed<String>(() => super.durationTime,
              name: '_PlayerStoreBase.durationTime'))
          .value;
  Computed<String> _$remainingTimeComputed;

  @override
  String get remainingTime =>
      (_$remainingTimeComputed ??= Computed<String>(() => super.remainingTime,
              name: '_PlayerStoreBase.remainingTime'))
          .value;

  final _$durationAtom = Atom(name: '_PlayerStoreBase.duration');

  @override
  Duration get duration {
    _$durationAtom.reportRead();
    return super.duration;
  }

  @override
  set duration(Duration value) {
    _$durationAtom.reportWrite(value, super.duration, () {
      super.duration = value;
    });
  }

  final _$positionAtom = Atom(name: '_PlayerStoreBase.position');

  @override
  Duration get position {
    _$positionAtom.reportRead();
    return super.position;
  }

  @override
  set position(Duration value) {
    _$positionAtom.reportWrite(value, super.position, () {
      super.position = value;
    });
  }

  final _$currentMusicAtom = Atom(name: '_PlayerStoreBase.currentMusic');

  @override
  MusicModel get currentMusic {
    _$currentMusicAtom.reportRead();
    return super.currentMusic;
  }

  @override
  set currentMusic(MusicModel value) {
    _$currentMusicAtom.reportWrite(value, super.currentMusic, () {
      super.currentMusic = value;
    });
  }

  final _$currentMusicIndexAtom =
      Atom(name: '_PlayerStoreBase.currentMusicIndex');

  @override
  int get currentMusicIndex {
    _$currentMusicIndexAtom.reportRead();
    return super.currentMusicIndex;
  }

  @override
  set currentMusicIndex(int value) {
    _$currentMusicIndexAtom.reportWrite(value, super.currentMusicIndex, () {
      super.currentMusicIndex = value;
    });
  }

  final _$isRepeatAtom = Atom(name: '_PlayerStoreBase.isRepeat');

  @override
  bool get isRepeat {
    _$isRepeatAtom.reportRead();
    return super.isRepeat;
  }

  @override
  set isRepeat(bool value) {
    _$isRepeatAtom.reportWrite(value, super.isRepeat, () {
      super.isRepeat = value;
    });
  }

  final _$isShuffleAtom = Atom(name: '_PlayerStoreBase.isShuffle');

  @override
  bool get isShuffle {
    _$isShuffleAtom.reportRead();
    return super.isShuffle;
  }

  @override
  set isShuffle(bool value) {
    _$isShuffleAtom.reportWrite(value, super.isShuffle, () {
      super.isShuffle = value;
    });
  }

  final _$isPlayingAtom = Atom(name: '_PlayerStoreBase.isPlaying');

  @override
  bool get isPlaying {
    _$isPlayingAtom.reportRead();
    return super.isPlaying;
  }

  @override
  set isPlaying(bool value) {
    _$isPlayingAtom.reportWrite(value, super.isPlaying, () {
      super.isPlaying = value;
    });
  }

  final _$playlistAtom = Atom(name: '_PlayerStoreBase.playlist');

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

  final _$normalPlaylistAtom = Atom(name: '_PlayerStoreBase.normalPlaylist');

  @override
  List<MusicModel> get normalPlaylist {
    _$normalPlaylistAtom.reportRead();
    return super.normalPlaylist;
  }

  @override
  set normalPlaylist(List<MusicModel> value) {
    _$normalPlaylistAtom.reportWrite(value, super.normalPlaylist, () {
      super.normalPlaylist = value;
    });
  }

  final _$shufflePlaylistAtom = Atom(name: '_PlayerStoreBase.shufflePlaylist');

  @override
  List<MusicModel> get shufflePlaylist {
    _$shufflePlaylistAtom.reportRead();
    return super.shufflePlaylist;
  }

  @override
  set shufflePlaylist(List<MusicModel> value) {
    _$shufflePlaylistAtom.reportWrite(value, super.shufflePlaylist, () {
      super.shufflePlaylist = value;
    });
  }

  final _$playAsyncAction = AsyncAction('_PlayerStoreBase.play');

  @override
  Future<void> play({int index, bool changePage}) {
    return _$playAsyncAction
        .run(() => super.play(index: index, changePage: changePage));
  }

  final _$pauseAsyncAction = AsyncAction('_PlayerStoreBase.pause');

  @override
  Future<void> pause() {
    return _$pauseAsyncAction.run(() => super.pause());
  }

  final _$resumeAsyncAction = AsyncAction('_PlayerStoreBase.resume');

  @override
  Future<void> resume() {
    return _$resumeAsyncAction.run(() => super.resume());
  }

  final _$_PlayerStoreBaseActionController =
      ActionController(name: '_PlayerStoreBase');

  @override
  void setPlaylist(List<MusicModel> _list, int _index) {
    final _$actionInfo = _$_PlayerStoreBaseActionController.startAction(
        name: '_PlayerStoreBase.setPlaylist');
    try {
      return super.setPlaylist(_list, _index);
    } finally {
      _$_PlayerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void nextMusic() {
    final _$actionInfo = _$_PlayerStoreBaseActionController.startAction(
        name: '_PlayerStoreBase.nextMusic');
    try {
      return super.nextMusic();
    } finally {
      _$_PlayerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void prevMusic() {
    final _$actionInfo = _$_PlayerStoreBaseActionController.startAction(
        name: '_PlayerStoreBase.prevMusic');
    try {
      return super.prevMusic();
    } finally {
      _$_PlayerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setShuffle() {
    final _$actionInfo = _$_PlayerStoreBaseActionController.startAction(
        name: '_PlayerStoreBase.setShuffle');
    try {
      return super.setShuffle();
    } finally {
      _$_PlayerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setRepeat() {
    final _$actionInfo = _$_PlayerStoreBaseActionController.startAction(
        name: '_PlayerStoreBase.setRepeat');
    try {
      return super.setRepeat();
    } finally {
      _$_PlayerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void seekToSecond(double second) {
    final _$actionInfo = _$_PlayerStoreBaseActionController.startAction(
        name: '_PlayerStoreBase.seekToSecond');
    try {
      return super.seekToSecond(second);
    } finally {
      _$_PlayerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onPageChange(int pageIndex) {
    final _$actionInfo = _$_PlayerStoreBaseActionController.startAction(
        name: '_PlayerStoreBase.onPageChange');
    try {
      return super.onPageChange(pageIndex);
    } finally {
      _$_PlayerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
duration: ${duration},
position: ${position},
currentMusic: ${currentMusic},
currentMusicIndex: ${currentMusicIndex},
isRepeat: ${isRepeat},
isShuffle: ${isShuffle},
isPlaying: ${isPlaying},
playlist: ${playlist},
normalPlaylist: ${normalPlaylist},
shufflePlaylist: ${shufflePlaylist},
durationTime: ${durationTime},
remainingTime: ${remainingTime}
    ''';
  }
}
