import 'package:mobx/mobx.dart';
import '../models/music_model.dart';
import '../storage/local_storage_interface.dart';

part 'explore_store.g.dart';

class ExploreStore = _ExploreStoreBase with _$ExploreStore;

abstract class _ExploreStoreBase with Store {
  final ILocalStorage storage;

  // Constructor
  _ExploreStoreBase(this.storage) {
    _init();
  }

  @observable
  ObservableList<MusicModel> recentList = <MusicModel>[].asObservable();

  @action
  _init() async {
    var _list = await storage.getRecentPlayedMusic('recent_played');
    if (_list != null) {
      recentList = _list.asObservable();
    }
  }

  @action
  void addRecentPlayedMusic(MusicModel music) {
    recentList.removeWhere((song) => music.id == song.id);
    recentList.insert(0, music);
    //recentPlayedPlayedList.add(music);
    var lenght = recentList.length;
    if (lenght > 20) {
      recentList.removeAt(lenght - 1);
    }
    //recentPlayedPlayedList.clear();
    saveRecentPlayedMusic();
  }

  @action
  Future<void> saveRecentPlayedMusic() async {
    await storage.putRecentPlayedMusic('recent_played', recentList);
  }
}
