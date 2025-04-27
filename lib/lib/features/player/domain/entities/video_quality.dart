// lib/features/player/domain/entities/video_quality.dart

import 'package:equatable/equatable.dart';

class VideoQuality extends Equatable {
  final String label;
  final int height;
  final int bitrate;

  const VideoQuality({
    required this.label,
    required this.height,
    required this.bitrate,
  });

  // Predefined quality options
  static const VideoQuality auto = VideoQuality(
    label: 'Auto',
    height: 0, // Adaptive
    bitrate: 0, // Adaptive
  );

  static const VideoQuality lowData = VideoQuality(
    label: 'Data Saver',
    height: 240,
    bitrate: 300000, // 300kbps
  );

  static const VideoQuality sd = VideoQuality(
    label: 'SD (480p)',
    height: 480,
    bitrate: 1000000, // 1Mbps
  );

  static const VideoQuality hd = VideoQuality(
    label: 'HD (720p)',
    height: 720,
    bitrate: 2500000, // 2.5Mbps
  );

  static const VideoQuality fullHd = VideoQuality(
    label: 'Full HD (1080p)',
    height: 1080,
    bitrate: 5000000, // 5Mbps
  );

  static const VideoQuality uhd = VideoQuality(
    label: '4K UHD (2160p)',
    height: 2160,
    bitrate: 16000000, // 16Mbps
  );

  @override
  List<Object?> get props => [label, height, bitrate];
}