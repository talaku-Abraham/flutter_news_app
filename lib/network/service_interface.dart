import 'package:news_app/network/model_response.dart';
import 'package:news_app/network/query_result.dart';
import 'package:chopper/chopper.dart';

typedef NewsResponse = Response<Result<QueryResult>>;

// sources endpoint result

// "id": "aftenposten",
//     "name": "Aftenposten",
//     "description": "Norges ledende nettavis med alltid oppdaterte nyheter innenfor innenriks, utenriks, sport og kultur.",
//     "url": "https://www.aftenposten.no",
//     "category": "general",
//     "language": "no",
//     "country": "no"
abstract class ServiceInterface {
  Future<NewsResponse> queryEverything({
    String? q,
    String? sources,
    String? domains,
  });
  Future<NewsResponse> topHeadlines({
    String? country,
    String? category,
    String? sources,
    int? pageSize,
    int? page,
  });
}
