import 'dart:ui';

import 'package:flutter/material.dart';
import '../../../shared/models/music_model.dart';
import '../../../shared/widgets/custom_raised_button.dart';

class MusicPage {
  static void show(BuildContext context, MusicModel music) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      barrierColor: colorScheme.background.withOpacity(0),
      elevation: 0,
      isScrollControlled: true,
      context: context,
      builder: (context) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(24.0),
              topRight: const Radius.circular(24.0),
            ),
          ),
          child: Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height - 70,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  physics: BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.all(40),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: MediaQuery.of(context).padding.top + 20,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Image.network(music.album.thumb.photo600),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          music?.title ?? "No Title",
                          overflow: TextOverflow.ellipsis,
                          style: textTheme.headline5.apply(color: colorScheme.onPrimary),
                          // style: TextStyle(
                          //   color: colorScheme.onPrimary,
                          //   fontWeight: FontWeight.bold,
                          //   fontSize: 24.0,
                          // ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          music?.artist ?? "No Artist",
                          overflow: TextOverflow.ellipsis,
                          style: textTheme.headline6.apply(color: colorScheme.onPrimary.withOpacity(0.5)),
                        ),
                        SizedBox(height: 30),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.favorite_border,
                              color: colorScheme.onPrimary,
                            ),
                            SizedBox(width: 12),
                            Text(
                              "Curtir",
                              style: textTheme.bodyText2.apply(color: colorScheme.onPrimary.withOpacity(0.5)),
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.remove_circle_outline,
                              color: colorScheme.onPrimary,
                            ),
                            SizedBox(width: 12),
                            Text(
                              "Remover da playlist",
                              style: textTheme.bodyText2.apply(color: colorScheme.onPrimary.withOpacity(0.5)),
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.queue_music,
                              color: colorScheme.onPrimary,
                            ),
                            SizedBox(width: 12),
                            Text(
                              "Adicionar à playlist",
                              style: textTheme.bodyText2.apply(color: colorScheme.onPrimary.withOpacity(0.5)),
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.playlist_add,
                              color: colorScheme.onPrimary,
                            ),
                            SizedBox(width: 12),
                            Text(
                              "Adicionar à fila",
                              style: textTheme.bodyText2.apply(color: colorScheme.onPrimary.withOpacity(0.5)),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 70,
                child: Center(
                  child: CustomRaisedButton(
                    text: "FECHAR",
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
