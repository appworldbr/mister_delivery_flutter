class UrlSingleton {
  static UrlSingleton _singleton = UrlSingleton._internal();

  factory UrlSingleton() {
    return _singleton;
  }

  UrlSingleton._internal();

  String domain = '';
  String api = '';
}
