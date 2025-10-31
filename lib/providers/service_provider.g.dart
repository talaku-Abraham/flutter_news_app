// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$newsByQueryHash() => r'd2b85c61f6bfd21b337d3f359bf3de6e86154a2c';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [newsByQuery].
@ProviderFor(newsByQuery)
const newsByQueryProvider = NewsByQueryFamily();

/// See also [newsByQuery].
class NewsByQueryFamily extends Family<AsyncValue<List<Article>>> {
  /// See also [newsByQuery].
  const NewsByQueryFamily();

  /// See also [newsByQuery].
  NewsByQueryProvider call({
    required String q,
    String? language,
    String? sortBy,
  }) {
    return NewsByQueryProvider(
      q: q,
      language: language,
      sortBy: sortBy,
    );
  }

  @override
  NewsByQueryProvider getProviderOverride(
    covariant NewsByQueryProvider provider,
  ) {
    return call(
      q: provider.q,
      language: provider.language,
      sortBy: provider.sortBy,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'newsByQueryProvider';
}

/// See also [newsByQuery].
class NewsByQueryProvider extends AutoDisposeFutureProvider<List<Article>> {
  /// See also [newsByQuery].
  NewsByQueryProvider({
    required String q,
    String? language,
    String? sortBy,
  }) : this._internal(
          (ref) => newsByQuery(
            ref as NewsByQueryRef,
            q: q,
            language: language,
            sortBy: sortBy,
          ),
          from: newsByQueryProvider,
          name: r'newsByQueryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$newsByQueryHash,
          dependencies: NewsByQueryFamily._dependencies,
          allTransitiveDependencies:
              NewsByQueryFamily._allTransitiveDependencies,
          q: q,
          language: language,
          sortBy: sortBy,
        );

  NewsByQueryProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.q,
    required this.language,
    required this.sortBy,
  }) : super.internal();

  final String q;
  final String? language;
  final String? sortBy;

