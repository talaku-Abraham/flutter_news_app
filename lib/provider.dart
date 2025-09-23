import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/data/model/current_news.dart';
import 'package:news_app/data/repositories/api_repository.dart';
import 'package:news_app/network/service_interface.dart';

final serviceProvider = Provider<ServiceInterface>((ref) {
  throw UnimplementedError();
});

final repositoryProvider =
    NotifierProvider<ApiRepository, AsyncValue<CurrentNews>>(
      () => ApiRepository(),
    );

