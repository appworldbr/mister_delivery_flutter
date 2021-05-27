// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

import 'package:dio/adapter_browser.dart';
import 'package:dio/browser_imp.dart';
import 'package:dio/dio.dart';

class CustomDioWeb extends DioForBrowser {
  CustomDioWeb([BaseOptions? options]) : super(options) {
    (httpClientAdapter as BrowserHttpClientAdapter).withCredentials = true;
    interceptors.add(
      InterceptorsWrapper(
        onResponse: (response, handler) {
          String cookies = document.cookie ?? '';
          List<String> listValues =
              cookies.isNotEmpty ? cookies.split(";") : [];
          String matchVal = "";
          for (int i = 0; i < listValues.length; i++) {
            List<String> map = listValues[i].split("=");
            String _key = map[0].trim();
            String _val = map[1].trim();
            if ('XSRF-TOKEN' == _key) {
              matchVal = _val;
              break;
            }
          }
          if (matchVal.isNotEmpty) {
            this.options.headers['X-XSRF-TOKEN'] =
                Uri.decodeComponent(matchVal);
          }
          return handler.next(response);
        },
      ),
    );
  }
}
