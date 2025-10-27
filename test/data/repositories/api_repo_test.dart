import 'package:chopper/chopper.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:news_app/data/model/article.dart';
import 'package:news_app/data/repositories/api_repository.dart';
import 'package:news_app/network/model_response.dart';
import 'package:news_app/network/query_result.dart';
import 'package:news_app/network/service_interface.dart';

import '../../fakes/fake_data.dart';
import 'api_repo_test.mocks.dart';

@GenerateNiceMocks([MockSpec<ServiceInterface>()])
void main() {
  late MockServiceInterface mockService;
  late ApiRepository repository;

  setUp(() {
    mockService = MockServiceInterface();
    repository = ApiRepository(mockService);
  });

  group("check the APiRepository works", () {
    test("check fetchEverything return articles", () async {
      final fakeQueryResult = QueryResult(
        totalResults: 1,
        articles: fakeArticles,
      );

      final fakeResult = Success<QueryResult>(fakeQueryResult);

      final base = http.Response('', 200);

      final fakeResponse = Response<Result<QueryResult>>(
        base,
        fakeResult,
        error: null,
      );
      when(
        mockService.queryEverything(
          q: anyNamed('q'),
          sources: anyNamed('sources'),
          domains: anyNamed('domains'),
        ),
      ).thenAnswer((_) async => fakeResponse);

      final result = await repository.fetchEverything();

      expect(result, isA<List<Article>>());
      expect(result.first.author, equals('Lucas Ropek'));
      expect(result.length, 1);
    });

    test('check fetchEverything handle errors', () async {
      final fakeResult = Error<QueryResult>(Exception("error tale occured"));

      final base = http.Response('Not found', 404);

      final fakeResponse = Response<Result<QueryResult>>(
        base,
        null,
        error: fakeResult,
      );

      when(
        mockService.queryEverything(
          q: anyNamed('q'),
          sources: anyNamed('sources'),
          domains: anyNamed('domains'),
        ),
      ).thenAnswer((_) async => fakeResponse);

      expect(() => repository.fetchEverything(), throwsA(isA<Exception>()));
    });
  });
}
