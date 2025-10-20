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

import '../../fakes/fake_articles.dart';
import 'api_repo_test.mocks.dart';

@GenerateNiceMocks([MockSpec<ServiceInterface>()])
void main() {
  late MockServiceInterface mockService;
  late ApiRepository repository;

  setUp(() {
    mockService = MockServiceInterface();
    repository = ApiRepository(mockService);
  });
  test("check the ApiRepository works", () async {
    final fakeQueryResult = QueryResult(totalResults: 1, articles: fakeArtice);

    final fakeResult = Success<QueryResult>(fakeQueryResult);

    final base = http.Response('', 200);

    final fakeResponse = Response<Result<QueryResult>>(base, fakeResult);
    when(
      mockService.queryNews(
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
}
