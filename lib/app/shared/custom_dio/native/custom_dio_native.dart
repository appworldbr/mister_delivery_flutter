import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:mister_delivery_flutter/app/shared/url/models/url_singleton.dart';
import 'package:path_provider/path_provider.dart';

class CustomDioNative extends DioForNative {
  CustomDioNative([BaseOptions? options]) : super(options) {
    _withAuthentication();
  }

  void _withAuthentication() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;

    var cookiePath = PersistCookieJar(
      ignoreExpires: true,
      storage: FileStorage(appDocPath + "/.cookies/"),
    );

    interceptors.add(CookieManager(cookiePath));

    interceptors.add(
      InterceptorsWrapper(
        onResponse: (response, handler) async {
          final List<Cookie> cookies = await cookiePath.loadForRequest(
            Uri.parse(UrlSingleton().base),
          );

          final String xsrfToken =
              cookies.firstWhere((_c) => _c.name == 'XSRF-TOKEN').value;

          if (xsrfToken.isNotEmpty) {
            options.headers['X-XSRF-TOKEN'] = Uri.decodeComponent(xsrfToken);
          }
          options.headers['Accept'] = "application/json";
          options.headers['Content-Type'] = "application/json";

          return handler.next(response);
        },
      ),
    );
  }
}
