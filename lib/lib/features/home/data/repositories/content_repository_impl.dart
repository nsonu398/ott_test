// lib/features/home/data/repositories/content_repository_impl.dart

import 'package:dartz/dartz.dart';
import '../../../../core/api/network_info.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/content_entity.dart';
import '../../domain/repositories/content_repository.dart';
import '../datasources/content_remote_data_source.dart';

class ContentRepositoryImpl implements ContentRepository {
  final ContentRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  ContentRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<ContentEntity>>> getTrendingContent() async {
    return await _getContent(() => remoteDataSource.getTrendingContent());
  }

  @override
  Future<Either<Failure, List<ContentEntity>>> getContentByCategory(
      String category) async {
    return await _getContent(() => remoteDataSource.getContentByCategory(category));
  }

  @override
  Future<Either<Failure, ContentEntity>> getContentDetails(String id) async {
    if (await networkInfo.isConnected) {
      try {
        final contentDetails = await remoteDataSource.getContentDetails(id);
        return Right(contentDetails);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message, statusCode: e.statusCode));
      } on NotFoundException {
        return const Left(NotFoundFailure());
      } catch (e) {
        return Left(ServerFailure(message: e.toString()));
      }
    } else {
      return const Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, List<ContentEntity>>> searchContent(String query) async {
    return await _getContent(() => remoteDataSource.searchContent(query));
  }

  Future<Either<Failure, List<ContentEntity>>> _getContent(
      Future<List<ContentEntity>> Function() getContent) async {
    if (await networkInfo.isConnected) {
      try {
        final content = await getContent();
        return Right(content);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message, statusCode: e.statusCode));
      } catch (e) {
        return Left(ServerFailure(message: e.toString()));
      }
    } else {
      return const Left(NetworkFailure());
    }
  }
}