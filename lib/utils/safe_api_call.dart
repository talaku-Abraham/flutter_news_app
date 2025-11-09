import 'dart:async';
import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:http/http.dart' hide Response;
import 'package:news_app/data/network/model_response.dart';

Future<Result<T>> safeApiCall<T>(
  Future<Response<Result>> Function() apiCall,
) async {
  try {
    print('inside the generic safecall method');
    final response = await apiCall();

    if (response.isSuccessful) {
      final body = response.body;

      if (body is Success<T>) {
        print('generic safemethod returns ');
        // print(body.value);
        return body;
      } else {
        throw Exception('Unexpected success response');
      }
    } else {
      final error = response.error;
      if (error is Error<T>) {
        return error;
      } else {
        throw Exception('Unexpected error: ${error.toString()}');
      }
    }
  } on SocketException {
    throw Exception('Error: No internet connection');
  } on HandshakeException {
    // SSL certificate or HTTPS negotiation failed
    throw Exception('SSL certificate or HTTPS negotiation failed');
  } on TimeoutException {
    throw Exception('server took too long to response');
  } on ClientException catch (e) {
    print('client Exception');
    if (e.toString().contains('XMLHttpRequest')) {
      print('No internxet or CORS/network issue');
      throw Exception('Please check your internet connection');
    }
    throw Exception('invalid url');
  }
}
