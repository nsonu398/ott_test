// lib/features/downloads/presentation/pages/downloads_page.dart

import 'package:flutter/material.dart';
import '../../../../core/theme/color_palette.dart';
import '../widgets/download_tile.dart';
import '../widgets/storage_info_card.dart';

class DownloadsPage extends StatefulWidget {
  const DownloadsPage({Key? key}) : super(key: key);

  @override
  State<DownloadsPage> createState() => _DownloadsPageState();
}

class _DownloadsPageState extends State<DownloadsPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // App Bar
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Downloads',
                    style: theme.textTheme.headlineMedium?.copyWith(
                      color: ColorPalette.textPrimaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.settings_outlined),
                        onPressed: () {
                          // Navigate to download settings
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: () {
                          // Navigate to search
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Storage information
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: StorageInfoCard(
                usedSpace: 2.7,
                totalSpace: 16.0,
                percentageUsed: 0.17,
              ),
            ),

            const SizedBox(height: 16),

            // Tab Bar
            TabBar(
              controller: _tabController,
              labelColor: ColorPalette.primaryColor,
              unselectedLabelColor: ColorPalette.textSecondaryColor,
              indicatorColor: ColorPalette.primaryColor,
              tabs: const [
                Tab(text: 'My Downloads'),
                Tab(text: 'Smart Downloads'),
              ],
            ),

            // Tab Content
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  // My Downloads Tab
                  _buildMyDownloadsTab(),

                  // Smart Downloads Tab
                  _buildSmartDownloadsTab(),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to browse content for downloading
        },
        backgroundColor: ColorPalette.primaryColor,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildMyDownloadsTab() {
    // Mock data for downloaded content
    final downloadedItems = [
      {
        'title': 'Stranger Things',
        'episode': 'S3:E4 "The Sauna Test"',
        'thumbnailUrl': 'https://via.placeholder.com/300x450?text=Stranger+Things',
        'size': '420 MB',
        'quality': 'HD',
        'isDownloading': false,
        'progress': 1.0,
      },
      {
        'title': 'The Witcher',
        'episode': 'S1:E5 "Bottled Appetites"',
        'thumbnailUrl': 'https://via.placeholder.com/300x450?text=The+Witcher',
        'size': '380 MB',
        'quality': 'HD',
        'isDownloading': false,
        'progress': 1.0,
      },
      {
        'title': 'Breaking Bad',
        'episode': 'S4:E6 "Cornered"',
        'thumbnailUrl': 'https://via.placeholder.com/300x450?text=Breaking+Bad',
        'size': '340 MB',
        'quality': 'SD',
        'isDownloading': false,
        'progress': 1.0,
      },
      {
        'title': 'Squid Game',
        'episode': 'S1:E2 "Hell"',
        'thumbnailUrl': 'https://via.placeholder.com/300x450?text=Squid+Game',
        'size': '520 MB',
        'quality': 'HD',
        'isDownloading': true,
        'progress': 0.65,
      },
    ];

    if (downloadedItems.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.download_done_outlined,
              size: 80,
              color: ColorPalette.textSecondaryColor.withOpacity(0.5),
            ),
            const SizedBox(height: 16),
            const Text(
              'No Downloads Yet',
              style: TextStyle(
                color: ColorPalette.textPrimaryColor,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Download shows and movies to watch offline',
              style: TextStyle(
                color: ColorPalette.textSecondaryColor,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Navigate to browse content
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorPalette.primaryColor,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              child: const Text('Browse Content'),
            ),
          ],
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: downloadedItems.length,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final item = downloadedItems[index];
        return DownloadTile(
          title: item['title'] as String,
          episode: item['episode'] as String,
          thumbnailUrl: item['thumbnailUrl'] as String,
          size: item['size'] as String,
          quality: item['quality'] as String,
          isDownloading: item['isDownloading'] as bool,
          progress: item['progress'] as double,
          onPlay: () {
            // Play downloaded content
          },
          onDelete: () {
            // Delete downloaded content
          },
        );
      },
    );
  }

  Widget _buildSmartDownloadsTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Smart Downloads explanation
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: ColorPalette.surfaceColor,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: ColorPalette.dividerColor),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: ColorPalette.accentColor,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.auto_awesome,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Text(
                      'Smart Downloads',
                      style: TextStyle(
                        color: ColorPalette.textPrimaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                const Text(
                  'When you finish watching a downloaded episode, we\'ll automatically delete it and download the next episode when you\'re on Wi-Fi.',
                  style: TextStyle(
                    color: ColorPalette.textSecondaryColor,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Enable Smart Downloads',
                      style: TextStyle(
                        color: ColorPalette.textPrimaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Switch(
                      value: true,
                      onChanged: (value) {
                        // Toggle smart downloads
                      },
                      activeColor: ColorPalette.primaryColor,
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Scheduled Downloads
          const Text(
            'Scheduled Downloads',
            style: TextStyle(
              color: ColorPalette.textPrimaryColor,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: ColorPalette.surfaceColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(
                    Icons.schedule,
                    color: ColorPalette.accentColor,
                  ),
                  title: const Text(
                    'Download at night (2:00 AM - 6:00 AM)',
                    style: TextStyle(
                      color: ColorPalette.textPrimaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  subtitle: const Text(
                    'Save data by downloading during off-peak hours',
                    style: TextStyle(
                      color: ColorPalette.textSecondaryColor,
                      fontSize: 12,
                    ),
                  ),
                  trailing: Switch(
                    value: false,
                    onChanged: (value) {
                      // Toggle night downloads
                    },
                    activeColor: ColorPalette.primaryColor,
                  ),
                ),
                const Divider(color: ColorPalette.dividerColor),
                ListTile(
                  leading: const Icon(
                    Icons.wifi,
                    color: ColorPalette.accentColor,
                  ),
                  title: const Text(
                    'Wi-Fi Only',
                    style: TextStyle(
                      color: ColorPalette.textPrimaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  subtitle: const Text(
                    'Download only when connected to Wi-Fi',
                    style: TextStyle(
                      color: ColorPalette.textSecondaryColor,
                      fontSize: 12,
                    ),
                  ),
                  trailing: Switch(
                    value: true,
                    onChanged: (value) {
                      // Toggle Wi-Fi only
                    },
                    activeColor: ColorPalette.primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}