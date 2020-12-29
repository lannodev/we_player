import 'package:audioplayers/audioplayers.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_controller.dart';
import 'app_widget.dart';
import 'modules/home/home_module.dart';
import 'shared/repositories/player_repository.dart';
import 'shared/storage/local_storage_share.dart';
import 'shared/stores/explore_store.dart';
import 'shared/stores/favorite_store.dart';
import 'shared/stores/player_store.dart';
import 'shared/utils/constants.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind((i) => Dio(BaseOptions(baseUrl: kMusicApiUrl, connectTimeout: 10000))),
        Bind((i) => LocalStorageShare()),
        Bind((i) => PlayerStore(
              audioPlayer: AudioPlayer(),
              exploreStore: i.get<ExploreStore>(),
              favoriteStore: i.get<FavoriteStore>(),
              repository: i.get<PlayerRepository>(),
            )),
        Bind((i) => PlayerRepository(i.get<Dio>())),
        Bind((i) => FavoriteStore(i.get<LocalStorageShare>())),
        Bind((i) => ExploreStore(i.get<LocalStorageShare>()))
        //Bind((i) => LocalStorageHive()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', module: HomeModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
