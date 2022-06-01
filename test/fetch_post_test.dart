import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:network_service/network_service.dart';
import 'package:network_service/src/models/album_test.dart';

class MockClient extends Mock implements http.Client {}

main() {
  group('fetchPost', () {
    test('returns a Post if the http call completes successfully', () async {
      final client = MockClient();

      final uri = Uri.parse('https://jsonplaceholder.typicode.com/posts/1');
      when(client.get(uri)).thenAnswer((_) async =>
          http.Response('{"userId": 1, "id": 2, "title": "mock"}', 200));

      final network = NetworkService();
      network.setClient(client);

      final request = UrlRequest(uri);
      final response = await network.getRequest(request);
      final album = AlbumTest.fromJson(response);
      expect(album, isInstanceOf<AlbumTest>());
    });
  });
}
