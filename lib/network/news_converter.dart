import 'dart:async';
import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:news_app/network/model_response.dart';
import 'package:news_app/network/news_model.dart';
import 'package:news_app/network/query_result.dart';

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

  @override
  FutureOr<Response<BodyType>> convertResponse<BodyType, InnerType>(
    Response response,
  ) {
    return decodeJson<BodyType, InnerType>(response);
  }

  FutureOr<Request> encodeJson(Request request) {
    final contentType = request.headers[contentTypeKey];
    if (contentType != null && contentType.contains(jsonHeaders)) {
      return request.copyWith(body: jsonEncode(request.body));
    }
    return request;
  }

  FutureOr<Response<BodyType>> decodeJson<BodyType, InnerType>(
    Response response,
  ) {
    final contentType = response.headers[contentTypeKey];
    var body = response.body;

    if (contentType != null && contentType.contains(jsonHeaders)) {
      body = utf8.decode(response.bodyBytes);
      // print(body);
    }

    try {
      final mapData = jsonDecode(body) as Map<String, dynamic>;

      final newsResults = NewsResult.fromJson(mapData);

      final articles = newsAPiArticleToArticle(newsResults);
      final results = QueryResult(
        totalResults: newsResults.totalResults,
        articles: articles,
      );

      return response.copyWith<BodyType>(body: Success(results) as BodyType);
    } catch (e) {
      chopperLogger.warning(e);
      final error = Error<InnerType>(Exception(e.toString()));
      return Response(response.base, null, error: error);
    }
  }
}
