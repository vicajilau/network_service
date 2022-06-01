import 'dart:convert';

/// This class represents all the fields that can be required by any type of network call,
/// in such a way that it encapsulates the implementation for the rest of the projects.
class UrlRequest {
  Uri url;
  Map<String, String>? headers;
  Object? body;
  Encoding? encoding;

  UrlRequest(this.url, {this.headers, this.body, this.encoding});

  UrlRequest.fromStringUrl(String uriString, {this.headers, this.body, this.encoding}): url = Uri.parse(uriString);
}
