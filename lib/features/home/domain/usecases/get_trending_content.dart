// lib/features/home/domain/usecases/get_trending_content.dart

import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/content_entity.dart';
import '../repositories/content_repository.dart';

class GetTrendingContent {
  final ContentRepository repository;

  GetTrendingContent(this.repository);

  Future<Either<Failure, List<ContentEntity>>> call() async {
    return await repository.getTrendingContent();
  }
}