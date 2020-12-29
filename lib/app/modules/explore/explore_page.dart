import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../shared/models/explore_music_model.dart';
import '../../shared/models/explore_playlist_model.dart';
import '../../shared/widgets/infinite_scroll_footer.dart';
import 'explore_controller.dart';
import 'widget/album.dart';
import 'widget/music.dart';

class ExplorePage extends StatefulWidget {
  //ExplorePage({Key key}) : super(key: key);

  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends ModularState<ExplorePage, ExploreController> {
  //use 'controller' variable to access controller

  final _scrollController = ScrollController();
  final _settingsButtonOpacity = ValueNotifier<double>(1.0);

  @override
  void initState() {
    // Listener to scroll Controller
    _scrollController.addListener(() {
      // Change settings opacity
      if (_settingsButtonOpacity.value == 1.0 && _scrollController.offset > 20) {
        _settingsButtonOpacity.value = 0.0;
      } else if (_settingsButtonOpacity.value == 0.0 && _scrollController.offset < 20) {
        _settingsButtonOpacity.value = 1.0;
      }

      // Get more Explore list
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        //controller.loadMoreExplore();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _settingsButtonOpacity.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              _colorScheme.primary.withOpacity(0.50),
              _colorScheme.background.withOpacity(0.10),
            ],
            stops: [0.01, 0.6],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                    right: 5.0,
                    top: 24.0,
                    child: ValueListenableBuilder(
                      valueListenable: _settingsButtonOpacity,
                      builder: (_, value, __) {
                        return AnimatedOpacity(
                          duration: Duration(milliseconds: 200),
                          opacity: value,
                          child: IconButton(
                            icon: Icon(
                              Icons.settings,
                              color: _colorScheme.onPrimary.withOpacity(0.5),
                            ),
                            onPressed: controller.loadMoreExplore,
                          ),
                        );
                      },
                    ),
                  ),
                  Observer(
                    builder: (_) {
                      if (controller.exploreList.status == FutureStatus.pending) {
                        return Center(child: CircularProgressIndicator());
                      }

                      if (controller.exploreList.status == FutureStatus.rejected) {
                        return Center(
                          child: FlatButton(
                            child: Text("Click to load"),
                            onPressed: controller.loadExplore,
                          ),
                        );
                      }

                      return SmartRefresher(
                        controller: controller.refreshController,
                        header: WaterDropHeader(
                          waterDropColor: _colorScheme.primary,
                        ),
                        footer: InfiniteScrollFooter(),
                        //onRefresh: controller.loadExplore,
                        //onLoading: controller.loadMoreExplore,
                        enablePullUp: true,
                        child: ListView.builder(
                          itemCount: controller.exploreList2.length,
                          addAutomaticKeepAlives: true,
                          controller: _scrollController,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            final item = controller.exploreList2[index];

                            if (item is ExplorePlaylistModel) {
                              return Album(list: item, key: ValueKey(item.id), initialList: index == 0);
                            } else if (item is ExploreMusicModel) {
                              return Music(audioList: item, key: ValueKey(item.id), initialList: index == 0);
                            }
                            return Container();
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
