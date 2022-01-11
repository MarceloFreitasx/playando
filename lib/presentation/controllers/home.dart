import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/services/services.dart';
import '../../domain/entities/entities.dart';
import '../../domain/helpers/helpers.dart';
import '../../ui/pages/pages.dart';
import '../navigator/navigator.dart';

class HomeControl implements HomeController {
  HomeControl(this._presenter);

  final HomePresenter _presenter;
  final _filterController = TextEditingController();

  @override
  final searchController = TextEditingController();

  @override
  void onPlayVideo(SnippetEntity item) {
    if (_presenter.videoPlaying == item) {
      _presenter.videoPlaying = null;
      return;
    }
    _presenter.videoPlaying = item;
  }

  @override
  void onDeleteVideo(SnippetEntity index) {
    if (_presenter.videoPlaying == index) {
      _presenter.videoPlaying = null;
    }
    _presenter.listVideos.remove(index);
    VideoStorageData.to.write(_presenter.listVideos);
  }

  @override
  void onAddVideoTap() async {
    final result = await Get.toNamed(AppRoutes.search, arguments: searchController.text);

    if (result != null && result is SnippetEntity) {
      _presenter.listVideos.add(result);
      VideoStorageData.to.write(_presenter.listVideos);
      searchController.clear();
      _presenter.isYoutubeUrl = false;
    }
    /* print(searchController.text);
    print(_presenter.isYoutubeUrl);
    searchController.clear();
    _presenter.isYoutubeUrl = false;

    final entity = SnippetEntity(
      publishedAt: DateTime.now(),
      channelId: "UCDpenlfHFtjdGpqi8slPybg",
      title: "Cooking with Marshmello: How To Make Greek Salad",
      description:
          "Cooking with Marshmello: How To Make Greek Salad Hello loves, This week on Cooking with Marshmello we make the best ...",
      thumbnails: SnippetThumbnailsEntity(
        defaulte: ThumbnailEntity(
          url: "https://i.ytimg.com/vi/dh6ob389CYU/default.jpg",
          width: 120,
          height: 90,
        ),
        medium: ThumbnailEntity(
          url: "https://i.ytimg.com/vi/dh6ob389CYU/mqdefault.jpg",
          width: 320,
          height: 180,
        ),
        high: ThumbnailEntity(
          url: "https://i.ytimg.com/vi/dh6ob389CYU/hqdefault.jpg",
          width: 480,
          height: 360,
        ),
      ),
      channelTitle: "Cooking With Marshmello",
      liveBroadcast: false,
      publishTime: DateTime.now(),
    );

    _presenter.listVideos.add(entity);
    VideoStorageData.to.write(_presenter.listVideos); */
  }

  @override
  void onVideoTextChanged(String value) {
    _presenter.isYoutubeUrl = Utils.isYoutubeUrl(value);
  }

  @override
  void onFilterTap() {
    if (_presenter.isListFiltered) {
      _presenter.isListFiltered = false;
    } else {
      Get.bottomSheet(FilterFormWidget(
        initialValue: _filterController.text,
        onTap: (value) {
          _presenter.isListFiltered = true;
          _filterController.text = value;
          Get.back();
        },
      ));
    }
  }
}
