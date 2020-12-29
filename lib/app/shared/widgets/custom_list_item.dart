import 'package:flutter/material.dart';

import '../../modules/home/pages/music_page.dart';
import '../../shared/models/music_model.dart';
import '../../shared/stores/player_store.dart';
import '../../shared/widgets/music_card.dart';

class CustomListItem extends StatefulWidget {
  // Controller
  final MusicModel music;
  final bool isSeleted;
  final bool restricted;
  final bool explicit;
  final PlayerStore playerStore;

  const CustomListItem({
    Key key,
    @required this.music,
    this.isSeleted = false,
    this.restricted = false,
    this.explicit = false,
    @required this.playerStore,
  }) : super(key: key);

  @override
  _CustomListItemState createState() => _CustomListItemState();
}

class _CustomListItemState extends State<CustomListItem> {
  String get _albumImage => widget.music?.album?.thumb?.photo68 ?? null;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      // decoration: BoxDecoration(
      //   gradient: LinearGradient(
      //     colors: [
      //       widget.isSeleted ? colorScheme.primary.withOpacity(0.20) : Colors.transparent,
      //       colorScheme.background.withOpacity(0.10),
      //     ],
      //     stops: [0.1, 0.8],
      //     begin: Alignment.topLeft,
      //     end: Alignment.bottomRight,
      //   ),
      //   borderRadius: BorderRadius.circular(12.0),
      // ),
      //padding: EdgeInsets.symmetric(horizontal: 12.0),
      margin: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child: Row(
        children: <Widget>[
          MusicCard(
            height: 50.0,
            width: 50.0,
            thumb: _albumImage,
            isSelected: widget.isSeleted,
            playerStore: widget.playerStore,
            restricted: widget.restricted,
          ),
          SizedBox(width: 12.0),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  widget.music?.title ?? "No Title",
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.subtitle1.apply(
                    color: widget.isSeleted ? colorScheme.primary : (widget.restricted ? colorScheme.onPrimary.withOpacity(0.5) : colorScheme.onPrimary),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  widget.music?.artist ?? "No Artist",
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.subtitle2.apply(
                    color: colorScheme.onPrimary.withOpacity(0.5),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 12.0),
          Container(
            width: 30,
            child: IconButton(
              icon: Icon(
                Icons.more_vert,
                color: colorScheme.onPrimary.withOpacity(0.6),
                size: 24.0,
              ),
              onPressed: () {
                MusicPage.show(context, widget.music);
              },
            ),
          ),
          SizedBox(width: 12.0),
        ],
      ),
    );
  }
}
