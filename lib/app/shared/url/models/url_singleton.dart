class UrlSingleton {
  static UrlSingleton _singleton = UrlSingleton._internal();

  factory UrlSingleton() {
    return _singleton;
  }

  UrlSingleton._internal();

  String api = 'a';
  String base = 'b';
}
