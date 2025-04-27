// lib/features/downloads/presentation/widgets/download_tile.dart

import 'package:flutter/material.dart';
import '../../../../core/theme/color_palette.dart';

class DownloadTile extends StatelessWidget {
  final String title;
  final String episode;
  final String thumbnailUrl;
  final String size;
  final String quality;
  final bool isDownloading;
  final double progress;
  final VoidCallback onPlay;
  final VoidCallback onDelete;

  const DownloadTile({
    Key? key,
    required this.title,
    required this.episode,
    required this.thumbnailUrl,
    required this.size,
    required this.quality,
    required this.isDownloading,
    required this.progress,
    required this.onPlay,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorPalette.surfaceColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Thumbnail
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
            child: Stack(
              children: [
                Image.network(
                  thumbnailUrl,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 100,
                      height: 100,
                      color: ColorPalette.cardColor,
                      child: const Icon(
                        Icons.image_not_supported,
                        color: ColorPalette.textSecondaryColor,
                      ),
                    );
                  },
                ),
                if (isDownloading)
                  Positioned.fill(
                    child: Container(
                      color: Colors.black.withOpacity(0.7),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 36,
                            height: 36,
                            child: CircularProgressIndicator(
                              value: progress,
                              strokeWidth: 3,
                              valueColor: const AlwaysStoppedAnimation<Color>(
                                ColorPalette.primaryColor,
                              ),
                              backgroundColor: Colors.white.withOpacity(0.3),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${(progress * 100).toInt()}%',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),

          // Content info
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: ColorPalette.textPrimaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    episode,
                    style: const TextStyle(
                      color: ColorPalette.textSecondaryColor,
                      fontSize: 14,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: ColorPalette.backgroundColor,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          quality,
                          style: const TextStyle(
                            color: ColorPalette.textSecondaryColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Icon(
                        Icons.storage,
                        size: 12,
                        color: ColorPalette.textSecondaryColor,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        size,
                        style: const TextStyle(
                          color: ColorPalette.textSecondaryColor,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Action buttons
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Play button
              IconButton(
                onPressed: isDownloading ? null : onPlay,
                icon: const Icon(Icons.play_circle_filled),
                color: isDownloading
                    ? ColorPalette.textSecondaryColor.withOpacity(0.5)
                    : ColorPalette.primaryColor,
                iconSize: 28,
              ),
              // Delete button
              IconButton(
                onPressed: onDelete,
                icon: const Icon(Icons.delete_outline),
                color: ColorPalette.textSecondaryColor,
                iconSize: 24,
              ),
            ],
          ),
          const SizedBox(width: 8),
        ],
      ),
    );
  }
}