import '../../shared/models/music_model.dart';

abstract class ILocalStorage {
  // Favorite List
  Future<List<MusicModel>> getFavoriteMusic(String key);
  Future putFavoriteMusic(String key, List<MusicModel> value);
  // Recent Played Music List
  Future<List<MusicModel>> getRecentPlayedMusic(String key);
  Future putRecentPlayedMusic(String key, List<MusicModel> value);
  // Theme Preferences
  Future<String> getTheme(String key);
  Future setTheme(String key, String value);
}
