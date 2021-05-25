// import 'dart:io';

// import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
// import 'package:dio_cookie_manager/dio_cookie_manager.dart';
// import 'package:flutter_modular/flutter_modular.dart';
// import 'package:mister_delivery_flutter/app/modules/api_uri/get_uri.dart';
// import 'package:path_provider/path_provider.dart';

class CustomDio {
  final Dio _dio = Dio();

  CustomDio() {
    // _withAuthentication();
  }

  Dio get instance => _dio;

  // void _withAuthentication() async {
  //   Directory appDocDir = await getApplicationDocumentsDirectory();
  //   String appDocPath = appDocDir.path;

  //   var cookiePath = PersistCookieJar(
  //     ignoreExpires: true,
  //     storage: FileStorage(appDocPath + "/.cookies/"),
  //   );

  //   _dio.interceptors.add(CookieManager(cookiePath));

  //   _dio.interceptors.add(
  //     InterceptorsWrapper(
  //       onResponse: (response, handler) async {
  //         final List<Cookie> cookies = await cookiePath.loadForRequest(
  //           Uri.parse(Modular.get<UriSingleton>().base),
  //         );

  //         final String xsrfToken =
  //             cookies.firstWhere((_c) => _c.name == 'XSRF-TOKEN').value;

  //         if (xsrfToken.isNotEmpty) {
  //           _dio.options.headers['X-XSRF-TOKEN'] =
  //               Uri.decodeComponent(xsrfToken);
  //         }
  //         _dio.options.headers['Accept'] = "application/json";
  //         _dio.options.headers['Content-Type'] = "application/json";

  //         return handler.next(response);
  //       },
  //     ),
  //   );
  // }
}
