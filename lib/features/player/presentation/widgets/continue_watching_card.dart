// lib/features/player/presentation/widgets/continue_watching_card.dart

import 'package:flutter/material.dart';
import '../../../../core/theme/color_palette.dart';

class ContinueWatchingCard extends StatelessWidget {
  final String title;
  final String episode;
  final String thumbnailUrl;
  final double progress;
  final String remainingTime;

  const ContinueWatchingCard({
    Key? key,
    required this.title,
    required this.episode,
    required this.thumbnailUrl,
    required this.progress,
    required this.remainingTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorPalette.surfaceColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Thumbnail with play button
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                child: Image.network(
                  thumbnailUrl,
                  height: 100,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 100,
                      width: double.infinity,
                      color: ColorPalette.cardColor,
                      child: const Icon(
                        Icons.image_not_supported,
                        color: ColorPalette.textSecondaryColor,
                      ),
                    );
                  },
                ),
              ),
              Positioned.fill(
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: ColorPalette.primaryColor,
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(12),
                    child: const Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  child: Text(
                    remainingTime,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Progress bar
          LinearProgressIndicator(
            value: progress,
            backgroundColor: ColorPalette.surfaceColor.withOpacity(0.5),
            valueColor: const AlwaysStoppedAnimation<Color>(ColorPalette.primaryColor),
            minHeight: 3,
          ),

          // Content info
          Padding(
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
                ),
              ],
            ),
          ),

          // Action buttons
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
            child: Row(
              children: [
                _buildActionButton(Icons.info_outline, 'Info'),
                const SizedBox(width: 12),
                _buildActionButton(Icons.download, 'Download'),
                const SizedBox(width: 12),
                _buildActionButton(Icons.more_horiz, 'More'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String label) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: ColorPalette.backgroundColor,
          borderRadius: BorderRadius.circular(6),
        ),
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          children: [
            Icon(
              icon,
              color: ColorPalette.textSecondaryColor,
              size: 18,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: const TextStyle(
                color: ColorPalette.textSecondaryColor,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}