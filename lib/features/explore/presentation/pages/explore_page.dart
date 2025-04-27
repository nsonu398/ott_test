// lib/features/explore/presentation/pages/explore_page.dart

import 'package:flutter/material.dart';
import '../../../../core/theme/color_palette.dart';
import '../../../home/presentation/widgets/category_selector.dart';
import '../widgets/genre_grid.dart';
import '../widgets/search_bar_widget.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  // Mock data for categories
  final List<String> categories = [
    'All', 'Movies', 'TV Shows', 'Originals', 'Documentaries'
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // App Bar
            SliverAppBar(
              floating: true,
              pinned: false,
              backgroundColor: ColorPalette.backgroundColor,
              title: Row(
                children: [
                  Text(
                    'Explore',
                    style: theme.textTheme.headlineMedium?.copyWith(
                      color: ColorPalette.textPrimaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.person_outline),
                  onPressed: () {
                    // Navigate to profile
                  },
                ),
              ],
            ),

            // Search Bar
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SearchBarWidget(
                  onSearch: (query) {
                    // Handle search
                    print('Search query: $query');
                  },
                ),
              ),
            ),

            // Categories
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: CategorySelector(
                  categories: categories,
                  onCategorySelected: (category) {
                    // Handle category selection
                    print('Selected category: $category');
                  },
                ),
              ),
            ),

            // Popular Genres
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Popular Genres',
                  style: theme.textTheme.titleLarge,
                ),
              ),
            ),

            // Genres Grid
            SliverToBoxAdapter(
              child: GenreGrid(),
            ),

            // Bottom padding
            const SliverToBoxAdapter(
              child: SizedBox(height: 24),
            ),
          ],
        ),
      ),
    );
  }
}