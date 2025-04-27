// lib/features/player/presentation/widgets/recent_watching_card.dart

import 'package:flutter/material.dart';
import '../../../../core/theme/color_palette.dart';

class RecentWatchingCard extends StatelessWidget {
  final String title;
  final String thumbnailUrl;
  final String watchedDate;

  const RecentWatchingCard({
    Key? key,
    required this.title,
    required this.thumbnailUrl,
    required this.watchedDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to content details or resume playback
      },
      child: Container(
        decoration: BoxDecoration(
          color: ColorPalette.surfaceColor,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Stack(
          children: [
            // Thumbnail
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                thumbnailUrl,
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: double.infinity,
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

            // Gradient overlay for better text visibility
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.8),
                    ],
                  ),
                ),
              ),
            ),

            // Play icon
            Positioned.fill(
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: ColorPalette.primaryColor.withOpacity(0.8),
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(8),
                  child: const Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ),

            // Title and date
            Positioned(
              bottom: 8,
              left: 8,
              right: 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: ColorPalette.textPrimaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    watchedDate,
                    style: const TextStyle(
                      color: ColorPalette.textSecondaryColor,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}