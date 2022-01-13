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
  final formKey = GlobalKey<FormState>();

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
  void onDeleteVideo(SnippetEntity item) {
    if (_presenter.videoPlaying == item) {
      _presenter.videoPlaying = null;
    }
    _presenter.originalListVideos.remove(item);
    VideoStorageData.to.write(_presenter.originalListVideos);

    if (_presenter.isListFiltered) {
      _filterVideoList(_filterController.text);
    }
  }

  @override
  void onAddVideoTap() async {
    if (formKey.currentState!.validate()) {
      dynamic result;
      if (_presenter.isYoutubeUrl) {
        result = await Get.toNamed(AppRoutes.search, arguments: {
          'videoUrl': searchController.text,
        });
      } else {
        result = await Get.toNamed(AppRoutes.search, arguments: {
          'title': searchController.text,
        });
      }

      if (result != null && result is SnippetEntity) {
        _presenter.originalListVideos.add(result);
        VideoStorageData.to.write(_presenter.originalListVideos);
        searchController.clear();
        _presenter.isYoutubeUrl = false;
        _presenter.clearFilter();
      }
    }
  }

  @override
  void onVideoTextChanged(String value) {
    _presenter.isYoutubeUrl = Utils.isYoutubeUrl(value);
  }

  @override
  void onFilterTap() {
    if (_presenter.isListFiltered) {
      _presenter.clearFilter();
      _filterController.clear();
    } else {
      Get.bottomSheet(FilterFormWidget(
        initialValue: _filterController.text,
        onTap: (value) {
          _presenter.isListFiltered = true;
          _filterController.text = value;
          _filterVideoList(value);
          Get.back();
        },
      ));
    }
  }

  void _filterVideoList(String value) {
    final _regex = RegExp('(' + value.toLowerCase().split('').join(').*(') + ')');
    final _items =
        _presenter.originalListVideos.where((e) => e.title.toLowerCase().contains(_regex)).toList();

    _presenter.listVideos.assignAll(_items);
  }
}
