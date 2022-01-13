import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/components.dart';
import '../search.dart';
import '../widgets/widgets.dart';

class SearchView extends GetViewCP<SearchController, SearchPresenter> {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomSliverAppBar(
            title: controller.title,
            actions: [
              IconButton(
                onPressed: controller.openHelp,
                icon: const Icon(Icons.help),
              ),
            ],
          ),
          Obx(() => presenter.isLoading
              ? const SliverFillRemaining(
                  child: Center(
                  child: CircularProgressIndicator(),
                ))
              : presenter.listVideos.isEmpty
                  ? const SliverFillRemaining(
                      child: EmptyList(),
                    )
                  : SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (_, index) {
                          final item = presenter.listVideos[index];
                          return GestureDetector(
                            onTap: () => controller.onVideoTap(index),
                            child: VideoCard(
                              title: item.title,
                              thumbnail: item.thumbnails!.high!.url!,
                            ),
                          );
                        },
                        childCount: presenter.listVideos.length,
                      ),
                    )),
        ],
      ),
    );
  }
}
