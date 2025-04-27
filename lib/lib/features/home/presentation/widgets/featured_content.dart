// lib/features/home/presentation/widgets/featured_content.dart

import 'package:flutter/material.dart';
import '../../../../core/theme/color_palette.dart';
import '../../domain/entities/content_entity.dart';

class FeaturedContent extends StatelessWidget {
  final ContentEntity content;

  const FeaturedContent({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        // Background image
        ShaderMask(
          shaderCallback: (rect) {
            return LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(0.1),
                Colors.black.withOpacity(0.9),
              ],
            ).createShader(rect);
          },
          blendMode: BlendMode.darken,
          child: Image.network(
            content.backdropUrl,
            width: screenSize.width,
            height: screenSize.width * 0.65,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              // Fallback gradient in case the image fails to load
              return Container(
                width: screenSize.width,
                height: screenSize.width * 0.65,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      ColorPalette.surfaceColor,
                      ColorPalette.backgroundColor,
                    ],
                  ),
                ),
                child: const Center(
                  child: Icon(
                    Icons.image_not_supported,
                    size: 48,
                    color: ColorPalette.textSecondaryColor,
                  ),
                ),
              );
            },
          ),
        ),

        // Content information overlay
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Title
              Text(
                content.title,
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),

              const SizedBox(height: 8),

              // Categories
              Row(
                children: [
                  for (int i = 0; i < content.categories.length; i++) ...[
                    if (i > 0)
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.0),
                        child: Text(
                          '•',
                          style: TextStyle(
                            color: ColorPalette.textSecondaryColor,
                          ),
                        ),
                      ),
                    Text(
                      content.categories[i],
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: ColorPalette.textSecondaryColor,
                      ),
                    ),
                  ],
                ],
              ),

              const SizedBox(height: 4),

              // Year and Duration
              Row(
                children: [
                  Text(
                    content.releaseYear.toString(),
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: ColorPalette.textSecondaryColor,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.0),
                    child: Text(
                      '•',
                      style: TextStyle(color: ColorPalette.textSecondaryColor),
                    ),
                  ),
                  Text(
                    content.duration,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: ColorPalette.textSecondaryColor,
                    ),
                  ),
                  if (content.maturityRating != null) ...[
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.0),
                      child: Text(
                        '•',
                        style: TextStyle(
                          color: ColorPalette.textSecondaryColor,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 4,
                        vertical: 1,
                      ),
                      decoration: BoxDecoration(
                        color: ColorPalette.textSecondaryColor,
                        borderRadius: BorderRadius.circular(2),
                      ),
                      child: Text(
                        content.maturityRating!,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: ColorPalette.backgroundColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ],
              ),

              const SizedBox(height: 12),

              // Action buttons
              Row(
                children: [
                  // Play button
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // Navigate to player
                        Navigator.of(context).pushNamed(
                          '/video-player',
                          arguments: {
                            'content': content,
                            'videoUrl': 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4', // Mock URL
                          },
                        );
                      },
                      icon: const Icon(Icons.play_arrow),
                      label: const Text('Play'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorPalette.primaryColor,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ),

                  const SizedBox(width: 8),

                  // My List button
                  IconButton(
                    onPressed: () {
                      // Add to watchlist
                    },
                    icon: const Icon(Icons.add),
                    style: IconButton.styleFrom(
                      backgroundColor: ColorPalette.surfaceColor.withOpacity(
                        0.7,
                      ),
                      foregroundColor: ColorPalette.textPrimaryColor,
                    ),
                  ),

                  const SizedBox(width: 8),

                  // Info button
                  IconButton(
                    onPressed: () {
                      // Show more info
                    },
                    icon: const Icon(Icons.info_outline),
                    style: IconButton.styleFrom(
                      backgroundColor: ColorPalette.surfaceColor.withOpacity(
                        0.7,
                      ),
                      foregroundColor: ColorPalette.textPrimaryColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
