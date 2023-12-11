import 'package:network_wrapper/network_wrapper.dart';
import 'package:test/test.dart';

void main() {
  group('UrlRequest', () {
    final url = Uri.parse("https://www.this_is_a_mocked_url.com");
    final headers = {"Accept": "Accept: text/html"};
    var request = UrlRequest(url, headers: headers);

    test('An UrlRequest with headers', () {
      expect(request.url, url);
      expect(request.headers, headers);
    });
  });
}