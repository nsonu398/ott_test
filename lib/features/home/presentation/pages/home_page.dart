// lib/features/home/presentation/pages/home_page.dart

import 'package:flutter/material.dart';
import '../../../../core/theme/color_palette.dart';
import '../widgets/content_carousel.dart';
import '../widgets/featured_content.dart';
import '../widgets/category_selector.dart';
import '../../domain/entities/content_entity.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Mock data - In a real app, this would come from a repository
  final List<String> categories = [
    'All', 'Movies', 'TV Shows', 'Originals', 'Documentaries'
  ];

  // Mock featured content
  final ContentEntity featuredContent = ContentEntity(
    id: '1',
    title: 'Stranger Things',
    description: 'When a young boy vanishes, a small town uncovers a mystery involving secret experiments, terrifying supernatural forces, and one strange little girl.',
    posterUrl: 'https://cors-anywhere.herokuapp.com/https://drive.google.com/uc?export=view&id=1hWYEMA8bkFiFthDBmb8TPHc9B53Eb2V6',
    backdropUrl: 'https://cors-anywhere.herokuapp.com/https://drive.google.com/uc?export=view&id=1hWYEMA8bkFiFthDBmb8TPHc9B53Eb2V6',
    rating: 4.5,
    releaseYear: 2016,
    categories: ['Sci-Fi', 'Horror', 'Drama'],
    duration: '50 min',
  );

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
                    'OTT',
                    style: theme.textTheme.headlineMedium?.copyWith(
                      color: ColorPalette.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'Stream',
                    style: TextStyle(
                      color: ColorPalette.textPrimaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    // Navigate to search
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.person_outline),
                  onPressed: () {
                    // Navigate to profile
                  },
                ),
              ],
            ),

            // Featured Content
            SliverToBoxAdapter(
              child: FeaturedContent(content: featuredContent),
            ),

            // Categories
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: CategorySelector(
                  categories: categories,
                  onCategorySelected: (category) {
                    // Handle category selection
                    print('Selected category: $category');
                  },
                ),
              ),
            ),

            // Trending Now
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 16.0, bottom: 8.0),
                child: Text(
                  'Trending Now',
                  style: theme.textTheme.titleLarge,
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: SizedBox(
                height: 200,
                child: ContentCarousel(
                  contentType: 'trending',
                ),
              ),
            ),

            // Popular Movies
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 16.0, bottom: 8.0),
                child: Text(
                  'Popular Movies',
                  style: theme.textTheme.titleLarge,
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: SizedBox(
                height: 200,
                child: ContentCarousel(
                  contentType: 'movies',
                ),
              ),
            ),

            // Top TV Shows
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 16.0, bottom: 8.0),
                child: Text(
                  'Top TV Shows',
                  style: theme.textTheme.titleLarge,
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: SizedBox(
                height: 200,
                child: ContentCarousel(
                  contentType: 'tv',
                ),
              ),
            ),

            // Recently Added
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 16.0, bottom: 8.0),
                child: Text(
                  'Recently Added',
                  style: theme.textTheme.titleLarge,
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: SizedBox(
                height: 200,
                child: ContentCarousel(
                  contentType: 'recent',
                ),
              ),
            ),

            // Bottom padding
            const SliverToBoxAdapter(
              child: SizedBox(height: 24),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_circle_outline),
            label: 'Player',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.download),
            label: 'Downloads',
          ),
        ],
        currentIndex: 0,
        onTap: (index) {
          // Handle navigation
        },
      ),
    );
  }
}