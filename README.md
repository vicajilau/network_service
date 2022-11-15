Package that encapsulates the network service in a separate module independent of the application.

## Using

The easiest way to use this library is to call the [NetworkService][] class as follows. 
This requires an object of type [UrlRequest][] to be passed with everything passed as a parameter. 

```dart
import 'package:network_service/network_service.dart';

final network = NetworkService();

final request = UrlRequest.fromStringUrl('https://jsonplaceholder.typicode.com/posts/1');
final jsonResponse = await network.getRequest(request);
final AlbumModel album = AlbumModel.fromJson(jsonResponse);
```

If you want to use a Multipart Request

```dart
import 'package:network_service/network_service.dart';

final network = NetworkService();

Map<String, String> _filesMultipartRequest(File image) {
  return <String, String>{"file": image.path};
}

Map<String, dynamic> _fieldsMultipartRequest(
    String userIdentifier, String tenantIdentifier) {
  return <String, dynamic>{
    "user_id": userIdentifier,
    "tenant_id": tenantIdentifier
  };
}

final request = MultipartRequest.fromStringUrl('https://jsonplaceholder.typicode.com/posts/1',
    MethodRequest.POST, filesMultipart: _filesMultipartRequest, fieldsMultipart: _fieldsMultipartRequest);
final jsonResponse = await network.multipartRequest(request);
final ResponseModel model = ResponseModel.fromJson(jsonResponse);
```

[NetworkService]: https://github.com/vicajilau/network_service/blob/master/lib/src/network_service.dart
[UrlRequest]: https://github.com/vicajilau/network_service/blob/master/lib/src/url_request.dart
