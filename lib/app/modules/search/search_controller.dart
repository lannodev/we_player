import 'package:flutter/material.dart' show TextEditingController;
import 'package:mobx/mobx.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../shared/models/music_model.dart';
import '../../shared/stores/player_store.dart';
import 'repositories/music_repository.dart';

part 'search_controller.g.dart';

class SearchController = _SearchControllerBase with _$SearchController;

abstract class _SearchControllerBase with Store {
  //Music Repository
  final MusicRepository repository;
  final PlayerStore playerStore;
  TextEditingController searchController = TextEditingController();
  RefreshController refreshController = RefreshController(initialRefresh: false);

  _SearchControllerBase(this.repository, this.playerStore);

  @observable
  String searchText = "";
  @observable
  int page = 0;
  @observable
  ObservableFuture<List<MusicModel>> musicList = ObservableFuture.value([]);

  @action
  void changeSearchText(String value) => searchText = value;

  // Get all musics using search
  @action
  Future<void> fetchMusic() async {
    if (searchText.isEmpty) return;
    try {
      page = 0;
      musicList = repository.getAllMusics(filter: searchText, page: page).asObservable();
      page++;
      refreshController.resetNoData();
      refreshController.refreshCompleted();
    } on Exception catch (e) {
      refreshController.refreshFailed();
      print(e);
      //musicList.catchError(e);
    }
  }

  // Load More Musics
  @action
  Future<void> loadMore() async {
    try {
      var tempList = await repository.getAllMusics(filter: searchText, page: page);
      if (tempList.length == 0) return refreshController.loadNoData();
      var _list = List<MusicModel>.from(musicList.value);
      _list.addAll(tempList);
      musicList = ObservableFuture.value(_list);
      page++;
      refreshController.loadComplete();
    } on Exception catch (e) {
      //musicList.catchError(e);
      print(e);
      refreshController.refreshFailed();
    }
  }
}
