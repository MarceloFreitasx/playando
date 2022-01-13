import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../ui/pages/pages.dart';

class SearchControl implements SearchController {
  SearchControl(this._presenter) {
    _arguments = Get.arguments as Map<String, String>;

    if (_arguments.containsKey('title')) {
      title = _arguments['title']!;
      _presenter.findVideo(_arguments['title']!);
    }

    if (_arguments.containsKey('videoUrl')) {
      title = _arguments['videoUrl']!;
      _getVideoByUrl();
    }
  }

  final SearchPresenter _presenter;
  late Map<String, String> _arguments;

  @override
  late String title;

  @override
  void onVideoTap(int index) {
    Get.back(result: _presenter.listVideos[index]);
  }

  @override
  void openHelp() {
    Get.snackbar(
      "Atenção",
      "Clique em um vídeo para adicionar aos favoritos.",
      icon: const Icon(Icons.help),
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void _getVideoByUrl() async {
    final _video = await _presenter.findVideoByUrl(_arguments['videoUrl']!);
    Get.back(result: _video);
  }
}
