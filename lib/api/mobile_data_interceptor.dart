import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:chopper/chopper.dart';

class MobileDataInterceptor implements RequestInterceptor {
  @override
  Future<Request> onRequest(Request request) async {
    final connectivityResult = await Connectivity().checkConnectivity();
    final isMobile = (connectivityResult == ConnectivityResult.mobile);
    final isLargeFile =
        request.url.contains(RegExp(r'(/large | /video | /posts)'));
    if (isMobile && isLargeFile) {
      throw MobileDataCostException();
    }
    return request;
  }
}

class MobileDataCostException implements Exception {
  final message =
      'Downloading large files to a mobile data connection may incur costs';

  @override
  String toString() => message;
}
