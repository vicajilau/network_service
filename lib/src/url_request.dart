import 'dart:convert';

enum MethodRequest { POST, GET, PUT, DEL }

/// This class represents all the fields that can be required by any type of network call,
/// in such a way that it encapsulates the implementation for the rest of the projects.
class UrlRequest {
  Uri url;
  Map<String, String>? headers;
  Object? body;
  Encoding? encoding;

  UrlRequest(this.url, {this.headers, this.body, this.encoding});

  UrlRequest.fromStringUrl(String uriString,
      {this.headers, this.body, this.encoding})
      : url = Uri.parse(uriString);
}

/// This class represents all the fields that can be required by multipart request of a network call,
/// in such a way that it encapsulates the implementation for the rest of the projects.
class MultiPartUrlRequest extends UrlRequest {
  Map<String, String>? filesMultipart;
  Map<String, dynamic>? fieldsMultipart;
  MethodRequest method;

  MultiPartUrlRequest(Uri url, this.method,
      {Map<String, String>? headers,
      Object? body,
      Encoding? encoding,
      this.filesMultipart,
      this.fieldsMultipart})
      : super(url, headers: headers, body: body, encoding: encoding);

  MultiPartUrlRequest.fromStringUrl(String uriString, this.method,
      {Map<String, String>? headers,
      Object? body,
      Encoding? encoding,
      this.filesMultipart,
      this.fieldsMultipart})
      : super(Uri.parse(uriString),
            headers: headers, body: body, encoding: encoding);
}
