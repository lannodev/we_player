import 'package:dio/dio.dart';
import 'package:flutter_config/flutter_config.dart';

import '../../shared/models/music_model.dart';
import '../../shared/utils/constants.dart';

class PlayerRepository {
  final Dio dio;
  PlayerRepository(this.dio);

  Future<String> getMusicUrl({String id}) async {
    try {
      dio.options.headers['User-Agent'] = kUserAgent;
      var _formData = FormData.fromMap({
        "v": kApiVersion,
        "access_token": FlutterConfig.get('TOKEN'),
        "https": 1,
        "audios": id,
        "lang": "pt-br",
      });

      final _url = '$kMusicApiUrl' 'method/audio.getById';
      final _jsonString = await dio.post(_url, data: _formData);
      final _json = _jsonString.data["response"][0];
      final _music = MusicModel.fromJson(_json);

      return _music.url;
    } on DioError catch (e) {
      print(e.message);
      return null;
    }
  }
}
