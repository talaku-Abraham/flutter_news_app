import 'package:freezed_annotation/freezed_annotation.dart';
part 'source.freezed.dart';
part 'source.g.dart';

@Freezed()
class SourceOfNews with _$SourceOfNews {
  const factory SourceOfNews({
    required String id,
    required String name,
    required String description,
    required String url,
    required String category,
  }) = _Source;

  factory SourceOfNews.fromJson(Map<String, dynamic> json) =>
      _$SourceOfNewsFromJson(json);
}

List<SourceOfNews> newsSourceToSources(Map<String, dynamic> mapdata) {
  final List<SourceOfNews> newsSource = [];

  final temp = mapdata['sources'];

  for (var item in temp) {
    newsSource.add(SourceOfNews.fromJson(item));
  }

  return newsSource;
}

class QuerySource {
  final String status;
  final List<SourceOfNews> sources;
  QuerySource({required this.sources, required this.status});
}
