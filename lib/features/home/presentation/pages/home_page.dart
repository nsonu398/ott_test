// lib/features/home/presentation/pages/home_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/color_palette.dart';
import '../widgets/content_carousel.dart';
import '../widgets/featured_content.dart';
import '../widgets/category_selector.dart';
import '../../domain/entities/content_entity.dart';
import '../../../explore/presentation/pages/explore_page.dart';
import '../../../player/presentation/pages/player_page.dart';
import '../../../downloads/presentation/pages/downloads_page.dart';
import '../bloc/home_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  // List of categories for the category selector
  final List<String> categories = [
    'All', 'Movies', 'TV Shows', 'Originals', 'Documentaries'
  ];

  // Mock featured content - In a real app, this would also come from a repository
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
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          // Home Tab
          _buildHomeTab(),

          // Explore Tab
          const ExplorePage(),

          // Player Tab
          const PlayerPage(),

          // Downloads Tab
          const DownloadsPage(),
        ],
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
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  Widget _buildHomeTab() {
    final theme = Theme.of(context);

    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return SafeArea(
          child: RefreshIndicator(
            color: ColorPalette.primaryColor,
            onRefresh: () async {
              context.read<HomeBloc>().add(RefreshHomeContent());
              // Wait for the refresh to complete
              return await Future.delayed(const Duration(seconds: 2));
            },
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
                        context.read<HomeBloc>().add(SelectCategory(category));
                      },
                    ),
                  ),
                ),

                // Error State
                if (state is HomeError)
                  SliverFillRemaining(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.error_outline,
                            size: 60,
                            color: ColorPalette.errorColor,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Something went wrong',
                            style: theme.textTheme.titleLarge,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            state.message,
                            style: theme.textTheme.bodyMedium,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: () {
                              context.read<HomeBloc>().add(LoadHomeContent());
                            },
                            child: const Text('Try Again'),
                          ),
                        ],
                      ),
                    ),
                  )
                else ...[
                  // Trending Now Section
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
                        title: 'Trending Now',
                        contentList: state is HomeLoaded || state is HomeRefreshing
                            ? state is HomeLoaded
                            ? state.trendingContent
                            : (state as HomeRefreshing).trendingContent
                            : [],
                        isLoading: state is HomeLoading || state is HomeRefreshing,
                      ),
                    ),
                  ),

                  // For now, we'll keep these sections with mock data
                  // In a real app, you would add more BLoC events and states to load these categories

                  // Popular Movies Section
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
                        title: 'Popular Movies',
                        contentList: _getMoviesContent(),
                        isLoading: false,
                      ),
                    ),
                  ),

                  // Top TV Shows Section
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
                        title: 'Top TV Shows',
                        contentList: _getTvShowsContent(),
                        isLoading: false,
                      ),
                    ),
                  ),

                  // Recently Added Section
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
                        title: 'Recently Added',
                        contentList: _getRecentContent(),
                        isLoading: false,
                      ),
                    ),
                  ),
                ],

                // Bottom padding
                const SliverToBoxAdapter(
                  child: SizedBox(height: 24),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // These mock data generators can be removed once you implement proper API calls for these categories
  List<ContentEntity> _getMoviesContent() {
    return [
      ContentEntity(
        id: '6',
        title: 'The Irishman',
        description: 'An aging hitman recalls his time with the mob and his involvement with Jimmy Hoffa.',
        posterUrl: 'https://via.placeholder.com/300x450?text=Irishman',
        backdropUrl: 'https://via.placeholder.com/1920x1080',
        rating: 4.0,
        releaseYear: 2019,
        categories: ['Crime', 'Drama'],
        duration: '3h 30m',
        isOriginal: true,
      ),
      ContentEntity(
        id: '7',
        title: 'Inception',
        description: 'A thief who steals corporate secrets through the use of dream-sharing technology.',
        posterUrl: 'https://via.placeholder.com/300x450?text=Inception',
        backdropUrl: 'https://via.placeholder.com/1920x1080',
        rating: 4.7,
        releaseYear: 2010,
        categories: ['Sci-Fi', 'Action'],
        duration: '2h 28m',
      ),
      ContentEntity(
        id: '8',
        title: 'The Dark Knight',
        description: 'Batman faces his greatest challenge as the Joker wreaks havoc on Gotham City.',
        posterUrl: 'https://via.placeholder.com/300x450?text=Dark+Knight',
        backdropUrl: 'https://via.placeholder.com/1920x1080',
        rating: 4.9,
        releaseYear: 2008,
        categories: ['Action', 'Crime'],
        duration: '2h 32m',
      ),
      ContentEntity(
        id: '9',
        title: 'The Matrix',
        description: 'A computer hacker learns from mysterious rebels about the true nature of his reality.',
        posterUrl: 'https://via.placeholder.com/300x450?text=Matrix',
        backdropUrl: 'https://via.placeholder.com/1920x1080',
        rating: 4.5,
        releaseYear: 1999,
        categories: ['Sci-Fi', 'Action'],
        duration: '2h 16m',
      ),
      ContentEntity(
        id: '10',
        title: 'Parasite',
        description: 'Greed and class discrimination threaten the newly formed symbiotic relationship between a wealthy family and a destitute one.',
        posterUrl: 'https://via.placeholder.com/300x450?text=Parasite',
        backdropUrl: 'https://via.placeholder.com/1920x1080',
        rating: 4.6,
        releaseYear: 2019,
        categories: ['Thriller', 'Drama'],
        duration: '2h 12m',
      ),
    ];
  }

  List<ContentEntity> _getTvShowsContent() {
    return [
      ContentEntity(
        id: '11',
        title: 'Game of Thrones',
        description: 'Nine noble families fight for control over the lands of Westeros.',
        posterUrl: 'https://via.placeholder.com/300x450?text=GoT',
        backdropUrl: 'https://via.placeholder.com/1920x1080',
        rating: 4.7,
        releaseYear: 2011,
        categories: ['Fantasy', 'Drama'],
        duration: '60 min',
      ),
      ContentEntity(
        id: '12',
        title: 'The Crown',
        description: 'Follows the political rivalries and romance of Queen Elizabeth II\'s reign.',
        posterUrl: 'https://via.placeholder.com/300x450?text=Crown',
        backdropUrl: 'https://via.placeholder.com/1920x1080',
        rating: 4.3,
        releaseYear: 2016,
        categories: ['Drama', 'History'],
        duration: '58 min',
        isOriginal: true,
      ),
      ContentEntity(
        id: '13',
        title: 'Peaky Blinders',
        description: 'A gangster family epic set in Birmingham, England, in 1919.',
        posterUrl: 'https://via.placeholder.com/300x450?text=Peaky+Blinders',
        backdropUrl: 'https://via.placeholder.com/1920x1080',
        rating: 4.5,
        releaseYear: 2013,
        categories: ['Crime', 'Drama'],
        duration: '55 min',
      ),
      ContentEntity(
        id: '14',
        title: 'Chernobyl',
        description: 'In April 1986, an explosion at the Chernobyl nuclear power plant becomes one of the world\'s worst man-made catastrophes.',
        posterUrl: 'https://via.placeholder.com/300x450?text=Chernobyl',
        backdropUrl: 'https://via.placeholder.com/1920x1080',
        rating: 4.9,
        releaseYear: 2019,
        categories: ['Drama', 'History'],
        duration: '65 min',
      ),
      ContentEntity(
        id: '15',
        title: 'Black Mirror',
        description: 'An anthology series exploring a twisted high-tech world.',
        posterUrl: 'https://via.placeholder.com/300x450?text=Black+Mirror',
        backdropUrl: 'https://via.placeholder.com/1920x1080',
        rating: 4.4,
        releaseYear: 2011,
        categories: ['Sci-Fi', 'Drama'],
        duration: '60 min',
        isOriginal: true,
      ),
    ];
  }

  List<ContentEntity> _getRecentContent() {
    return [
      ContentEntity(
        id: '16',
        title: 'The Mandalorian',
        description: 'The travels of a lone bounty hunter in the outer reaches of the galaxy.',
        posterUrl: 'https://via.placeholder.com/300x450?text=Mandalorian',
        backdropUrl: 'https://via.placeholder.com/1920x1080',
        rating: 4.6,
        releaseYear: 2019,
        categories: ['Sci-Fi', 'Action'],
        duration: '40 min',
      ),
      ContentEntity(
        id: '17',
        title: 'Squid Game',
        description: 'Hundreds of cash-strapped players accept a strange invitation to compete in children\'s games.',
        posterUrl: 'https://via.placeholder.com/300x450?text=Squid+Game',
        backdropUrl: 'https://via.placeholder.com/1920x1080',
        rating: 4.4,
        releaseYear: 2021,
        categories: ['Thriller', 'Drama'],
        duration: '55 min',
        isOriginal: true,
      ),
      ContentEntity(
        id: '18',
        title: 'Loki',
        description: 'The mercurial villain Loki resumes his role as the God of Mischief in a new series.',
        posterUrl: 'https://via.placeholder.com/300x450?text=Loki',
        backdropUrl: 'https://via.placeholder.com/1920x1080',
        rating: 4.2,
        releaseYear: 2021,
        categories: ['Fantasy', 'Adventure'],
        duration: '50 min',
      ),
      ContentEntity(
        id: '19',
        title: 'Foundation',
        description: 'A complex saga of humans scattered on planets throughout the galaxy.',
        posterUrl: 'https://via.placeholder.com/300x450?text=Foundation',
        backdropUrl: 'https://via.placeholder.com/1920x1080',
        rating: 4.0,
        releaseYear: 2021,
        categories: ['Sci-Fi', 'Drama'],
        duration: '60 min',
      ),
      ContentEntity(
        id: '20',
        title: 'Invincible',
        description: 'An adult animated series based on the comic of the same name.',
        posterUrl: 'https://via.placeholder.com/300x450?text=Invincible',
        backdropUrl: 'https://via.placeholder.com/1920x1080',
        rating: 4.7,
        releaseYear: 2021,
        categories: ['Animation', 'Action'],
        duration: '45 min',
      ),
    ];
  }
}