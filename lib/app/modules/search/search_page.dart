import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:we_player/app/shared/widgets/infinite_scroll_footer.dart';

import '../../../generated/l10n.dart';
import '../../shared/widgets/custom_list_item.dart';
import '../../shared/widgets/custom_text_field.dart';
import 'search_controller.dart';
import 'widget/empty_widget.dart';

import 'widget/shimmer_widget.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends ModularState<SearchPage, SearchController> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: MediaQuery.of(context).padding.top),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                Translate.of(context).searchPageTitle,
                style: TextStyle(color: Theme.of(context).accentColor),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    Translate.of(context).searchPageSubtitle,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28.0, color: Theme.of(context).accentColor),
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    color: Theme.of(context).primaryColor,
                  )
                ],
              ),
            ],
          ),
          SizedBox(height: 12),
          Observer(
            builder: (_) {
              return CustomTextField(
                hint: Translate.of(context).searchPageHintText,
                prefix: Icon(
                  Icons.search,
                  color: Theme.of(context).accentColor.withOpacity(0.5),
                  size: 20,
                ),
                obscure: false,
                onChanged: controller.changeSearchText,
                onSubmitted: (value) {
                  controller.searchController.text = value;
                  controller.fetchMusic();
                },
                enabled: true,
                controller: controller.searchController,
                suffix: Visibility(
                  visible: controller.searchText.isNotEmpty,
                  child: IconButton(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    icon: Icon(
                      Icons.clear,
                      color: Theme.of(context).accentColor.withOpacity(0.5),
                      size: 20,
                    ),
                    onPressed: () {
                      controller.searchText = "";
                      WidgetsBinding.instance.addPostFrameCallback(
                        (_) => controller.searchController.clear(),
                      );
                    },
                  ),
                ),
              );
            },
          ),
          SizedBox(height: 12),
          Expanded(
            child: Center(
              child: Container(
                child: Observer(
                  builder: (_) {
                    //Error
                    var list = controller.musicList;

                    // If error
                    if (list.error != null) {
                      return EmptyWidget(
                        title: Translate.of(context).searchPageListErrorTitle,
                        subtitle: Translate.of(context).searchPageListErrorSubtitle,
                        image: 'assets/images/empty_search.svg',
                      );
                    }

                    //Loading
                    if (list.status == FutureStatus.pending && list.value == null) {
                      return ListView.separated(
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return ShimmerWidget();
                        },
                        padding: EdgeInsets.only(bottom: 12),
                        separatorBuilder: (context, index) => Divider(),
                        itemCount: 10,
                      );
                    }

                    //Not Found
                    if (list.status == FutureStatus.fulfilled && list.value.isEmpty && controller.searchText.isNotEmpty) {
                      return EmptyWidget(
                        title: Translate.of(context).searchPageListNotFoundTitle(controller.searchText),
                        subtitle: Translate.of(context).searchPageListNotFoundSubtitle,
                        image: 'assets/images/empty_search.svg',
                      );
                    }

                    //Empty list
                    if (list.status == FutureStatus.fulfilled && list.value.isEmpty) {
                      return EmptyWidget(
                        title: Translate.of(context).searchPageListEmptyTitle,
                        subtitle: Translate.of(context).searchPageListEmptySubtitle,
                        image: 'assets/images/empty_search.svg',
                      );
                    }

                    return Scrollbar(
                      child: SmartRefresher(
                        controller: controller.refreshController,
                        header: WaterDropHeader(
                          waterDropColor: Theme.of(context).primaryColor,
                        ),
                        footer: InfiniteScrollFooter(),
                        onRefresh: controller.fetchMusic,
                        onLoading: controller.loadMore,
                        enablePullUp: true,
                        child: ListView.builder(
                          itemCount: list.value.length,
                          padding: EdgeInsets.only(bottom: 12),
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              child: CustomListItem(
                                music: list.value[index],
                                isSeleted: (list?.value[index]?.id ?? 0) == (controller.playerStore?.currentMusic?.id ?? 0),
                                //index: index + 1,
                              ),
                              onTap: () => controller.playerStore.setPlaylist(list.value, index),
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
