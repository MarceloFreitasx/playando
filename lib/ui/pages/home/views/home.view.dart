import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/components.dart';
import '../home.dart';

class HomeView extends GetViewCP<HomeController, HomePresenter> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: CustomScrollView(
          slivers: [
            Obx(() => CustomSliverAppBar(
                  formKey: controller.formKey,
                  controller: controller.searchController,
                  onTap: controller.onAddVideoTap,
                  onChanged: controller.onVideoTextChanged,
                  isYoutubeUrl: presenter.isYoutubeUrl,
                )),
            Obx(() => presenter.listVideos.isEmpty
                ? const SliverFillRemaining(child: EmptyList())
                : SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (_, index) {
                        final item = presenter.listVideos[index];
                        return Obx(() => VideoCard(
                              title: item.title,
                              thumbnail: item.thumbnails!.high!.url!,
                              playing: presenter.videoPlaying == item,
                              onPlayPause: () => controller.onPlayVideo(item),
                              onDelete: () => controller.onDeleteVideo(item),
                            ));
                      },
                      childCount: presenter.listVideos.length,
                    ),
                  )),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  "Feito por Marcelo Freitas",
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Obx(() => presenter.originalListVideos.isEmpty
          ? const SizedBox.shrink()
          : FilterButton(
              clear: presenter.isListFiltered,
              onTap: controller.onFilterTap,
            )),
    );
  }
}
