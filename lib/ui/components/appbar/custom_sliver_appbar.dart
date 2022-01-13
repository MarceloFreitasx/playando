import 'package:flutter/material.dart';

import '../../../validators/validators.dart';
import '../../helpers/helpers.dart';
import '../../styles/styles.dart';
import '../components.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    Key? key,
    this.title = "Playando",
    this.actions,
    this.onTap,
    this.formKey,
    this.controller,
    this.onChanged,
    this.isYoutubeUrl = false,
  }) : super(key: key);

  final String title;
  final List<Widget>? actions;
  final GlobalKey<FormState>? formKey;
  final TextEditingController? controller;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;
  final bool isYoutubeUrl;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: actions,
      backgroundColor: AppColors.primary,
      centerTitle: true,
      toolbarHeight: controller == null ? kToolbarHeight : kToolbarHeight + 8,
      expandedHeight: controller == null ? null : 100.0,
      floating: true,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0.0),
        child: controller == null
            ? const SizedBox.shrink()
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Form(
                        key: formKey,
                        child: CustomTextField(
                          hint: "Link ou Título do Vídeo",
                          controller: controller,
                          onChanged: onChanged,
                          validator: DefaultRequiredValidator(),
                        ),
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
