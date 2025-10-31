import 'dart:async';
import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:news_app/data/model/source.dart';
import 'package:news_app/network/model_response.dart';
import 'package:news_app/network/news_model.dart';
import 'package:news_app/network/query_result.dart';
import 'package:news_app/network/service_interface.dart';

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
      if (response.isSuccessful) {
        final mapData = jsonDecode(body) as Map<String, dynamic>;

        final String url = response.base.request?.url.toString() ?? '';

        if (url.contains('/top-headlines/sources')) {
          final sources = newsSourceToSources(mapData);

          final results = QuerySource(
            sources: sources,
            status: mapData['status'],
          );

          return response.copyWith<BodyType>(
            body: Success(results) as BodyType,
          );
        } else {
          final newsResults = NewsResult.fromJson(mapData);
          (mapData);

          final articles = newsAPiArticleToArticle(newsResults);
          final results = QueryResult(
            totalResults: newsResults.totalResults,
            articles: articles,
          );
          return response.copyWith<BodyType>(
            body: Success(results) as BodyType,
          );
        }
      } else {
        final error = Error<InnerType>(
          Exception(
            'HTTP ${response.statusCode} : ${response.base.reasonPhrase}',
          ),
        );

        return response.copyWith<BodyType>(body: null, bodyError: error);
      }
    } catch (e) {
      chopperLogger.warning(e);
      final error = Error<InnerType>(Exception('unknown Success Error'));
      return response.copyWith<BodyType>(body: null, bodyError: error);
    }
  }
}
