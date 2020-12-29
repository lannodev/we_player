import 'package:dio/dio.dart';
import 'package:flutter_config/flutter_config.dart';

import '../../../shared/interface/explore_model_interface.dart';
import '../../../shared/models/explore_music_model.dart';
import '../../../shared/models/explore_playlist_model.dart';
import '../../../shared/utils/constants.dart';

class ExploreRepository {
  final Dio dio;
  String _startFrom;
  ExploreRepository(this.dio);

  Future<List<IExplore>> getExplore({bool firstLoad = true}) async {
    // Dio Header
    dio.options.headers['User-Agent'] = kUserAgent;

    print("START FROM: $_startFrom");
    // Check if
    //if (!firstLoad && _startFrom.isEmpty) return [];

    // Params
    var _formData = FormData.fromMap({
      "v": kApiVersion,
      "access_token": FlutterConfig.get('TOKEN'),
      "https": 1,
      "ref": "recommendations",
      "extended": 1,
      "lang": "pt-br",
      "count": 5,
      "need_blocks": 0,
      "start_from": firstLoad ? null : _startFrom,
    });

    final _url = '$kMusicApiUrl' 'method/audio.getCatalog';
    final _response = await dio.post(_url, data: _formData);

    // save next position to get more data
    _startFrom = _response.data["response"]["next_from"];

    print("NEXT FROM: $_startFrom");

    return (_response.data["response"]["items"] as List).map((item) {
      if (item["type"] == "playlists") {
        return ExplorePlaylistModel.fromJson(item);
      } else {
        return ExploreMusicModel.fromJson(item);
      }
    }).toList();
  }
}
