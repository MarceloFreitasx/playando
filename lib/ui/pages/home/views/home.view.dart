import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/components.dart';
import '../home.dart';

class HomeView extends GetViewCP<HomeController, HomePresenter> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          Obx(() => CustomSliverAppBar(
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
                      return Obx(() => VideoCard(
                            title:
                                "Cooking with Marshmello: How To Make Greek Salad Hello loves, This week on Cooking with Marshmello we make the best",
                            thumbnail: "https://i.ytimg.com/vi/dh6ob389CYU/hqdefault.jpg",
                            playing: presenter.videoPlaying == index,
                            onPlayPause: () => controller.onPlayVideo(index),
                            onDelete: () => controller.onDeleteVideo(index),
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
      floatingActionButton: Obx(() => presenter.listVideos.isEmpty
          ? const SizedBox.shrink()
          : FilterButton(
              clear: presenter.isListFiltered,
              onTap: controller.onFilterTap,
            )),
    );
  }
}
