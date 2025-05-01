// lib/features/home/data/models/content_model.dart

import '../../domain/entities/content_entity.dart';

class ContentModel extends ContentEntity {
  const ContentModel({
    required String id,
    required String title,
    required String description,
    required String posterUrl,
    required String backdropUrl,
    required double rating,
    required int releaseYear,
    required List<String> categories,
    required String duration,
    bool isOriginal = false,
    String? trailerUrl,
    String? maturityRating,
    bool isPremium = false,
  }) : super(
    id: id,
    title: title,
    description: description,
    posterUrl: posterUrl,
    backdropUrl: backdropUrl,
    rating: rating,
    releaseYear: releaseYear,
    categories: categories,
    duration: duration,
    isOriginal: isOriginal,
    trailerUrl: trailerUrl,
    maturityRating: maturityRating,
    isPremium: isPremium,
  );

  factory ContentModel.fromJson(Map<String, dynamic> json) {
    return ContentModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      posterUrl: json['poster_url'],
      backdropUrl: json['backdrop_url'],
      rating: json['rating'] is String
          ? double.tryParse(json['rating']) ?? 0.0
          : (json['rating'] as num).toDouble(),
      releaseYear: json['release_year'],
      categories: List<String>.from(json['categories']),
      duration: json['duration'],
      isOriginal: json['is_original'] ?? false,
      trailerUrl: json['trailer_url'],
      maturityRating: json['maturity_rating'],
      isPremium: json['is_premium'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'poster_url': posterUrl,
      'backdrop_url': backdropUrl,
      'rating': rating,
      'release_year': releaseYear,
      'categories': categories,
      'duration': duration,
      'is_original': isOriginal,
      'trailer_url': trailerUrl,
      'maturity_rating': maturityRating,
      'is_premium': isPremium,
    };
  }
}