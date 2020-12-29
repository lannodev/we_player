import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:we_player/app/shared/stores/player_store.dart';

import '../../shared/models/music_model.dart';
import '../../shared/models/playlist_model.dart';
import 'repositories/album_repository.dart';

part 'album_controller.g.dart';

@Injectable()
class AlbumController = _AlbumControllerBase with _$AlbumController;

abstract class _AlbumControllerBase with Store {
  final AlbumRepository repository;
  final PlayListModel album;
  final PlayerStore playerStore;

  _AlbumControllerBase({this.repository, this.album, this.playerStore}) {
    getAllMusic();
    updatePaletteColor();
  }

  @observable
  Color paletteColor = Colors.black;

  @observable
  List<MusicModel> playlist;

  // Update Backgroun color
  @action
  Future<void> updatePaletteColor() async {
    var _imageProvider = NetworkImage(album.photo.photo300);
    var generator = await PaletteGenerator.fromImageProvider(
      _imageProvider,
      size: Size(300, 300),
      region: Offset.zero & Size(300, 300),
      maximumColorCount: 20,
    );
    paletteColor = generator?.mutedColor?.color ?? Colors.black;
  }

  // Get all musics using search
  @action
  Future<void> getAllMusic() async {
    try {
      playlist = await repository.fetchAlbumMusic(id: album.id, ownerId: album.ownerId, key: album.accessKey);
    } on Exception catch (e) {
      print(e);
      //musicList.catchError(e);
    }
  }
}
