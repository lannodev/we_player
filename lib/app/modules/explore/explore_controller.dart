import 'package:mobx/mobx.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../shared/interface/explore_model_interface.dart';
import '../../shared/stores/explore_store.dart';
import '../../shared/stores/favorite_store.dart';
import '../../shared/stores/player_store.dart';
import 'repositories/explore_repository.dart';

part 'explore_controller.g.dart';

class ExploreController = _ExploreControllerBase with _$ExploreController;

abstract class _ExploreControllerBase with Store {
  final ExploreRepository repository;
  final FavoriteStore favoriteStore;
  final ExploreStore store;
  final PlayerStore playerStore;
  final RefreshController refreshController = RefreshController(initialRefresh: false);

  _ExploreControllerBase(
    this.repository,
    this.favoriteStore,
    this.store,
    this.playerStore,
  ) {
    loadExplore();
  }

  // Explore list
  ObservableFuture<List<IExplore>> exploreList = ObservableFuture.value([]);

  ObservableList<IExplore> exploreList2 = ObservableList<IExplore>();

  // Load Explore list from API
  @action
  Future<void> loadExplore() async {
    try {
      exploreList = repository.getExplore().then((value) {
        exploreList2 = ObservableList<IExplore>()..addAll(value);
        refreshController.refreshCompleted();
      }).asObservable();
    } on Exception catch (e) {
      print("ERROR: $e");
      refreshController.refreshFailed();
      return null;
    }
  }

  // Load More Explore list with pagination
  @action
  Future<void> loadMoreExplore() async {
    try {
      await repository.getExplore(firstLoad: false).then((value) {
        if (value.length == 0) refreshController.loadNoData();
        exploreList2.addAll(value);
        refreshController.loadComplete();
      });
    } on Exception catch (e) {
      print("ERROR: $e");
      refreshController.loadFailed();
      return null;
    }
  }
}
