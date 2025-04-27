// lib/features/player/presentation/pages/video_player_page.dart

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import '../../../../core/theme/color_palette.dart';
import '../../domain/entities/video_quality.dart';
import '../../../home/domain/entities/content_entity.dart';

class VideoPlayerPage extends StatefulWidget {
  final ContentEntity content;
  final String? episodeTitle;
  final String videoUrl;

  const VideoPlayerPage({
    Key? key,
    required this.content,
    this.episodeTitle,
    required this.videoUrl,
  }) : super(key: key);

  @override
  State<VideoPlayerPage> createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;
  bool _isLoading = true;
  VideoQuality _currentQuality = VideoQuality.hd;
  bool _showQualityOptions = false;
  Timer? _qualityOptionsTimer;

  // List of available qualities
  final List<VideoQuality> _availableQualities = [
    VideoQuality.auto,
    VideoQuality.sd,
    VideoQuality.hd,
    VideoQuality.fullHd,
  ];

  @override
  void initState() {
    super.initState();
    _initializePlayer();
  }

  Future<void> _initializePlayer() async {
    // For actual implementation, you would use the URL provided
    // For now, let's use a sample video URL that actually works
    _videoPlayerController = VideoPlayerController.network(
      // Use a real sample video URL - you would replace this with widget.videoUrl in production
      'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
    );

    await _videoPlayerController.initialize();

    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio: _videoPlayerController.value.aspectRatio,
      autoPlay: true,
      looping: false,
      allowFullScreen: true,
      deviceOrientationsAfterFullScreen: [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
      deviceOrientationsOnEnterFullScreen: [
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ],
      allowedScreenSleep: false,
      // Customize the UI
      materialProgressColors: ChewieProgressColors(
        playedColor: ColorPalette.primaryColor,
        handleColor: ColorPalette.primaryColor,
        backgroundColor: Colors.grey[800]!,
        bufferedColor: Colors.grey[500]!,
      ),
      placeholder: Container(
        color: Colors.black,
        child: const Center(
          child: CircularProgressIndicator(color: ColorPalette.primaryColor),
        ),
      ),
      customControls: const MaterialControls(),
    );

    setState(() {
      _isLoading = false;
    });
  }

  void _toggleQualityOptions() {
    setState(() {
      _showQualityOptions = !_showQualityOptions;
    });

    // Auto-hide quality options after 5 seconds
    if (_showQualityOptions) {
      _qualityOptionsTimer?.cancel();
      _qualityOptionsTimer = Timer(const Duration(seconds: 5), () {
        if (mounted) {
          setState(() {
            _showQualityOptions = false;
          });
        }
      });
    }
  }

  void _changeQuality(VideoQuality quality) {
    setState(() {
      _currentQuality = quality;
      _showQualityOptions = false;
    });

    // In a real app, you would reload the video with a different quality URL
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Quality changed to ${quality.label}'),
        duration: const Duration(seconds: 2),
        backgroundColor: ColorPalette.surfaceColor,
      ),
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    _qualityOptionsTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            // Video player
            if (_isLoading)
              const Center(
                child: CircularProgressIndicator(
                  color: ColorPalette.primaryColor,
                ),
              )
            else
              Center(child: Chewie(controller: _chewieController!)),

            // Custom top bar
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.black.withOpacity(0.7), Colors.transparent],
                  ),
                ),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.content.title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          if (widget.episodeTitle != null)
                            Text(
                              widget.episodeTitle!,
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                            ),
                        ],
                      ),
                    ),
                    // Quality selector button
                    IconButton(
                      icon: const Icon(Icons.settings, color: Colors.white70),
                      onPressed: _toggleQualityOptions,
                    ),
                  ],
                ),
              ),
            ),

            // Quality options popup
            if (_showQualityOptions)
              Positioned(
                top: 60,
                right: 16,
                child: Container(
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text(
                          'Quality',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Divider(color: Colors.white24, height: 1),
                      ...List.generate(_availableQualities.length, (index) {
                        final quality = _availableQualities[index];
                        final isSelected = _currentQuality == quality;

                        return ListTile(
                          dense: true,
                          title: Text(
                            quality.label,
                            style: TextStyle(
                              color:
                                  isSelected
                                      ? ColorPalette.primaryColor
                                      : Colors.white,
                              fontWeight:
                                  isSelected
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                            ),
                          ),
                          trailing:
                              isSelected
                                  ? const Icon(
                                    Icons.check,
                                    color: ColorPalette.primaryColor,
                                    size: 16,
                                  )
                                  : null,
                          onTap: () => _changeQuality(quality),
                        );
                      }),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
