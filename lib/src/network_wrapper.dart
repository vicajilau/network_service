import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:network_wrapper/src/url_request.dart';

class NetworkService {
  /// Sends an HTTP GET request with the [UrlRequest] object waiting for a 200 status code.
  Future<dynamic> getRequest(UrlRequest request) async {
    final response = await http.get(request.url, headers: request.headers);

    if (response.statusCode == 200) {
      try {
        return jsonDecode(response.body);
      } catch (error) {
        return Future.error(error);
      }
    } else {
      return Future.error("The server did not return a 200 code");
    }
  }

  /// Sends an HTTP POST request with the [UrlRequest] object waiting for a 200, 202 or 204 status code.
  Future<dynamic> postRequest(UrlRequest request) async {
    final response = await http.post(request.url,
        headers: request.headers,
        body: request.body,
        encoding: request.encoding);

    if (response.statusCode == 200) {
      try {
        return jsonDecode(response.body);
      } catch (error) {
        return Future.error(error);
      }
    } else {
      return Future.error("The server did not return a 200 code");
    }
  }

  /// Sends an HTTP PUT request with the [UrlRequest] object waiting for a 200, 202 or 204 status code.
  Future<dynamic> putRequest(UrlRequest request) async {
    final response = await http.put(request.url,
        headers: request.headers,
        body: request.body,
        encoding: request.encoding);

    if (response.statusCode == 200 || response.statusCode == 204) {
      try {
        return jsonDecode(response.body);
      } catch (error) {
        return Future.error(error);
      }
    } else {
      return Future.error("The server did not return a 200 or 204 code");
    }
  }

  /// Sends an HTTP DELETE request with the [UrlRequest] object waiting for a 200, 202 or 204 status code.
  Future<dynamic> deleteRequest(UrlRequest request) async {
    final response = await http.delete(request.url,
        headers: request.headers,
        body: request.body,
        encoding: request.encoding);

    if (response.statusCode == 200 ||
        response.statusCode == 202 ||
        response.statusCode == 204) {
      try {
        return jsonDecode(response.body);
      } catch (error) {
        return Future.error(error);
      }
    } else {
      return Future.error("The server did not return a 200, 202 or 204 code");
    }
  }

  /// Sends an HTTP Multipart request with the [UrlRequest] object waiting for a 200 status code.
  Future<dynamic> multipartRequest(MultiPartUrlRequest request) async {
    final multipartRequest =
        http.MultipartRequest(request.method.name, request.url);
    request.fieldsMultipart?.forEach((key, value) {
      multipartRequest.fields[key] = value;
    });

    request.filesMultipart?.forEach((key, value) async => multipartRequest.files
        .add(await http.MultipartFile.fromPath(key, value)));
    final streamedResponse = await multipartRequest.send();
    var response = await http.Response.fromStream(streamedResponse);
    if (response.statusCode == 200) {
      try {
        return jsonDecode(response.body);
      } catch (error) {
        return Future.error(error);
      }
    } else {
      return Future.error(
          "The server return a ${response.statusCode} status code");
    }
  }
}
