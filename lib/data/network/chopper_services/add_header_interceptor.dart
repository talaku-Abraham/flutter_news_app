import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AddHeaderInterceptor implements RequestInterceptor {
  final String apikey = dotenv.env['apikey'] ?? '';

  @override
  FutureOr<Request> onRequest(Request request) {
    final param = Map<String, String>.from(request.headers);
    param['X-Api-Key'] = apikey;
    return request.copyWith(headers: param);
  }
}
