import 'dart:convert';

import '../network_wrapper.dart';

/// This class represents all the fields that can be required by multipart request of a network call,
/// in such a way that it encapsulates the implementation for the rest of the projects.
class MultipartUrlRequest extends UrlRequest {
  Map<String, String>? filesMultipart;
  Map<String, dynamic>? fieldsMultipart;
  MethodRequest method;

  MultipartUrlRequest(super.url, this.method,
      {super.headers,
      super.body,
      super.encoding,
      this.filesMultipart,
      this.fieldsMultipart});

  MultipartUrlRequest.fromStringUrl(String uriString, this.method,
      {Map<String, String>? headers,
      Object? body,
      Encoding? encoding,
      this.filesMultipart,
      this.fieldsMultipart})
      : super(Uri.parse(uriString),
            headers: headers, body: body, encoding: encoding);
}
