import 'package:flutter/material.dart' show Widget;
import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/stores/favorite_store.dart';
import '../../shared/stores/player_store.dart';
import 'favorite_controller.dart';
import 'favorite_page.dart';

class FavoriteModule extends WidgetModule {
  @override
  List<Bind> get binds => [
        Bind((i) => FavoriteController(
              i.get<FavoriteStore>(),
              i.get<PlayerStore>(),
            )),
      ];

  static Inject get to => Inject<FavoriteModule>.of();

  @override
  Widget get view => FavoritesPage();
}
