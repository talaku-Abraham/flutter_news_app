import 'dart:async';
import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:news_app/data/model/source.dart';
import 'package:news_app/data/network/model_response.dart';
import 'package:news_app/data/network/news_model.dart';
import 'package:news_app/data/network/query_result.dart';

class NewsConverter implements Converter {
  @override
  FutureOr<Request> convertRequest(Request request) {
    final req = applyHeader(
      request,
      contentTypeKey,
      jsonHeaders,
      override: false,
    );
    return encodeJson(req);
  }

  FutureOr<Request> encodeJson(Request request) {
    final contentType = request.headers[contentTypeKey];
    if (contentType != null && contentType.contains(jsonHeaders)) {
      return request.copyWith(body: jsonEncode(request.body));
    }
    return request;
  }

  @override
  FutureOr<Response<BodyType>> convertResponse<BodyType, InnerType>(
    Response response,
  ) {
    return decodeJson<BodyType, InnerType>(response);
  }

  FutureOr<Response<BodyType>> decodeJson<BodyType, InnerType>(
    Response response,
  ) {
    final contentType = response.headers[contentTypeKey];
    var body = response.body;

    if (contentType != null && contentType.contains(jsonHeaders)) {
      // return a string-- converts raw bytes to string
      body = utf8.decode(response.bodyBytes);
    }
    try {
      print("inside the original converter");
      if (response.isSuccessful) {
        final mapData = jsonDecode(body) as Map<String, dynamic>;

        // final String url = response.base.request?.url.toString() ?? '';

        // if (url.contains('/top-headlines/sources')) {

        // conver to NewsResult model
        final newsResults = NewsResult.fromJson(mapData);
        // get list of articles
        final articles = newsAPiArticleToArticle(newsResults);
        // wrap it in QueryResult
        final results = QueryResult(
          totalResults: newsResults.totalResults,
          articles: articles,
        );
        return response.copyWith<BodyType>(body: Success(results) as BodyType);
      } else {
        final error = Error<BodyType>(
          Exception(
            'HTTP ${response.statusCode} : ${response.base.reasonPhrase}',
          ),
        );

        return response.copyWith<BodyType>(body: null, bodyError: error);
      }
    } catch (e) {
      chopperLogger.warning(e);
      final error = Error<BodyType>(Exception('unknown  Error'));
      return response.copyWith<BodyType>(body: null, bodyError: error);
    }
  }
}
