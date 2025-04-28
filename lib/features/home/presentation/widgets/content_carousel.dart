// lib/features/home/presentation/widgets/content_carousel.dart

import 'package:flutter/material.dart';
import '../../../../core/theme/color_palette.dart';
import '../widgets/content_card.dart';
import '../../domain/entities/content_entity.dart';

class ContentCarousel extends StatelessWidget {
  final String title;
  final List<ContentEntity> contentList;
  final bool isLoading;

  const ContentCarousel({
    Key? key,
    required this.title,
    required this.contentList,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return _buildLoadingIndicator();
    }

    if (contentList.isEmpty) {
      return _buildEmptyState();
    }

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: contentList.length,
      itemBuilder: (context, index) {
        final content = contentList[index];
        return Padding(
          padding: const EdgeInsets.only(right: 12),
          child: ContentCard(content: content),
        );
      },
    );
  }

  Widget _buildLoadingIndicator() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: 5, // Show 5 placeholder items
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(right: 12),
          child: Container(
            width: 130,
            height: 190,
            decoration: BoxDecoration(
              color: ColorPalette.surfaceColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Center(
              child: CircularProgressIndicator(
                color: ColorPalette.primaryColor,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Text(
        'No content available',
        style: TextStyle(color: ColorPalette.textSecondaryColor),
      ),
    );
  }
}