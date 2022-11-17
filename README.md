Package that encapsulates the network service in a separate module independent of the application.

## Using

The easiest way to use this library is to call the [NetworkWrapper][] class as follows. 
This requires an object of type [UrlRequest][] to be passed with everything passed as a parameter. 

```dart
import 'package:network_wrapper/network_wrapper.dart';

final network = NetworkWrapper();

final request = UrlRequest.fromStringUrl('https://jsonplaceholder.typicode.com/posts/1');
final jsonResponse = await network.getRequest(request);
final AlbumModel album = AlbumModel.fromJson(jsonResponse);
```

If you want to build a multipart request you must use [MultipartUrlRequest][] passing a object [MethodRequest][] with 
the request type, as well as the files and parameters as the following maps:

```dart
import 'package:network_wrapper/network_wrapper.dart';

final network = NetworkWrapper();

Map<String, String> _filesMultipartRequest(File image) {
  return <String, String>{"file": image.path};
}

Map<String, dynamic> _fieldsMultipartRequest(
    String userIdentifier, String tenantIdentifier) {
  return <String, dynamic>{
    "_id": _userId,
    "_name": _userName
  };
}

final request = MultipartUrlRequest.fromStringUrl('https://jsonplaceholder.typicode.com/posts/1',
    MethodRequest.POST, filesMultipart: _filesMultipartRequest, fieldsMultipart: _fieldsMultipartRequest);
final jsonResponse = await network.multipartRequest(request);
final ResponseModel model = ResponseModel.fromJson(jsonResponse);
```

[NetworkService]: https://github.com/vicajilau/network_service/blob/master/lib/src/network_wrapper.dart
[UrlRequest]: https://github.com/vicajilau/network_service/blob/master/lib/src/url_request.dart
[MultipartUrlRequest]: https://github.com/vicajilau/network_service/blob/master/lib/src/multipart_url_request.dart
[MethodRequest]: https://github.com/vicajilau/network_service/blob/master/lib/src/method_request.dart
