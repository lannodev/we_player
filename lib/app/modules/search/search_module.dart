import 'package:dio/dio.dart';
import 'package:flutter/material.dart' show Widget;
import 'package:flutter_modular/flutter_modular.dart';
import '../../shared/stores/player_store.dart';
import '../search/search_controller.dart';
import '../search/search_page.dart';

import 'repositories/music_repository.dart';

class SearchModule extends WidgetModule {
  @override
  List<Bind> get binds => [
        Bind((i) => SearchController(i.get<MusicRepository>(), i.get<PlayerStore>())),
        Bind((i) => MusicRepository(i.get<Dio>())),
      ];

  static Inject get to => Inject<SearchModule>.of();

  @override
  Widget get view => SearchPage();
}
