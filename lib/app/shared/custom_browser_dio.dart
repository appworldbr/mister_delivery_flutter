// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

import 'package:dio/adapter_browser.dart';
import 'package:dio/browser_imp.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomBrowserDio {
  final BaseOptions options = new BaseOptions(
    // baseUrl: _baseUrl,
    headers: {
      "Accept": "application/json",
      "Content-Type": "application/json",
    },
  );
  late Dio _dio;

  CustomBrowserDio() {
    _dio = DioForBrowser(options);
    _withAuthentication();
  }

  Dio get instance => _dio;

  void _withAuthentication() async {
    final adapter = BrowserHttpClientAdapter();
    SharedPreferences prefs = await SharedPreferences.getInstance();

    adapter.withCredentials = true;
    _dio.httpClientAdapter = adapter;

    _dio.interceptors.add(
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
            _dio.options.headers['X-XSRF-TOKEN'] =
                Uri.decodeComponent(matchVal);
          }
          return handler.next(response);
        },
      ),
    );
  }

  // TODO: Add this code for mobile and test:
  /*
  void _withAuthentication() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;

    var cookiePath = PersistCookieJar(
      ignoreExpires: true,
      storage: FileStorage(appDocPath + "/.cookies/"),
    );

    _dio.interceptors.add(CookieManager(cookiePath));

    _dio.interceptors.add(
      InterceptorsWrapper(
        onResponse: (response, handler) async {
          final List<Cookie> cookies = await cookiePath.loadForRequest(
            Uri.parse(Modular.get<UriSingleton>().base),
          );

          final String xsrfToken =
              cookies.firstWhere((_c) => _c.name == 'XSRF-TOKEN').value;

          if (xsrfToken.isNotEmpty) {
            _dio.options.headers['X-XSRF-TOKEN'] =
                Uri.decodeComponent(xsrfToken);
          }
          _dio.options.headers['Accept'] = "application/json";
          _dio.options.headers['Content-Type'] = "application/json";

          return handler.next(response);
        },
      ),
    );
  }
  */
}
