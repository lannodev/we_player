import 'dart:async';
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:mobx/mobx.dart';
import 'package:we_slide/we_slide.dart';
import '../../shared/stores/favorite_store.dart';
import '../../shared/stores/player_store.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  //flutter_connectivity
  final Connectivity _connectivity = Connectivity();
  final FavoriteStore favoriteStore;
  final PlayerStore player;
  WeSlideController wsController = WeSlideController();

  // Constructor
  _HomeControllerBase(this.favoriteStore, this.player) {
    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  // Observables
  @observable
  bool showNavigationBar;
  @observable
  int indexPage = 0;
  @observable
  bool hasConnection = false;
  @observable
  bool isPanelVisible = false;

  // Actions
  @action
  void setPage(int index) => indexPage = index;

  // Check Internet Connection
  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.none:
        hasConnection = false;
        break;
      case ConnectivityResult.mobile:
      case ConnectivityResult.wifi:
        try {
          final result = await InternetAddress.lookup('google.com');
          if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
            hasConnection = true;
          } else {
            hasConnection = false;
          }
        } on SocketException catch (_) {
          hasConnection = false;
        }
    }
  }
}
