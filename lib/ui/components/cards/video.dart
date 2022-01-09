import 'package:flutter/material.dart';

import '../components.dart';

class VideoCard extends StatelessWidget {
  const VideoCard({
    Key? key,
    required this.title,
    this.onPlayPause,
    this.onDelete,
    this.playing = false,
  }) : super(key: key);

  final bool playing;
  final VoidCallback? onPlayPause;
  final VoidCallback? onDelete;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              const AspectRatio(
                aspectRatio: 16 / 9,
                child: CachedImageNetwork(url: "https://i.ytimg.com/vi/dh6ob389CYU/hqdefault.jpg"),
              ),
              Positioned(
                bottom: -15,
                left: 20,
                right: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PlayPauseButton(
                      onTap: onPlayPause,
                      playing: playing,
                    ),
                    RemoveButton(
                      onTap: onDelete,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
