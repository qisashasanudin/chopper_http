import 'dart:async';
import 'package:chopper/chopper.dart';

class NotFoundInterceptor implements ResponseInterceptor {
  @override
  Future<Response> onResponse(Response response) async {
    if (response.statusCode == 404) {
      chopperLogger.severe('404 NOT FOUND');
    }
    return response;
  }
}
