import 'package:chopper/chopper.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:news_app/network/model_response.dart';
import 'package:news_app/network/news_converter.dart';
import 'package:news_app/network/query_result.dart';
import 'package:news_app/network/service_interface.dart';
import 'package:news_app/data/model/source.dart';
part 'news_service.chopper.dart';

final String apikey = dotenv.env['apikey'] ?? '';
const String apiUrl = "https://newsapi.org/";

// interceptor to add the api key
Request _addQuery(Request req) {
  final param = Map<String, dynamic>.from(req.parameters);
  param['apiKey'] = apikey;
  return req.copyWith(parameters: param);
}

@ChopperApi()
abstract class NewsService extends ChopperService implements ServiceInterface {
  @override
  @Get(path: 'v2/everything')
  Future<NewsResponse> queryEverything({
    @Query('q') String? q,
    @Query('sources') String? sources,
    @Query('domains') String? domains,
    @Query('sortBy') String? sortBy,
    @Query('language') String? language,
  });

  @override
  @Get(path: 'v2/top-headlines')
  Future<NewsResponse> topHeadlines({
    @Query('country') String? country,
    @Query('category') String? category,
    @Query('sources') String? sources,
    @Query('pageSize') int? pageSize,
    @Query('page') int? page,
  });

  @override
  @Get(path: '/v2/top-headlines/sources')
  Future<SourceResponse> sources();

  static NewsService create() {
    final client = ChopperClient(
      baseUrl: Uri.parse(apiUrl),
      interceptors: [_addQuery, HttpLoggingInterceptor()],
      converter: NewsConverter(),
      errorConverter: const JsonConverter(),
      services: [_$NewsService()],
    );

    return _$NewsService(client);
  }
}
