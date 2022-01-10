import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/services/services.dart';
import '../../domain/entities/snippet.dart';
import '../../domain/entities/thumbnail.dart';
import '../../domain/helpers/helpers.dart';
import '../../ui/pages/pages.dart';

class HomeControl implements HomeController {
  HomeControl(this._presenter);

  final HomePresenter _presenter;
  final _filterController = TextEditingController();

  @override
  final searchController = TextEditingController();

  @override
  void onPlayVideo(int index) {
    if (_presenter.videoPlaying == index) {
      _presenter.videoPlaying = -1;
      return;
    }
    _presenter.videoPlaying = index;
  }

  @override
  void onDeleteVideo(int index) {
    _presenter.listVideos.removeAt(index);
    VideoStorageData.to.write(_presenter.listVideos);
  }

  @override
  void onAddVideoTap() {
    print(searchController.text);
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
    VideoStorageData.to.write(_presenter.listVideos);
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
