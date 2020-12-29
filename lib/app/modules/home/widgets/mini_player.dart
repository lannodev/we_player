import 'dart:math';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../shared/models/music_model.dart';
import '../../../shared/widgets/music_card.dart';
import '../home_controller.dart';

class MiniPlayer extends StatefulWidget {
  //Controller
  final Function onTap;
  MiniPlayer({
    @required this.onTap,
  });

  @override
  _MiniPlayerState createState() => _MiniPlayerState();
}

class _MiniPlayerState extends ModularState<MiniPlayer, HomeController> {
  String get _thumb => controller.player.currentMusic?.album?.thumb?.photo300 ?? null;
  MusicModel get _currentMusic => controller.player.currentMusic ?? null;
  double progress() => max() > (controller.player.position?.inSeconds ?? 0).toDouble() ? (controller.player.position?.inSeconds ?? 0).toDouble() : 0.0;
  double max() => (controller.player.duration.inSeconds ?? 0.0).toDouble();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Observer(
      builder: (_) {
        return GestureDetector(
          onTap: widget.onTap,
          child: Container(
            color: colorScheme.onBackground,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                //SizedBox(height: 8.0),
                // LinearProgressIndicator(
                //   minHeight: 1.0,
                // ),
                Row(
                  children: <Widget>[
                    MusicCard(
                      height: 65.0,
                      width: 65.0,
                      thumb: _thumb,
                      isSelected: false,
                      iconSize: 24.0,
                      borderRadius: 0.0,
                      playerStore: controller.player,
                    ),
                    SizedBox(width: 12.0),
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            controller.player?.currentMusic?.title ?? "Empty",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: colorScheme.onPrimary,
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            controller.player?.currentMusic?.artist ?? "Empty",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: colorScheme.onPrimary.withOpacity(0.5),
                              fontSize: 14.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 12.0),
                    GestureDetector(
                      onTap: () {
                        controller.favoriteStore.addFavoriteMusic(_currentMusic);
                      },
                      child: Container(
                        width: 40.0,
                        height: 50.0,
                        child: FlareActor(
                          "assets/flare/favorite_heart.flr",
                          alignment: Alignment.center,
                          fit: BoxFit.none,
                          color: controller.favoriteStore.isFavorite ? colorScheme.primary : colorScheme.onPrimary.withOpacity(0.3),
                          animation: controller.favoriteStore.isFavorite ? 'Favorite' : 'Unfavorite',
                        ),
                      ),
                    ),
                    IconButton(
                      highlightColor: Colors.transparent,
                      icon: Icon(
                        controller.player.isPlaying ? Icons.pause : Icons.play_arrow,
                        color: colorScheme.onPrimary,
                        size: 32.0,
                      ),
                      onPressed: controller.player.isPlaying ? controller.player.pause : controller.player.resume,
                    ),
                    SizedBox(width: 12.0),
                  ],
                ),
                //SizedBox(height: 5),
                Divider(color: colorScheme.background, height: 1),
              ],
            ),
          ),
        );
      },
    );
  }
}
