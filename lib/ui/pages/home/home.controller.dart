import 'package:flutter/material.dart';

import '../../../domain/entities/entities.dart';

abstract class HomeController {
  GlobalKey<FormState> get formKey;
  TextEditingController get searchController;

  void onPlayVideo(SnippetEntity item);
  void onDeleteVideo(SnippetEntity item);

  void onAddVideoTap();
  void onVideoTextChanged(String value);

  void onFilterTap();
}
