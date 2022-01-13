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
              if (onPlayPause != null || onDelete != null)
                Positioned(
                  bottom: -15,
                  left: 20,
                  right: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (onPlayPause != null)
                        PlayPauseButton(
                          onTap: onPlayPause,
                          playing: playing,
                        ),
                      if (onDelete != null)
                        RemoveButton(
                          onTap: onDelete,
                        ),
                    ],
                  ),
                ),
            ],
          ),
          if (onPlayPause != null && onDelete != null) const SizedBox(height: 15),
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
