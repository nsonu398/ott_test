// lib/features/home/domain/entities/content_entity.dart

import 'package:equatable/equatable.dart';

class ContentEntity extends Equatable {
  final String id;
  final String title;
  final String description;
  final String posterUrl;
  final String backdropUrl;
  final double rating;
  final int releaseYear;
  final List<String> categories;
  final String duration;
  final bool isOriginal;
  final String? trailerUrl;
  final String? maturityRating;
  final bool isPremium;

  const ContentEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.posterUrl,
    required this.backdropUrl,
    required this.rating,
    required this.releaseYear,
    required this.categories,
    required this.duration,
    this.isOriginal = false,
    this.trailerUrl,
    this.maturityRating,
    this.isPremium = false,
  });

  @override
  List<Object?> get props => [
    id, title, description, posterUrl, backdropUrl,
    rating, releaseYear, categories, duration, isOriginal,
    trailerUrl, maturityRating, isPremium
  ];
}