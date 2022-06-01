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

[PlatformDetail]: https://github.com/vicajilau/network_service/blob/master/lib/src/platform_detail.dart
[PlatformDetail]: https://github.com/vicajilau/network_service/blob/master/lib/src/platform_detail.dart
