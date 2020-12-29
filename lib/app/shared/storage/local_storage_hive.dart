import 'dart:async';
import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import '../../shared/models/music_model.dart';
import 'local_storage_interface.dart';

class LocalStorageHive implements ILocalStorage {
  Completer<Box> instance = Completer<Box>();

  _init() async {
    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    var box = await Hive.openBox('db');
    instance.complete(box);
  }

  LocalStorageHive() {
    _init();
  }

  @override
  Future<List<MusicModel>> getFavoriteMusic(String key) async {
    try {
      var box = await instance.future;
      var list = json.decode(box.get(key)) as List;
      return list.map((i) => MusicModel.fromJson(i)).toList();
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future putFavoriteMusic(String key, List<MusicModel> value) async {
    var box = await instance.future;
    box.put(key, jsonEncode(value));
  }

  @override
  Future<List<MusicModel>> getRecentPlayedMusic(String key) async {
    try {
      var box = await instance.future;
      var list = json.decode(box.get(key)) as List;
      return list.map((i) => MusicModel.fromJson(i)).toList();
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future putRecentPlayedMusic(String key, List<MusicModel> value) async {
    var box = await instance.future;
    box.put(key, jsonEncode(value));
  }

  @override
  Future<String> getTheme(String key) async {
    var box = await instance.future;
    return box.get(key);
  }

  @override
  Future setTheme(String key, String value) async {
    var box = await instance.future;
    box.put(key, value);
  }
}
