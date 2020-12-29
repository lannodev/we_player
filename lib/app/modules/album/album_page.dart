import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../modules/album/album_controller.dart';
import '../../shared/widgets/custom_list_item.dart';
import 'widget/custom_sliver_bottom.dart';
import 'widget/custom_sliver_header.dart';

class AlbumPage extends StatefulWidget {
  //final PlayListModel album;

  const AlbumPage({Key key}) : super(key: key);

  @override
  _AlbumPageState createState() => _AlbumPageState();
}

class _AlbumPageState extends ModularState<AlbumPage, AlbumController> {
  @override
  Widget build(BuildContext context) {
    final _colorScheme = Theme.of(context).colorScheme;
    final _textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: _colorScheme.background,
      body: FutureBuilder(
        future: controller.getAllMusic(),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return NestedScrollView(
            physics: BouncingScrollPhysics(),
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverPersistentHeader(
                  delegate: CustomSliverHeader(album: controller.album),
                  floating: true,
                  pinned: true,
                ),
                SliverOverlapAbsorber(
                  handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                  sliver: SliverPersistentHeader(
                    pinned: true,
                    delegate: CustomSliverBottom(
                      max: 45.0,
                      min: 45.0,
                      widget: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [_colorScheme.background, _colorScheme.background.withOpacity(0.1)],
                          ),
                        ),
                        child: Center(
                          child: RaisedButton(
                            elevation: 0.0,
                            color: _colorScheme.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0),
                              side: BorderSide(color: _colorScheme.primary),
                            ),
                            onPressed: () {
                              controller.playerStore.isShuffle = true;
                              controller.playerStore.setPlaylist(controller.playlist, 0);
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
                              child: Text(
                                'ORDEM ALEATÓRIA',
                                style: _textTheme.subtitle2.apply(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ];
            },
            body: AnimationLimiter(
              child: ListView.builder(
                padding: EdgeInsets.only(top: 60),
                physics: BouncingScrollPhysics(),
                itemCount: controller.playlist.length,
                itemBuilder: (context, index) {
                  final _music = controller.playlist[index];
                  final _isSelect = _music.id == (controller.playerStore.currentMusic?.id ?? 0);

                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(milliseconds: 375),
                    child: SlideAnimation(
                      verticalOffset: 50.0,
                      child: FadeInAnimation(
                        child: GestureDetector(
                          onTap: () {
                            if (_music.url.isEmpty) {
                              print("This music is licensed?: ${_music.title}");
                              return;
                            }
                            controller.playerStore.setPlaylist(controller.playlist, index);
                          },
                          child: CustomListItem(
                            music: _music,
                            isSeleted: _isSelect,
                            restricted: _music.url.isEmpty,
                            playerStore: controller.playerStore,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
