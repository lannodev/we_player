import 'package:flutter/material.dart';
import 'package:we_player/generated/l10n.dart';

class PlaylistHeader extends StatelessWidget {
  final String title;

  const PlaylistHeader({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _colorTheme = Theme.of(context).colorScheme;
    final _textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        children: <Widget>[
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "$title",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: _textTheme.headline5.apply(color: _colorTheme.onPrimary),
                ),
                // Icon(
                //   Icons.arrow_drop_down,
                //   color: _colorTheme.primary,
                // ),
              ],
            ),
          ),
          SizedBox(width: 48.0),
          GestureDetector(
            onTap: () => print("OnTap"),
            child: Row(
              children: <Widget>[
                Text(
                  Translate.of(context).explorePageShowMoreButton,
                  style: _textTheme.subtitle1.apply(color: _colorTheme.primary),
                ),
                Icon(
                  Icons.arrow_right,
                  color: _colorTheme.primary,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
