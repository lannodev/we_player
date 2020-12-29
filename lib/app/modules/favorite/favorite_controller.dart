import 'package:flutter/material.dart' show TextEditingController;
import 'package:mobx/mobx.dart';

import '../../shared/stores/favorite_store.dart';
import '../../shared/stores/player_store.dart';

part 'favorite_controller.g.dart';

class FavoriteController = _FavoriteControllerBase with _$FavoriteController;

abstract class _FavoriteControllerBase with Store {
  TextEditingController searchController = TextEditingController();
  final FavoriteStore store;
  final PlayerStore playerStore;
  // Constructor
  _FavoriteControllerBase(this.store, this.playerStore);
}
