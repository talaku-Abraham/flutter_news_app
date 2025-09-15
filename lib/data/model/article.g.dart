// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ArticleImpl _$$ArticleImplFromJson(Map<String, dynamic> json) =>
    _$ArticleImpl(
      author: json['author'] as String,
      content: json['content'] as String,
      description: json['description'] as String,
      publishedAt: json['publishedAt'] as String,
      source: json['source'] as String,
      title: json['title'] as String,
      url: json['url'] as String,
      urlToImage: json['urlToImage'] as String,
    );

Map<String, dynamic> _$$ArticleImplToJson(_$ArticleImpl instance) =>
    <String, dynamic>{
      'author': instance.author,
      'content': instance.content,
      'description': instance.description,
      'publishedAt': instance.publishedAt,
      'source': instance.source,
      'title': instance.title,
      'url': instance.url,
      'urlToImage': instance.urlToImage,
    };
