import 'package:flutter_test/flutter_test.dart';
import 'package:mister_delivery_flutter/app/modules/api_uri/get_uri.dart';
import 'package:mister_delivery_flutter/app/modules/api_uri/get_uri_from_mobile.dart';

main() {
  test('should get uri via mobile', () {
    final url = 'http://10.0.0.2';
    GetUri(GetUriFromMobile(base: url + '/', api: url + '/api/'));
    expect(UriSingleton().base, url + '/');
    expect(UriSingleton().api, url + '/api/');
  });
}
