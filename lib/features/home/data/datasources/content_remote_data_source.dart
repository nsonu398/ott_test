// lib/features/home/data/datasources/content_remote_data_source.dart

import '../../../../core/api/api_client.dart';
import '../../../../core/errors/exceptions.dart';
import '../models/content_model.dart';

abstract class ContentRemoteDataSource {
  Future<List<ContentModel>> getTrendingContent();
  Future<List<ContentModel>> getContentByCategory(String category);
  Future<ContentModel> getContentDetails(String id);
  Future<List<ContentModel>> searchContent(String query);
}

class ContentRemoteDataSourceImpl implements ContentRemoteDataSource {
  final ApiClient client;

  ContentRemoteDataSourceImpl({required this.client});

  @override
  Future<List<ContentModel>> getTrendingContent() async {
    try {
      final response = await client.get('/content/trending');

      return (response['data'] as List)
          .map((item) => ContentModel.fromJson(item))
          .toList();
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<List<ContentModel>> getContentByCategory(String category) async {
    try {
      final response = await client.get('/content/category/$category');

      return (response['data'] as List)
          .map((item) => ContentModel.fromJson(item))
          .toList();
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<ContentModel> getContentDetails(String id) async {
    try {
      final response = await client.get('/content/$id');

      return ContentModel.fromJson(response['data']);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<List<ContentModel>> searchContent(String query) async {
    try {
      final response = await client.get('/content/search?q=$query');

      return (response['data'] as List)
          .map((item) => ContentModel.fromJson(item))
          .toList();
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}