  @override
  Override overrideWith(
    FutureOr<List<Article>> Function(NewsByQueryRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: NewsByQueryProvider._internal(
        (ref) => create(ref as NewsByQueryRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        q: q,
        language: language,
        sortBy: sortBy,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Article>> createElement() {
    return _NewsByQueryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is NewsByQueryProvider &&
        other.q == q &&
        other.language == language &&
        other.sortBy == sortBy;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, q.hashCode);
    hash = _SystemHash.combine(hash, language.hashCode);
    hash = _SystemHash.combine(hash, sortBy.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin NewsByQueryRef on AutoDisposeFutureProviderRef<List<Article>> {
  /// The parameter `q` of this provider.
  String get q;

  /// The parameter `language` of this provider.
  String? get language;

  /// The parameter `sortBy` of this provider.
  String? get sortBy;
}

class _NewsByQueryProviderElement
    extends AutoDisposeFutureProviderElement<List<Article>>
    with NewsByQueryRef {
  _NewsByQueryProviderElement(super.provider);

  @override
  String get q => (origin as NewsByQueryProvider).q;
  @override
  String? get language => (origin as NewsByQueryProvider).language;
  @override
  String? get sortBy => (origin as NewsByQueryProvider).sortBy;
}

String _$newsByCategoryHash() => r'39d80656f3eb8fa86e21ae83ae927fb8f2722b8b';

/// See also [newsByCategory].
@ProviderFor(newsByCategory)
const newsByCategoryProvider = NewsByCategoryFamily();

/// See also [newsByCategory].
class NewsByCategoryFamily extends Family<AsyncValue<List<Article>>> {
  /// See also [newsByCategory].
  const NewsByCategoryFamily();

  /// See also [newsByCategory].
  NewsByCategoryProvider call({
    required String category,
  }) {
    return NewsByCategoryProvider(
      category: category,
    );
  }

  @override
  NewsByCategoryProvider getProviderOverride(
    covariant NewsByCategoryProvider provider,
  ) {
    return call(
      category: provider.category,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'newsByCategoryProvider';
}

/// See also [newsByCategory].
class NewsByCategoryProvider extends AutoDisposeFutureProvider<List<Article>> {
  /// See also [newsByCategory].
  NewsByCategoryProvider({
    required String category,
  }) : this._internal(
          (ref) => newsByCategory(
            ref as NewsByCategoryRef,
            category: category,
          ),
          from: newsByCategoryProvider,
          name: r'newsByCategoryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$newsByCategoryHash,
          dependencies: NewsByCategoryFamily._dependencies,
          allTransitiveDependencies:
              NewsByCategoryFamily._allTransitiveDependencies,
          category: category,
        );

  NewsByCategoryProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.category,
  }) : super.internal();

  final String category;

  @override
  Override overrideWith(
    FutureOr<List<Article>> Function(NewsByCategoryRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: NewsByCategoryProvider._internal(
        (ref) => create(ref as NewsByCategoryRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        category: category,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Article>> createElement() {
    return _NewsByCategoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is NewsByCategoryProvider && other.category == category;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, category.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin NewsByCategoryRef on AutoDisposeFutureProviderRef<List<Article>> {
  /// The parameter `category` of this provider.
  String get category;
}

class _NewsByCategoryProviderElement
    extends AutoDisposeFutureProviderElement<List<Article>>
    with NewsByCategoryRef {
  _NewsByCategoryProviderElement(super.provider);

  @override
  String get category => (origin as NewsByCategoryProvider).category;
}

String _$newsBySourceHash() => r'64f545b68d9c7772304ffaaebe7c4e85a596bde0';

/// See also [newsBySource].
@ProviderFor(newsBySource)
const newsBySourceProvider = NewsBySourceFamily();

/// See also [newsBySource].
class NewsBySourceFamily extends Family<AsyncValue<List<Article>>> {
  /// See also [newsBySource].
  const NewsBySourceFamily();

  /// See also [newsBySource].
  NewsBySourceProvider call({
    required String source,
  }) {
    return NewsBySourceProvider(
      source: source,
    );
  }

  @override
  NewsBySourceProvider getProviderOverride(
    covariant NewsBySourceProvider provider,
  ) {
    return call(
      source: provider.source,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'newsBySourceProvider';
}

/// See also [newsBySource].
class NewsBySourceProvider extends AutoDisposeFutureProvider<List<Article>> {
  /// See also [newsBySource].
  NewsBySourceProvider({
    required String source,
  }) : this._internal(
          (ref) => newsBySource(
            ref as NewsBySourceRef,
            source: source,
          ),
          from: newsBySourceProvider,
          name: r'newsBySourceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$newsBySourceHash,
          dependencies: NewsBySourceFamily._dependencies,
          allTransitiveDependencies:
              NewsBySourceFamily._allTransitiveDependencies,
          source: source,
        );

  NewsBySourceProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.source,
  }) : super.internal();

  final String source;

  @override
  Override overrideWith(
    FutureOr<List<Article>> Function(NewsBySourceRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: NewsBySourceProvider._internal(
        (ref) => create(ref as NewsBySourceRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        source: source,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Article>> createElement() {
    return _NewsBySourceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is NewsBySourceProvider && other.source == source;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, source.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin NewsBySourceRef on AutoDisposeFutureProviderRef<List<Article>> {
  /// The parameter `source` of this provider.
  String get source;
}

class _NewsBySourceProviderElement
    extends AutoDisposeFutureProviderElement<List<Article>>
    with NewsBySourceRef {
  _NewsBySourceProviderElement(super.provider);

  @override
  String get source => (origin as NewsBySourceProvider).source;
}

String _$sourceOfNewsHash() => r'd9d51dfbdbdc0fc60944a27b827d9e9db6a8fc5f';

/// See also [sourceOfNews].
@ProviderFor(sourceOfNews)
final sourceOfNewsProvider =
    AutoDisposeFutureProvider<List<SourceOfNews>>.internal(
  sourceOfNews,
  name: r'sourceOfNewsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$sourceOfNewsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SourceOfNewsRef = AutoDisposeFutureProviderRef<List<SourceOfNews>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
