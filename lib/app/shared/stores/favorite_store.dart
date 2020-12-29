import 'package:mobx/mobx.dart';
import '../models/music_model.dart';
import '../storage/local_storage_interface.dart';

part 'favorite_store.g.dart';

class FavoriteStore = _FavoriteStoreBase with _$FavoriteStore;

abstract class _FavoriteStoreBase with Store {
  final ILocalStorage storage;

  _FavoriteStoreBase(this.storage) {
    _init();
  }

  @observable
  ObservableList<MusicModel> favoriteList = <MusicModel>[].asObservable();
  @observable
  bool isFavorite = false;

  @action
  _init() async {
    var _list = await storage.getFavoriteMusic('favorites');
    if (_list != null) {
      favoriteList = _list.asObservable();
    }
  }

  @action
  void addFavoriteMusic(MusicModel newMusic) {
    if (hasFavoriteMusic(newMusic)) {
      favoriteList.removeWhere((song) => newMusic.id == song.id);
      isFavorite = false;
    } else {
      favoriteList.insert(0, newMusic);
      isFavorite = true;
    }
    saveData();
  }

  @action
  bool hasFavoriteMusic(MusicModel music) {
    for (var song in favoriteList) {
      if (song.id == music.id) {
        return isFavorite = true;
      }
    }
    return isFavorite = false;
  }

  @action
  Future<void> saveData() async {
    await storage.putFavoriteMusic('favorites', favoriteList);
  }
}
