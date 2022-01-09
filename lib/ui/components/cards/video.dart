import 'package:flutter/material.dart';

import '../components.dart';

class VideoCard extends StatelessWidget {
  const VideoCard({
    Key? key,
    required this.title,
    required this.thumbnail,
    this.onPlayPause,
    this.onDelete,
    this.playing = false,
  }) : super(key: key);

  final bool playing;
  final VoidCallback? onPlayPause;
  final VoidCallback? onDelete;
  final String title;
  final String thumbnail;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: CachedImageNetwork(url: thumbnail),
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
