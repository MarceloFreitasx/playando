import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../ui/pages/pages.dart';

class SearchControl implements SearchController {
  SearchControl(this._presenter) {
    title = Get.arguments;
  }

  final SearchPresenter _presenter;

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
}
