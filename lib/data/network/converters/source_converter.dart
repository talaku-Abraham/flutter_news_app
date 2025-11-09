import 'dart:async';
import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:news_app/data/model/source.dart';
import 'package:news_app/data/network/model_response.dart';

class SourceConverter implements Converter {
  @override
  FutureOr<Request> convertRequest(Request request) {
    // TODO: implement convertRequest
    throw UnimplementedError();
  }

  @override
  FutureOr<Response<BodyType>> convertResponse<BodyType, InnerType>(
    Response response,
  ) {
    print('inside the new converter');
    final contentType = response.headers[contentTypeKey];
    var body = response.body;
    if (contentType != null && contentType.contains(jsonHeaders)) {
      // convert the raw byte to a string
      body = utf8.decode(response.bodyBytes);
    }

    if (response.isSuccessful) {
      try {
        final mapData = jsonDecode(body) as Map<String, dynamic>;

        final source = newsSourceToSources(mapData);

        final result = QuerySource(sources: source, status: mapData['status']);

        return response.copyWith<BodyType>(body: Success(result) as BodyType);
      } catch (err, st) {
        chopperLogger.warning(err);
        final error = Error<InnerType>(Exception('unknown success result'));
        return response.copyWith(body: null, bodyError: error);
      }
    } else {
      final error = Error<InnerType>(
        Exception(
          'HTTP status code ${response.statusCode} ${response.base.reasonPhrase}',
        ),
      );

      return response.copyWith<BodyType>(body: null, bodyError: error);
    }
  }
}

FutureOr<Response<T>> sourceConverterResponse<T>(Response response) {
  final converter = SourceConverter();
  return converter.convertResponse<T, dynamic>(response);
}
