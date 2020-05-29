import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  get({
    @required String url,
    Map<String, String> headers,
    ValueChanged callback(int code, String message, Map<String, dynamic> json),
  }) {
    http.get(url, headers: headers).then((response) {
      print("GET ${response.statusCode}\n"
          "url $url\n"
          "header $headers\n"
          "${response.statusCode == 200 ? "" : "${response.body}"}");
      Map<String, dynamic> res = jsonDecode(response.body);
      callback(response.statusCode,
          response.statusCode == 200 ? 'Request Sukses' : res["error"], res);
    }).catchError((e) {
      callback(400, "Terjadi kesalahan", null);
    });
  }

  post(
      {String url,
      Map<String, String> headers,
      Map<String, dynamic> body,
      ValueChanged callback(
          int code, String message, Map<String, dynamic> json)}) {
    Map<String, String> appHeaders = {"Content-Type": "application/json"};
    if (headers != null) {
      appHeaders.addAll(headers);
    }
    http
        .post(url, headers: appHeaders, body: jsonEncode(body))
        .then((response) {
      print("POST ${response.statusCode}\n"
          "url $url\n"
          "header ${response.headers}\n"
          "body $body\n"
          "response ${response.body}");
      Map<String, dynamic> res = jsonDecode(response.body);
      callback(response.statusCode,
          response.statusCode == 200 ? 'Request Sukses' : res["error"], res);
    });
  }

//put
//upload multipart (image)

}
