import 'package:news_app/network/model_response.dart';
import 'package:news_app/network/query_result.dart';
import 'package:chopper/chopper.dart';

typedef NewsResponse = Response<Result<QueryResult>>;

abstract class ServiceInterface {
  Future<NewsResponse> queryNews({String? q});
}
