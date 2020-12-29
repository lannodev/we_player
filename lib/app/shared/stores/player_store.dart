import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart' show PageController;
import 'package:mobx/mobx.dart';
import '../../shared/models/music_model.dart';
import '../../shared/stores/explore_store.dart';
import '../../shared/stores/favorite_store.dart';

import '../repositories/player_repository.dart';

part 'player_store.g.dart';

class PlayerStore = _PlayerStoreBase with _$PlayerStore;

abstract class _PlayerStoreBase with Store {
  final AudioPlayer audioPlayer;
  final FavoriteStore favoriteStore;
  final ExploreStore exploreStore;
  final PlayerRepository repository;
  PageController pageController = PageController();

  // constructor
  _PlayerStoreBase({this.audioPlayer, this.repository, this.favoriteStore, this.exploreStore}) {
    initPlayer();
  }

  @observable
  Duration duration;
  @observable
  Duration position;
  @observable
  MusicModel currentMusic;
  @observable
  int currentMusicIndex;
  @observable
  bool isRepeat;
  @observable
  bool isShuffle;
  @observable
  bool isPlaying;
  @observable
  List<MusicModel> playlist;
  @observable
  List<MusicModel> normalPlaylist;
  @observable
  List<MusicModel> shufflePlaylist;

  @computed
  String get durationTime {
    if (position == null) return "--:--";
    var minute = position.inMinutes;
    var second = (position.inSeconds > 60) ? (position.inSeconds % 60) : position.inSeconds;
    var inSeconds = ((second < 10) ? "0$second" : "$second");
    return '$minute' ':' '$inSeconds';
  }

  @computed
  String get remainingTime {
    var rt = duration - position;
    if (rt == null) return "--:--";
    var minute = rt.inMinutes;
    var second = (rt.inSeconds > 60) ? (rt.inSeconds % 60) : rt.inSeconds;
    var inSeconds = ((second < 10) ? "0$second" : "$second");
    return '$minute' ':' '$inSeconds';
  }

  // Init Player
  void initPlayer() {
    isPlaying = false;
    duration = Duration(seconds: 0);
    position = Duration(seconds: 0);
    isRepeat = false;
    isShuffle = false;

    // onDurationChanged
    audioPlayer.onDurationChanged.listen((d) {
      duration = d;
    });

    // onAudioPositionChanged
    audioPlayer.onAudioPositionChanged.listen((p) {
      position = p;
    });

    // onPlayerStateChanged
    audioPlayer.onPlayerStateChanged.listen((s) {
      //playerState = s;
      isPlaying = s == AudioPlayerState.PLAYING;
    });

    // onPlayerCompletion
    audioPlayer.onPlayerCompletion.listen((event) {
      if (isRepeat) {
        play(index: currentMusicIndex, changePage: false);
        return;
      }
      nextMusic();
    });

    // onPlayerError
    audioPlayer.onPlayerError.listen((msg) {
      //print('audioPlayer error : $msg');
    });
  }

  // Play a new song
  @action
  Future<void> play({int index, bool changePage}) async {
    var stopResult = await audioPlayer.stop(); // when execute Audio stop and shuffle is enabled, make wrong curren tmusic (bug)
    if (stopResult == 1) {
      isPlaying = false;
    }

    currentMusic = playlist[index];
    currentMusicIndex = index;
    //String _musicId = "${currentMusic.ownerId}_${currentMusic.id}";
    //String _musicUrl = await repository.getMusicUrl(id: _musicId);
    var _musicUrl = currentMusic.url;

    if (_musicUrl.isEmpty) {
      nextMusic();
      print("This music is restricted");
      return;
    }

    //Get Encrypted ID
    // String _ownerId = Encrypt.encryptId(currentMusic.ownerId);
    // String _id = Encrypt.encryptId(currentMusic.id);
    // String _streamUrl = "$kMusicStream$_ownerId:$_id";

    var playResult = await audioPlayer.play(_musicUrl, stayAwake: true);
    if (playResult == 1) {
      isPlaying = true;
      exploreStore.addRecentPlayedMusic(currentMusic);
    }

    if (changePage) pageController.jumpToPage(index);
    //controller.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.linear);

    //Check if is favorite
    favoriteStore.hasFavoriteMusic(currentMusic);

    // Set iOS notification
    await audioPlayer.setNotification(
      title: currentMusic?.title ?? "No Title",
      duration: Duration(seconds: currentMusic.duration),
      backwardSkipInterval: Duration(seconds: 10),
      forwardSkipInterval: Duration(seconds: 10),
      artist: currentMusic?.artist ?? "No Artist",
      albumTitle: currentMusic?.album?.title ?? "No Album",
      imageUrl: currentMusic?.album?.thumb?.photo600 ?? "",
    );
  }

  // Init Playlists
  @action
  void setPlaylist(List<MusicModel> _list, int _index) {
    if (_list == null) return;

    normalPlaylist = List<MusicModel>.from(_list);
    shufflePlaylist = List<MusicModel>.from(_list);
    shufflePlaylist.shuffle();

    if (isShuffle) {
      playlist = List<MusicModel>.from(_list);
    } else {
      playlist = normalPlaylist;
    }

    var _selectedMusic = _list[_index];
    _index = playlist.indexOf(_selectedMusic);

    currentMusicIndex = _index;
    currentMusic = playlist[_index];

    play(index: _index, changePage: true);
  }

  // Pause music
  @action
  Future<void> pause() async {
    var result = await audioPlayer.pause();
    if (result == 1) {
      isPlaying = false;
    }
  }

  // Resume music
  @action
  Future<void> resume() async {
    var result = await audioPlayer.resume();
    if (result == 1) {
      isPlaying = true;
    }
  }

  // Get next music
  @action
  void nextMusic() {
    if (currentMusicIndex == (playlist.length - 1)) {
      currentMusicIndex = 0;
    } else {
      currentMusicIndex++;
    }
    play(index: currentMusicIndex, changePage: true);
  }

  // Get Previous music
  @action
  void prevMusic() {
    if (currentMusicIndex > 0) currentMusicIndex--;
    play(index: currentMusicIndex, changePage: true);
  }

  // Change Repeat
  @action
  void setShuffle() {
    isShuffle = !isShuffle;
    if (isShuffle) {
      playlist = shufflePlaylist;
    } else {
      playlist = normalPlaylist;
    }
    var _index = playlist.indexOf(currentMusic);
    currentMusicIndex = _index;
    currentMusic = playlist[_index];
    pageController.jumpToPage(_index);
  }

  // Change Shuffle
  @action
  void setRepeat() {
    isRepeat = !isRepeat;
  }

  //Advance or rewind the audio duration with seconds
  @action
  void seekToSecond(double second) {
    var d = Duration(seconds: second.toInt());
    audioPlayer.seek(d);
  }

  // Callback when page change
  @action
  void onPageChange(int pageIndex) {
    if (pageIndex == (currentMusicIndex - 1) || pageIndex == (currentMusicIndex + 1)) play(index: pageIndex, changePage: false);
  }
}
