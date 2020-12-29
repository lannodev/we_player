import 'package:flutter/material.dart';
import 'package:we_player/app/shared/widgets/music_card.dart';

class PlaylistItem extends StatefulWidget {
  final bool small;
  final String thumb;
  final String title;
  final String subtitle;
  final bool isSelected;
  final bool restricted;

  const PlaylistItem({
    Key key,
    this.small,
    this.thumb,
    this.title,
    this.subtitle,
    this.isSelected = false,
    this.restricted = false,
  }) : super(key: key);

  @override
  _PlaylistItemState createState() => _PlaylistItemState();
}

class _PlaylistItemState extends State<PlaylistItem> {
  @override
  Widget build(BuildContext context) {
    final _colorScheme = Theme.of(context).colorScheme;
    final _textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MusicCard(
          thumb: widget.thumb,
          width: widget.small ? 100 : 150,
          height: widget.small ? 100 : 150,
          margin: 10.0,
          playerStore: null,
          restricted: widget.restricted,
        ),
        if (widget.small)
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: Container(
              width: widget.small ? 100 : 150,
              child: Text(
                widget.title,
                overflow: TextOverflow.ellipsis,
                style: _textTheme.subtitle1.apply(
                  color: widget.isSelected ? _colorScheme.primary : _colorScheme.onPrimary,
                ),
              ),
            ),
          ),
        if (!widget.small)
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: Container(
              width: widget.small ? 100 : 150,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    overflow: TextOverflow.ellipsis,
                    style: _textTheme.subtitle1.apply(
                      color: widget.isSelected ? _colorScheme.primary : (widget.restricted ? _colorScheme.onPrimary.withOpacity(0.5) : _colorScheme.onPrimary),
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    widget.subtitle,
                    overflow: TextOverflow.ellipsis,
                    style: _textTheme.subtitle2.apply(color: _colorScheme.onPrimary.withOpacity(0.5)),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
