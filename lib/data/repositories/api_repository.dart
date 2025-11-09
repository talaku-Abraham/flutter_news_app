import 'dart:async';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:news_app/data/model/article.dart';
import 'package:news_app/data/model/source.dart';
import 'package:news_app/data/repositories/repository.dart';
import 'package:news_app/utils/safe_api_call.dart';
import 'package:news_app/data/network/model_response.dart';
import 'package:news_app/data/network/query_result.dart';
import 'package:news_app/data/network/service_interface.dart';

class ApiRepository implements Repository {
  final ServiceInterface _service;

  ApiRepository(this._service);

  @override
  Future<List<Article>> fetchNewsByQuery({
    String? q,
    String? sources,
    String? domains,
    String? language,
    String? sortBy,
  }) async {
    final res = await safeApiCall(
      () => _service.queryEverything(
        q: q,
        domains: domains,
        sources: sources,
        language: language,
        sortBy: sortBy,
      ),
    );
    return returnArticlesOrThrowError(res);
    // final res = await  _service.queryEverything(
    //   q: q,
    //   domains: domains,
    //   sources: sources,
    //   language: language,
    //   sortBy: sortBy,
    // );

    // return returnListofArticles(res);
  }

  List<Article> returnArticlesOrThrowError(Result<dynamic> res) {
    if (res is Success<QueryResult>) {
      return res.value.articles;
    } else if (res is Error<QueryResult>) {
      throw res.exception;
    } else {
      throw Exception('Unexpected error happend');
    }
  }

  @override
  Future<List<Article>> fetchNewsByCountry({required String country}) async {
    final res = await safeApiCall(
      () => _service.topHeadlines(country: country),
    );

    return returnArticlesOrThrowError(res);
  }

  @override
  Future<List<Article>> fetchNewsByCategory({String? category}) async {
    final res = await safeApiCall(
      () => _service.topHeadlines(category: category),
    );
    return returnArticlesOrThrowError(res);
  }

  @override
  Future<List<SourceOfNews>> fetchAllSourceOfNews() async {
    final res = await safeApiCall<QuerySource>(_service.sources);

    if (res is Success<QuerySource>) {
      return res.value.sources;
    } else if (res is Error<QuerySource>) {
      throw res.exception;
    } else {
      throw Exception("UnExpected Error");
    }
  }

  @override
  Future<List<Article>> fetchNewsBySource({required String source}) async {
    final res = await safeApiCall(() => _service.topHeadlines(sources: source));
    return returnArticlesOrThrowError(res);
  }
}
