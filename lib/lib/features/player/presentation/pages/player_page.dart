// lib/features/player/presentation/pages/player_page.dart

import 'package:flutter/material.dart';
import '../../../../core/theme/color_palette.dart';
import '../widgets/continue_watching_card.dart';
import '../widgets/recent_watching_card.dart';

class PlayerPage extends StatefulWidget {
  const PlayerPage({Key? key}) : super(key: key);

  @override
  State<PlayerPage> createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
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
                    'Player',
                    style: theme.textTheme.headlineMedium?.copyWith(
                      color: ColorPalette.textPrimaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.cast),
                  onPressed: () {
                    // Open cast options
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.settings_outlined),
                  onPressed: () {
                    // Open player settings
                  },
                ),
              ],
            ),

            // Continue Watching Section
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 16.0, bottom: 8.0),
                child: Text(
                  'Continue Watching',
                  style: theme.textTheme.titleLarge,
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    ContinueWatchingCard(
                      title: 'Stranger Things',
                      episode: 'S3:E4 "The Sauna Test"',
                      thumbnailUrl: 'https://via.placeholder.com/300x450?text=Stranger+Things',
                      progress: 0.7,
                      remainingTime: '18 min left',
                    ),
                    const SizedBox(height: 12),
                    ContinueWatchingCard(
                      title: 'The Witcher',
                      episode: 'S1:E5 "Bottled Appetites"',
                      thumbnailUrl: 'https://via.placeholder.com/300x450?text=The+Witcher',
                      progress: 0.3,
                      remainingTime: '35 min left',
                    ),
                  ],
                ),
              ),
            ),

            // Recently Watched Section
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 24.0, bottom: 12.0),
                child: Text(
                  'Recently Watched',
                  style: theme.textTheme.titleLarge,
                ),
              ),
            ),

            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.5,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                delegate: SliverChildListDelegate([
                  RecentWatchingCard(
                    title: 'Money Heist',
                    thumbnailUrl: 'https://via.placeholder.com/300x450?text=Money+Heist',
                    watchedDate: '2 days ago',
                  ),
                  RecentWatchingCard(
                    title: 'Breaking Bad',
                    thumbnailUrl: 'https://via.placeholder.com/300x450?text=Breaking+Bad',
                    watchedDate: '3 days ago',
                  ),
                  RecentWatchingCard(
                    title: 'Peaky Blinders',
                    thumbnailUrl: 'https://via.placeholder.com/300x450?text=Peaky+Blinders',
                    watchedDate: '5 days ago',
                  ),
                  RecentWatchingCard(
                    title: 'Squid Game',
                    thumbnailUrl: 'https://via.placeholder.com/300x450?text=Squid+Game',
                    watchedDate: '1 week ago',
                  ),
                ]),
              ),
            ),

            // Watch History Button
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to watch history
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorPalette.surfaceColor,
                    foregroundColor: ColorPalette.textPrimaryColor,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.0),
                    child: Text('View Watch History'),
                  ),
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
    );
  }
}