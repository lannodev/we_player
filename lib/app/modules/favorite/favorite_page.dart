import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../generated/l10n.dart';
import '../../shared/widgets/custom_list_item.dart';
import '../../shared/widgets/custom_raised_button.dart';
import '../../shared/widgets/custom_text_field.dart';
import 'favorite_controller.dart';

class FavoritesPage extends StatefulWidget {
  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends ModularState<FavoritesPage, FavoriteController> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Observer(
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: MediaQuery.of(context).padding.top + 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          Translate.of(context).favoritesPageTitle,
                          style: textTheme.headline6.apply(color: colorScheme.onPrimary),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              Translate.of(context).favoritesPageSubtitle,
                              //style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28.0, color: Theme.of(context).accentColor),
                              style: textTheme.headline4.apply(color: colorScheme.onPrimary),
                            ),
                            Icon(
                              Icons.arrow_drop_down,
                              color: colorScheme.primary,
                            )
                          ],
                        ),
                        Text(
                          "10 Musicas • 3 horas 23 Minutos",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: textTheme.subtitle2.apply(color: colorScheme.onPrimary.withOpacity(0.5)),
                        ),
                      ],
                    ),
                  ),
                  CustomRaisedButton(
                    text: Translate.of(context).favoritesPageShuffleButtom.toUpperCase(),
                    onPressed: () {
                      controller.playerStore.isShuffle = true;
                      var rnd = Random().nextInt(controller.store.favoriteList.length);
                      controller.playerStore.setPlaylist(controller.store.favoriteList, rnd);
                    },
                  )
                ],
              ),
              SizedBox(height: 12),
              CustomTextField(
                hint: Translate.of(context).searchPageHintText,
                prefix: Icon(
                  Icons.search,
                  color: colorScheme.onPrimary.withOpacity(0.5),
                  size: 20,
                ),
                obscure: false,
                onChanged: (value) {},
                onSubmitted: (value) {},
                enabled: true,
                controller: controller.searchController,
                suffix: IconButton(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  icon: Icon(
                    Icons.clear,
                    color: colorScheme.onPrimary.withOpacity(0.5),
                    size: 20,
                  ),
                  onPressed: () {},
                ),
              ),
              SizedBox(height: 12),
              Expanded(
                child: Center(
                  child: Container(
                    child: ListView.builder(
                      itemCount: controller.store.favoriteList.length,
                      padding: EdgeInsets.only(bottom: 12),
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          child: CustomListItem(
                            music: controller.store.favoriteList[index],
                            isSeleted: controller?.store?.favoriteList[index].id == (controller.playerStore.currentMusic?.id ?? 0),
                            //index: index + 1,
                          ),
                          onTap: () {
                            controller.playerStore.setPlaylist(controller.store.favoriteList, index);
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
