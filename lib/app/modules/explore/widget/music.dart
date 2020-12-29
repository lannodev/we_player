import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:we_player/app/modules/explore/widget/playlist_header.dart';
import 'package:we_player/app/shared/models/explore_music_model.dart';

import '../../../modules/explore/widget/playlist_item.dart';
import '../explore_controller.dart';

class Music extends StatefulWidget {
  final ExploreMusicModel audioList;
  final bool initialList;

  Music({Key key, @required this.audioList, this.initialList = false}) : super(key: key);

  @override
  _MusicState createState() => _MusicState();
}

class _MusicState extends ModularState<Music, ExploreController> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Container(
      width: _size.width,
      child: Padding(
        padding: EdgeInsets.only(top: widget.initialList ? 48.0 : 12.0, bottom: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PlaylistHeader(title: widget.audioList.title),
            SizedBox(height: 15.0),
            Container(
              height: 200,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                itemCount: widget.audioList.audios.length,
                key: PageStorageKey(widget.audioList.id),
                itemBuilder: (context, index) {
                  final _restricted = widget.audioList.audios[index].url.isEmpty;
                  final _title = widget.audioList.audios[index].title;
                  final _subtitle = widget.audioList.audios[index].artist;
                  final _thumb = widget.audioList.audios[index].album?.thumb?.photo300 ?? null;
                  return GestureDetector(
                    onTap: () {
                      if (!_restricted) {
                        controller.playerStore.setPlaylist(widget.audioList.audios, index);
                      } else {
                        //print(_thumb);
                      }
                    },
                    child: PlaylistItem(
                      small: false,
                      title: _title,
                      subtitle: _subtitle,
                      thumb: _thumb,
                      isSelected: false,
                      restricted: _restricted,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
