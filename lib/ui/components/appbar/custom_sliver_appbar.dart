import 'package:flutter/material.dart';

import '../../helpers/helpers.dart';
import '../../styles/styles.dart';
import '../components.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    Key? key,
    this.onTap,
    this.controller,
    this.onChanged,
    this.isYoutubeUrl = false,
  }) : super(key: key);

  final TextEditingController? controller;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;
  final bool isYoutubeUrl;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: const Text(
        "Playando",
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: AppColors.primary,
      centerTitle: true,
      toolbarHeight: kToolbarHeight + 8,
      expandedHeight: 100.0,
      floating: true,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: CustomTextField(
                  hint: "Link ou Título do Vídeo",
                  controller: controller,
                  onChanged: onChanged,
                ),
              ),
              const SizedBox(width: 10),
              CustomButton(
                title: isYoutubeUrl ? "Adicionar" : "Buscar",
                onTap: onTap,
                type: ColorType.secondary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
