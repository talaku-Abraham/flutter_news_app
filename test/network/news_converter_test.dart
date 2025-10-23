import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/network/model_response.dart';
import 'package:news_app/network/news_converter.dart';
import 'package:news_app/network/query_result.dart';

import '../fakes/fake_data.dart';

void main() {
  group('check newsconverter works as expected', () {
    test("converterResponse parse to Success ", () async {
      final jsonString = jsonEncode(fakeJson);

      final baseResponse = http.Response(
        jsonString,
        200,
        headers: {'content-type': 'application/json; charset=utf-8'},
      );
      final response = Response<Result<QueryResult>>(baseResponse, null);

      final converter = NewsConverter();

      final converted = await converter
          .convertResponse<Result<QueryResult>, QueryResult>(response);

      expect(converted.body, isA<Success<QueryResult>>());
    });

    test("converterResponse throws an error", () async {
      final baseResponse = http.Response(
        '',
        404,
        headers: {'content-type': 'application/json; charset=utf-8'},
      );

      final response = Response<Result<QueryResult>>(baseResponse, null);

      final converter = NewsConverter();

      final convereted = await converter
          .convertResponse<Result<QueryResult>, QueryResult>(response);

      expect(convereted.error, isA<Error<QueryResult>>());
    });
  });
}
