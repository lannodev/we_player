import 'package:dio/dio.dart';
import 'package:flutter/material.dart' show PageStorageKey, Widget;
import 'package:flutter_modular/flutter_modular.dart';
import 'package:we_player/app/modules/album/album_module.dart';
import 'package:we_player/app/modules/album/album_page.dart';

import '../../shared/stores/explore_store.dart';
import '../../shared/stores/favorite_store.dart';
import '../../shared/stores/player_store.dart';
import 'explore_controller.dart';
import 'explore_page.dart';
import 'repositories/explore_repository.dart';

class ExploreModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ExploreController(
              i.get<ExploreRepository>(),
              i.get<FavoriteStore>(),
              i.get<ExploreStore>(),
              i.get<PlayerStore>(),
            )),
        Bind((i) => ExploreRepository(i.get<Dio>())),
      ];

  static Inject get to => Inject<ExploreModule>.of();

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (_, args) => ExplorePage()),
        ModularRouter('/album', module: AlbumModule(), transition: TransitionType.fadeIn),
      ];
}
