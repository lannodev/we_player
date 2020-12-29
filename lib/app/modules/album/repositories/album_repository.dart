import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';

import '../../../shared/models/music_model.dart';
import '../../../shared/utils/constants.dart';

class AlbumRepository {
  final Dio dio;
  AlbumRepository(this.dio);

  Future<List<MusicModel>> fetchAlbumMusic({@required int id, @required int ownerId, @required String key}) async {
    try {
      // Dio Header
      dio.options.headers['User-Agent'] = kUserAgent;
      // Params
      var _formData = FormData.fromMap({
        "v": kApiVersion,
        "access_token": FlutterConfig.get('TOKEN'),
        "https": 1,
        "ref": "recommendations",
        "extended": 1,
        "lang": "pt-br",
        "id": id,
        "owner_id": ownerId,
        "access_key": key,
        "count": 50,
        "need_blocks": 0,
        "need_playlist": 0
      });
      //
      final _url = '$kMusicApiUrl' 'method/execute.getPlaylist';
      final _response = await dio.post(_url, data: _formData);

      return (_response.data["response"]["audios"] as List).map((item) => MusicModel.fromJson(item)).toList();
    } on DioError catch (e) {
      print(e.message);
      return null;
    }
  }
}
