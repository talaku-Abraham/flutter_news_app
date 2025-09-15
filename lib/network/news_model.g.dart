// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsResult _$NewsResultFromJson(Map<String, dynamic> json) => NewsResult(
      status: json['status'] as String,
      articles: (json['articles'] as List<dynamic>)
          .map((e) => NewsArticle.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalResults: (json['totalResults'] as num).toInt(),
    );

Map<String, dynamic> _$NewsResultToJson(NewsResult instance) =>
    <String, dynamic>{
      'status': instance.status,
      'totalResults': instance.totalResults,
      'articles': instance.articles,
    };

NewsArticle _$NewsArticleFromJson(Map<String, dynamic> json) => NewsArticle(
      author: json['author'] as String,
      content: json['content'] as String,
      description: json['description'] as String,
      publishedAt: json['publishedAt'] as String,
      source: Source.fromJson(json['source'] as Map<String, dynamic>),
      title: json['title'] as String,
      url: json['url'] as String,
      urlToImage: json['urlToImage'] as String,
    );

Map<String, dynamic> _$NewsArticleToJson(NewsArticle instance) =>
    <String, dynamic>{
      'author': instance.author,
      'title': instance.title,
      'description': instance.description,
      'url': instance.url,
      'urlToImage': instance.urlToImage,
      'publishedAt': instance.publishedAt,
      'content': instance.content,
      'source': instance.source,
    };

Source _$SourceFromJson(Map<String, dynamic> json) => Source(
      id: json['id'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$SourceToJson(Source instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
