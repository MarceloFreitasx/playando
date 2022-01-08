import 'package:flutter/material.dart';

import '../../styles/styles.dart';

class PlayPauseButton extends StatelessWidget {
  const PlayPauseButton({
    Key? key,
    this.playing = false,
    this.onTap,
  }) : super(key: key);

  final bool playing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: AppColors.primary,
        child: Icon(
          playing ? Icons.pause_rounded : Icons.play_arrow_rounded,
          color: Colors.white,
        ),
      ),
    );
  }
}
