import 'dart:async';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import '../../shared/models/music_model.dart';

import 'local_storage_interface.dart';

class LocalStorageShare implements ILocalStorage {
  Completer<SharedPreferences> instance = Completer<SharedPreferences>();

  _init() async {
    instance.complete(await SharedPreferences.getInstance());
  }

  LocalStorageShare() {
    _init();
  }

  @override
  Future<List<MusicModel>> getFavoriteMusic(String key) async {
    try {
      var shared = await instance.future;
      var list = json.decode(shared.getString(key)) as List;
      return list.map((i) => MusicModel.fromJson(i)).toList();
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future putFavoriteMusic(String key, List<MusicModel> value) async {
    var shared = await instance.future;
    shared.setString(key, jsonEncode(value));
  }

  @override
  Future<List<MusicModel>> getRecentPlayedMusic(String key) async {
    try {
      var shared = await instance.future;
      var list = json.decode(shared.getString(key)) as List;
      return list.map((i) => MusicModel.fromJson(i)).toList();
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future putRecentPlayedMusic(String key, List<MusicModel> value) async {
    var shared = await instance.future;
    shared.setString(key, jsonEncode(value));
  }

  @override
  Future<String> getTheme(String key) async {
    var shared = await instance.future;
    return shared.getString(key);
  }

  @override
  Future setTheme(String key, String value) async {
    var shared = await instance.future;
    shared.setString(key, value);
  }
}
