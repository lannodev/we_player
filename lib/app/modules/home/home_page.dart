import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:we_slide/we_slide.dart';

import '../../modules/explore/explore_module.dart';
import '../../modules/favorite/favorite_module.dart';
import '../../modules/library/library_module.dart';
import '../../modules/search/search_module.dart';
import 'home_controller.dart';
import 'pages/player_page.dart';
import 'widgets/custom_bottom_bar.dart';
import 'widgets/mini_player.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  final routerOutletListController = RouterOutletListController();

  @override
  Widget build(BuildContext context) {
    final _panelMinSize = 121.0;
    final _panelMaxSize = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      backgroundColor: Theme.of(context).backgroundColor,
      body: Observer(
        builder: (_) {
          return WeSlide(
            controller: controller.wsController,
            panelMaxSize: _panelMaxSize,
            panelMinSize: controller.player.currentMusic != null ? _panelMinSize : 0.0,
            hideFooter: true,
            footerOffset: 58.0,
            overlayOpacity: 0.9,
            parallax: true,
            //panelBorderRadiusBegin: 12.0,
            animateDuration: const Duration(milliseconds: 300),
            body: IndexedStack(
              index: controller.indexPage,
              children: [
                RouterOutlet(module: ExploreModule()),
                //FavoriteModule(),
                // SearchModule(),
                //LibraryModule(),
                // LibraryModule(),
              ],
            ),
            panelHeader: MiniPlayer(onTap: controller.wsController.show),
            panel: PlayerPage(onTap: controller.wsController.hide),
            footer: CustomBottomBar(onTap: controller.setPage, selectedIndex: controller.indexPage),
          );
        },
      ),
    );
  }
}
