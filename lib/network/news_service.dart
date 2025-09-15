import 'package:chopper/chopper.dart';
import 'package:news_app/network/model_response.dart';
import 'package:news_app/network/news_converter.dart';
import 'package:news_app/network/query_result.dart';
import 'package:news_app/network/service_interface.dart';

part 'news_service.chopper.dart';

const String apikey = "";
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
  Future<NewsResponse> queryNews({@Query('q') String? q});

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
