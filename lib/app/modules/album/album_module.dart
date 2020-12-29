import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/stores/player_store.dart';
import 'album_controller.dart';
import 'album_page.dart';
import 'repositories/album_repository.dart';

class AlbumModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AlbumController(
              repository: i.get<AlbumRepository>(),
              album: i.args.data,
              playerStore: i.get<PlayerStore>(),
            )),
        Bind((i) => AlbumRepository(i.get<Dio>())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => AlbumPage(), transition: TransitionType.fadeIn),
      ];

  static Inject get to => Inject<AlbumModule>.of();
}
