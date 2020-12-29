import 'package:flutter/material.dart';

import '../../../modules/explore/widget/playlist_header.dart';
import '../../../modules/explore/widget/playlist_item.dart';
import '../../../shared/models/explore_playlist_model.dart';

class Album extends StatefulWidget {
  final ExplorePlaylistModel list;
  final bool initialList;

  Album({Key key, @required this.list, this.initialList = false}) : super(key: key);

  @override
  _AlbumState createState() => _AlbumState();
}

class _AlbumState extends State<Album> {
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
            PlaylistHeader(title: widget.list.title),
            SizedBox(height: 15.0),
            Container(
              height: 200,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                itemCount: widget.list.playlists.length ?? 0,
                key: PageStorageKey(widget.list.id),
                itemBuilder: (context, index) {
                  final _title = widget.list.playlists[index].title;
                  final _subtitle = widget.list.playlists[index].description;
                  final _thumb = widget.list.playlists[index].photo?.photo300 ?? null;

                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed("/album", arguments: widget.list.playlists[index]);
                    },
                    child: PlaylistItem(
                      small: false,
                      title: _title,
                      subtitle: _subtitle,
                      thumb: _thumb,
                      isSelected: false,
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
