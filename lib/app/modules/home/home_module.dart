import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/stores/favorite_store.dart';
import '../../shared/stores/player_store.dart';
import 'home_controller.dart';
import 'home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController(
              i.get<FavoriteStore>(),
              i.get<PlayerStore>(),
            )),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
