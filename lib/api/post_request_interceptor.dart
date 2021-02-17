import 'dart:async';
import 'package:chopper/chopper.dart';

class POSTRequestInterceptor implements RequestInterceptor {
  @override
  Future<Request> onRequest(Request request) async {
    if (request.method == HttpMethod.Post) {
      chopperLogger.info('Performed a POST request');
    }
    return request;
  }
}
