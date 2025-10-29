// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$NewsService extends NewsService {
  _$NewsService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = NewsService;

  @override
  Future<Response<Result<QueryResult>>> queryEverything({
    String? q,
    String? sources,
    String? domains,
  }) {
    final Uri $url = Uri.parse('v2/everything');
    final Map<String, dynamic> $params = <String, dynamic>{
      'q': q,
      'sources': sources,
      'domains': domains,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<Result<QueryResult>, QueryResult>($request);
  }

  @override
  Future<Response<Result<QueryResult>>> topHeadlines({
    String? country,
    String? category,
    String? sources,
    int? pageSize,
    int? page,
  }) {
    final Uri $url = Uri.parse('v2/top-headlines');
    final Map<String, dynamic> $params = <String, dynamic>{
      'country': country,
      'category': category,
      'sources': sources,
      'pageSize': pageSize,
      'page': page,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<Result<QueryResult>, QueryResult>($request);
  }

  @override
  Future<Response<Result<QuerySource>>> sources() {
    final Uri $url = Uri.parse('/v2/top-headlines/sources');
    final Request $request = Request('GET', $url, client.baseUrl);
    return client.send<Result<QuerySource>, QuerySource>($request);
  }
}
