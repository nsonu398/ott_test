// lib/features/home/domain/repositories/content_repository.dart

import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/content_entity.dart';

abstract class ContentRepository {
  Future<Either<Failure, List<ContentEntity>>> getTrendingContent();
  Future<Either<Failure, List<ContentEntity>>> getContentByCategory(String category);
  Future<Either<Failure, ContentEntity>> getContentDetails(String id);
  Future<Either<Failure, List<ContentEntity>>> searchContent(String query);
}