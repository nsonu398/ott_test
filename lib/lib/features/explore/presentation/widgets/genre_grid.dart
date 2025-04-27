// lib/features/explore/presentation/widgets/genre_grid.dart

import 'package:flutter/material.dart';
import '../../../../core/theme/color_palette.dart';

class GenreGrid extends StatelessWidget {
  GenreGrid({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> genres = [
    {
      'name': 'Action',
      'icon': Icons.local_fire_department,
      'color': Colors.red.shade800,
    },
    {
      'name': 'Comedy',
      'icon': Icons.emoji_emotions,
      'color': Colors.amber.shade700,
    },
    {
      'name': 'Drama',
      'icon': Icons.theater_comedy,
      'color': Colors.purple.shade800,
    },
    {
      'name': 'Horror',
      'icon': Icons.flash_on,
      'color': Colors.black87,
    },
    {
      'name': 'Sci-Fi',
      'icon': Icons.rocket_launch,
      'color': Colors.blue.shade800,
    },
    {
      'name': 'Romance',
      'icon': Icons.favorite,
      'color': Colors.pink.shade600,
    },
    {
      'name': 'Fantasy',
      'icon': Icons.auto_fix_high,
      'color': Colors.deepPurple.shade600,
    },
    {
      'name': 'Thriller',
      'icon': Icons.psychology,
      'color': Colors.deepOrange.shade800,
    },
    {
      'name': 'Mystery',
      'icon': Icons.search,
      'color': Colors.indigo.shade800,
    },
    {
      'name': 'Documentary',
      'icon': Icons.video_camera_back,
      'color': Colors.teal.shade700,
    },
    {
      'name': 'Animation',
      'icon': Icons.animation,
      'color': Colors.green.shade600,
    },
    {
      'name': 'Family',
      'icon': Icons.family_restroom,
      'color': Colors.cyan.shade700,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1.2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: genres.length,
        itemBuilder: (context, index) {
          final genre = genres[index];
          return GestureDetector(
            onTap: () {
              // Navigate to genre specific page
              print('Selected genre: ${genre['name']}');
            },
            child: Container(
              decoration: BoxDecoration(
                color: ColorPalette.surfaceColor,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: genre['color'],
                  width: 2,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    genre['icon'] as IconData,
                    color: genre['color'] as Color,
                    size: 28,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    genre['name'] as String,
                    style: const TextStyle(
                      color: ColorPalette.textPrimaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}