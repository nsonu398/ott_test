// lib/features/home/presentation/widgets/content_card.dart

import 'package:flutter/material.dart';
import '../../../../core/theme/color_palette.dart';
import '../../domain/entities/content_entity.dart';

class ContentCard extends StatelessWidget {
  final ContentEntity content;
  final double width;
  final double height;
  final bool showRating;

  const ContentCard({
    Key? key,
    required this.content,
    this.width = 130,
    this.height = 190,
    this.showRating = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to content details
      },
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Stack(
          children: [
            // Poster image
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                content.posterUrl,
                width: width,
                height: height,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: width,
                    height: height,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: ColorPalette.surfaceColor,
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.image_not_supported,
                        color: ColorPalette.textSecondaryColor,
                      ),
                    ),
                  );
                },
              ),
            ),

            // Gradient overlay for better text visibility
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: height * 0.4,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.7),
                    ],
                  ),
                ),
              ),
            ),

            // Content info
            Positioned(
              bottom: 8,
              left: 8,
              right: 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Title
                  Text(
                    content.title,
                    style: const TextStyle(
                      color: ColorPalette.textPrimaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),

                  const SizedBox(height: 2),

                  // Year and rating
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        content.releaseYear.toString(),
                        style: const TextStyle(
                          color: ColorPalette.textSecondaryColor,
                          fontSize: 10,
                        ),
                      ),
                      if (showRating)
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 12,
                            ),
                            const SizedBox(width: 2),
                            Text(
                              content.rating.toString(),
                              style: const TextStyle(
                                color: ColorPalette.textSecondaryColor,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ],
              ),
            ),

            // Original badge
            if (content.isOriginal)
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: ColorPalette.primaryColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text(
                    'Original',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

            // Premium badge
            if (content.isPremium)
              Positioned(
                top: content.isOriginal ? 32 : 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: ColorPalette.premiumColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text(
                    'Premium',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 8,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}