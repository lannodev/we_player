import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:transparent_image/transparent_image.dart';
import '../../shared/stores/player_store.dart';

class MusicCard extends StatefulWidget {
  final double height;
  final double width;
  final String thumb;
  final String title;
  final String subtitle;
  final Color subtitleColor;
  final TextAlign textAlign;
  final bool isSelected;
  final bool equalizer;
  final bool restricted;
  final double iconSize;
  final double equalizerSize;
  final double borderRadius;
  final double margin;
  final IconData icon;
  final PlayerStore playerStore;

  const MusicCard({
    Key key,
    this.height = 50.0,
    this.width = 50.0,
    this.thumb = "",
    this.title,
    this.subtitle,
    this.subtitleColor,
    this.textAlign = TextAlign.left,
    this.isSelected = false,
    this.restricted = false,
    this.equalizer = false,
    this.iconSize = 32.0,
    this.equalizerSize = 24.0,
    this.borderRadius = 5.0,
    this.margin = 0.0,
    @required this.playerStore,
    this.icon,
  }) : super(key: key);

  @override
  _MusicCardState createState() => _MusicCardState();
}

class _MusicCardState extends State<MusicCard> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: widget.margin),
      height: widget.height,
      width: widget.width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(widget.borderRadius),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            //If music do not restricted show music icon
            if (!widget.restricted)
              Container(
                color: colorScheme.surface,
                child: Center(
                  child: Visibility(
                    visible: !widget.isSelected,
                    child: Icon(
                      Icons.music_note,
                      color: colorScheme.primary,
                      size: widget.iconSize,
                    ),
                  ),
                ),
              ),

            //If music have image show using fadeInImage
            if (widget.thumb != null)
              FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: widget.thumb,
                fit: BoxFit.cover,
              ),
            // if music is restricted show blocked icon
            Visibility(
              visible: widget.restricted,
              child: Container(
                color: colorScheme.onBackground.withOpacity(0.7),
                child: Center(
                  child: Icon(
                    Icons.https,
                    color: Colors.white.withOpacity(0.3),
                    size: widget.iconSize,
                  ),
                  // child: Container(
                  //   width: widget.equalizerSize,
                  //   height: widget.equalizerSize,
                  // child: Icon(
                  //   Icons.https,
                  //   color: Colors.white.withOpacity(0.5),
                  //   size: widget.iconSize,
                  // ),
                  // child: FlareActor(
                  //   "assets/flare/equalizer.flr",
                  //   alignment: Alignment.center,
                  //   fit: BoxFit.cover,
                  //   color: Colors.white,
                  //   animation: (widget?.playerStore?.isPlaying ?? false) ? 'start' : 'stop',
                  // ),
                  // ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
