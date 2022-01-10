import 'package:flutter/material.dart';

abstract class HomeController {
  TextEditingController get searchController;

  void onPlayVideo(int index);
  void onDeleteVideo(int index);

  void onAddVideoTap();
  void onVideoTextChanged(String value);

  void onFilterTap();
}
