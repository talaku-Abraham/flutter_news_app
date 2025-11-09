// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'query_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

QueryResult _$QueryResultFromJson(Map<String, dynamic> json) {
  return _QueryResult.fromJson(json);
}

/// @nodoc
mixin _$QueryResult {
  int get totalResults => throw _privateConstructorUsedError;
  List<Article> get articles => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QueryResultCopyWith<QueryResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QueryResultCopyWith<$Res> {
  factory $QueryResultCopyWith(
          QueryResult value, $Res Function(QueryResult) then) =
      _$QueryResultCopyWithImpl<$Res, QueryResult>;
  @useResult
  $Res call({int totalResults, List<Article> articles});
}

/// @nodoc
class _$QueryResultCopyWithImpl<$Res, $Val extends QueryResult>
    implements $QueryResultCopyWith<$Res> {
  _$QueryResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalResults = null,
    Object? articles = null,
  }) {
    return _then(_value.copyWith(
      totalResults: null == totalResults
          ? _value.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as int,
      articles: null == articles
          ? _value.articles
          : articles // ignore: cast_nullable_to_non_nullable
              as List<Article>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QueryResultImplCopyWith<$Res>
    implements $QueryResultCopyWith<$Res> {
  factory _$$QueryResultImplCopyWith(
          _$QueryResultImpl value, $Res Function(_$QueryResultImpl) then) =
      __$$QueryResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int totalResults, List<Article> articles});
}

/// @nodoc
class __$$QueryResultImplCopyWithImpl<$Res>
    extends _$QueryResultCopyWithImpl<$Res, _$QueryResultImpl>
    implements _$$QueryResultImplCopyWith<$Res> {
  __$$QueryResultImplCopyWithImpl(
      _$QueryResultImpl _value, $Res Function(_$QueryResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalResults = null,
    Object? articles = null,
  }) {
    return _then(_$QueryResultImpl(
      totalResults: null == totalResults
          ? _value.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as int,
      articles: null == articles
          ? _value._articles
          : articles // ignore: cast_nullable_to_non_nullable
              as List<Article>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QueryResultImpl implements _QueryResult {
  const _$QueryResultImpl(
      {required this.totalResults, required final List<Article> articles})
      : _articles = articles;

  factory _$QueryResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$QueryResultImplFromJson(json);

  @override
  final int totalResults;
  final List<Article> _articles;
  @override
  List<Article> get articles {
    if (_articles is EqualUnmodifiableListView) return _articles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_articles);
  }

  @override
  String toString() {
    return 'QueryResult(totalResults: $totalResults, articles: $articles)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QueryResultImpl &&
            (identical(other.totalResults, totalResults) ||
                other.totalResults == totalResults) &&
            const DeepCollectionEquality().equals(other._articles, _articles));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, totalResults,
      const DeepCollectionEquality().hash(_articles));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QueryResultImplCopyWith<_$QueryResultImpl> get copyWith =>
      __$$QueryResultImplCopyWithImpl<_$QueryResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QueryResultImplToJson(
      this,
    );
  }
}

abstract class _QueryResult implements QueryResult {
  const factory _QueryResult(
      {required final int totalResults,
      required final List<Article> articles}) = _$QueryResultImpl;

  factory _QueryResult.fromJson(Map<String, dynamic> json) =
      _$QueryResultImpl.fromJson;

  @override
  int get totalResults;
  @override
  List<Article> get articles;
  @override
  @JsonKey(ignore: true)
  _$$QueryResultImplCopyWith<_$QueryResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
