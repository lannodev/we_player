import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../../shared/models/music_model.dart';

class MusicRepository {
  final Dio dio;

  MusicRepository(this.dio);

  Future<List<MusicModel>> getAllMusics({@required String filter, @required int page}) async {
    var _list = [];

    var _formData = FormData.fromMap({
      "q": filter,
      "page": page,
      "sort": 0,
    });

    try {
      var _response = await dio.post('', data: _formData);
      final jsonData = jsonDecode(_response.data.substring(1, (_response.data.length - 2)));

      for (var json in jsonData['response'] as List) {
        if (json != "apple") {
          final model = MusicModel.fromJson(json);
          _list.add(model);
        }
      }
    } on DioError catch (e) {
      throw (e.message);
    }

    return _list;
  }
}
