import 'dart:ui';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../../../generated/l10n.dart';
import '../../../shared/models/music_model.dart';
import '../home_controller.dart';
import '../pages/music_page.dart';

class PlayerPage extends StatefulWidget {
  final Function onTap;

  PlayerPage({
    this.onTap,
  });

  @override
  _PlayerPageState createState() => _PlayerPageState();
}

class _PlayerPageState extends ModularState<PlayerPage, HomeController> {
  double progress() => max() > (controller.player.position?.inSeconds ?? 0).toDouble() ? (controller.player.position?.inSeconds ?? 0).toDouble() : 0.0;
  double max() => (controller.player.duration.inSeconds ?? 0.0).toDouble();
  String get _albumImage => controller.player.currentMusic?.album?.thumb?.photo600 ?? null;
  Color _paletteColor = Colors.black;
  int get playlistLenth => controller.player?.playlist?.length ?? 0;

  @override
  void initState() {
    super.initState();
    reaction<MusicModel>(
      (r) => controller.player.currentMusic,
      (value) {
        _updatePaletteColor();
      },
    );

    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   _updatePaletteColor();
    // });
  }

  // Update Backgroun color
  Future<void> _updatePaletteColor() async {
    if (_albumImage == null) return;
    var _imageProvider = NetworkImage(_albumImage);
    var generator = await PaletteGenerator.fromImageProvider(
      _imageProvider,
      size: Size(300, 300),
      region: Offset.zero & Size(300, 300),
      maximumColorCount: 20,
    );
    _paletteColor = generator?.mutedColor?.color ?? Colors.black;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Observer(
      builder: (_) {
        return SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height,
                color: _paletteColor,
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [colorScheme.background.withOpacity(0.0), colorScheme.background.withOpacity(0.9)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.0, 1.0],
                  ),
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height - 150,
                      child: Stack(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              SizedBox(height: MediaQuery.of(context).padding.top),
                              // Header
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 12),
                                child: Row(
                                  children: <Widget>[
                                    IconButton(
                                      onPressed: widget.onTap,
                                      iconSize: 32,
                                      icon: Icon(
                                        Icons.arrow_drop_down,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: <Widget>[
                                          Text(
                                            Translate.of(context).playerPageTitle,
                                            overflow: TextOverflow.ellipsis,
                                            style: textTheme.bodyText1.apply(color: Colors.white),
                                          ),
                                          Text(
                                            controller.player.currentMusic?.album?.title ?? "No Album",
                                            overflow: TextOverflow.ellipsis,
                                            style: textTheme.bodyText2.apply(color: Colors.white.withOpacity(0.5)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        MusicPage.show(context, controller.player.currentMusic);
                                      },
                                      icon: Icon(
                                        Icons.more_horiz,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              //Spacer(),
                              Visibility(
                                visible: MediaQuery.of(context).size.height > 320,
                                child: Expanded(
                                  child: PageView.builder(
                                    physics: BouncingScrollPhysics(),
                                    controller: controller.player.pageController,
                                    onPageChanged: controller.player.onPageChange,
                                    itemCount: playlistLenth,
                                    itemBuilder: (context, index) {
                                      return Align(
                                        alignment: Alignment.center,
                                        child: SizedBox(
                                          width: MediaQuery.of(context).size.width * 0.7,
                                          height: MediaQuery.of(context).size.width * 0.7,
                                          child: Card(
                                            color: colorScheme.surface,
                                            elevation: 3.0,
                                            child: Stack(
                                              fit: StackFit.expand,
                                              children: <Widget>[
                                                Center(
                                                  child: Icon(
                                                    Icons.album,
                                                    color: colorScheme.onPrimary.withOpacity(0.1), //Theme.of(context).accentColor.withOpacity(0.1),
                                                    size: 200,
                                                  ),
                                                ),
                                                Builder(
                                                  builder: (context) {
                                                    final _image = controller.player?.playlist[index]?.album?.thumb?.photo600 ?? null;
                                                    if (_image != null) {
                                                      return FadeInImage.memoryNetwork(
                                                        placeholder: kTransparentImage,
                                                        image: _image,
                                                        fit: BoxFit.cover,
                                                      );
                                                    }
                                                    return Container();
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              //Spacer(),
                              // Music info
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            controller.player.currentMusic?.title ?? "No Music",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: textTheme.headline5.apply(color: colorScheme.onPrimary),
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            controller.player.currentMusic?.artist ?? "No Artist",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: textTheme.headline6.apply(color: colorScheme.onPrimary.withOpacity(0.5)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      children: <Widget>[
                                        GestureDetector(
                                          onTap: () {
                                            controller.favoriteStore.addFavoriteMusic(controller.player.currentMusic);
                                          },
                                          child: Container(
                                            width: 50.0,
                                            height: 50.0,
                                            child: FlareActor(
                                              "assets/flare/favorite_heart.flr",
                                              alignment: Alignment.center,
                                              fit: BoxFit.none,
                                              color: colorScheme.primary,
                                              animation: controller.favoriteStore.isFavorite ? 'Favorite' : 'Unfavorite',
                                            ),
                                          ),
                                        ),
                                        // IconButton(
                                        //   highlightColor: Colors.transparent,
                                        //   splashColor: Colors.transparent,
                                        //   onPressed: () {
                                        //     favoritesController.addFavoriteMusic(player.currentMusic);
                                        //   },
                                        //   icon: favoritesController.isFavorite
                                        //       ? Icon(
                                        //           Icons.favorite,
                                        //           color: Theme.of(context).primaryColor,
                                        //         )
                                        //       : Icon(
                                        //           Icons.favorite_border,
                                        //           color: Colors.white.withOpacity(0.4), //Theme.of(context).accentColor.withOpacity(0.4),
                                        //         ),
                                        // ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 150,
                      child: Column(
                        children: <Widget>[
                          SliderTheme(
                            data: SliderThemeData(
                              trackHeight: 3,
                              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 6),
                              //overlayShape: RoundSliderOverlayShape(overlayRadius: 0.0),
                            ),
                            child: Slider(
                              inactiveColor: colorScheme.onPrimary.withOpacity(0.1),
                              activeColor: colorScheme.onPrimary,
                              value: progress(),
                              min: 0.0,
                              max: max(),
                              onChanged: controller.player.seekToSecond,
                            ),
                          ),
                          //SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  controller.player.durationTime,
                                  style: textTheme.bodyText2.apply(color: colorScheme.onPrimary.withOpacity(0.7)),
                                ),
                                Text(
                                  controller.player.remainingTime,
                                  style: textTheme.bodyText2.apply(color: colorScheme.onPrimary.withOpacity(0.7)),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                IconButton(
                                  highlightColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  onPressed: controller.player.setRepeat,
                                  icon: Icon(
                                    Icons.repeat,
                                    color: controller.player.isRepeat ? colorScheme.primary : colorScheme.onPrimary.withOpacity(0.4),
                                  ),
                                ),
                                IconButton(
                                  iconSize: 32,
                                  onPressed: controller.player.prevMusic,
                                  icon: Icon(Icons.skip_previous, color: colorScheme.onPrimary),
                                ),
                                MaterialButton(
                                  onPressed: controller.player.isPlaying ? controller.player.pause : controller.player.resume,
                                  color: colorScheme.onPrimary,
                                  textColor: colorScheme.background,
                                  child: Icon(controller.player.isPlaying ? Icons.pause : Icons.play_arrow, size: 32),
                                  padding: EdgeInsets.all(16),
                                  shape: CircleBorder(),
                                  elevation: 0.0,
                                ),
                                IconButton(
                                  iconSize: 32,
                                  onPressed: controller.player.nextMusic,
                                  icon: Icon(Icons.skip_next, color: colorScheme.onPrimary),
                                ),
                                IconButton(
                                  highlightColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  onPressed: controller.player.setShuffle,
                                  icon: Icon(
                                    Icons.shuffle,
                                    color: controller.player.isShuffle ? colorScheme.primary : colorScheme.onPrimary.withOpacity(0.4), //Theme.of(context).accentColor.withOpacity(0.4),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
