import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../shared/models/playlist_model.dart';
import '../../../shared/widgets/music_card.dart';
import '../album_controller.dart';

class CustomSliverHeader extends SliverPersistentHeaderDelegate {
  final PlayListModel album;

  CustomSliverHeader({@required this.album});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final shrinkPercentage = min(1, shrinkOffset / (maxExtent - minExtent)).toDouble();
    final _colorScheme = Theme.of(context).colorScheme;
    final _textTheme = Theme.of(context).textTheme;
    final controller = Modular.get<AlbumController>();

    return Observer(
      builder: (_) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.1, 1.0],
              colors: [controller.paletteColor, _colorScheme.background],
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: SafeArea(
                  child: Column(
                    children: [
                      Container(
                        height: 60.0,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                              Flexible(
                                child: Opacity(
                                  opacity: shrinkPercentage <= 0.4 ? 0.0 : shrinkPercentage,
                                  child: Text(
                                    "${album.title}",
                                    style: _textTheme.subtitle1.apply(
                                      color: _colorScheme.onPrimary,
                                    ),
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.more_horiz,
                                  color: Colors.white,
                                ),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                      ),
                      Opacity(
                        opacity: max(1 - shrinkPercentage * 1, 0),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            //crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MusicCard(
                                thumb: album.photo.photo600,
                                width: MediaQuery.of(context).size.width * 0.4,
                                height: MediaQuery.of(context).size.width * 0.4,
                                margin: 10.0,
                                borderRadius: 0.0,
                                playerStore: null,
                              ),
                              SizedBox(height: 20.0),
                              Text(
                                "${album.title}",
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: _textTheme.headline5.apply(
                                  color: _colorScheme.onPrimary,
                                ),
                              ),
                              SizedBox(height: 2.0),
                              if (album.description != "")
                                Text(
                                  "${album.description}",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  style: _textTheme.bodyText2.apply(
                                    color: _colorScheme.onPrimary.withOpacity(0.5),
                                  ),
                                ),
                              SizedBox(height: 5.0),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.play_arrow, size: 14.0),
                                  SizedBox(width: 2.0),
                                  Text(
                                    "${album.plays}",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                    maxLines: 1,
                                    style: _textTheme.button.apply(
                                      color: _colorScheme.onPrimary,
                                    ),
                                  ),
                                  SizedBox(width: 5.0),
                                  Icon(Icons.person, size: 14.0),
                                  SizedBox(width: 2.0),
                                  Text(
                                    "${album.followers}",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                    maxLines: 1,
                                    style: _textTheme.button.apply(
                                      color: _colorScheme.onPrimary,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  double get maxExtent => 320.0;

  @override
  double get minExtent => 70;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
