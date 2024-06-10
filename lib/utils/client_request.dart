import 'dart:convert';
import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ClientRequest {
  static Future<Map<String, dynamic>> getData(String url) async {
    Uri uri = Uri.parse(url);
    final response = await http.get(uri);
    Map<String, dynamic> json = jsonDecode(response.body);

    return json;
  }

  static Future<List<Map<String, dynamic>>> getAll(String url) async {
    Uri uri = Uri.parse(url);
    final response = await http.get(uri);
    List<dynamic> body = jsonDecode(response.body);

    List<Map<String, dynamic>> json = List<Map<String, dynamic>>.from(body);

    return json;
  }

  static Future<List<Map<String, dynamic>>> getUsers(String url) async {
    Uri uri = Uri.parse(url);
    final response = await http.get(uri);
    List<Map<String, dynamic>> json = jsonDecode(response.body);

    return json;
  }

  static Future<dynamic> postData(
      String url, Map<String, dynamic> postBody) async {
    Uri uri = Uri.parse(url);
    final response = await http.post(uri,
        headers: {"Content-Type": "application/x-www-form-urlencoded"},
        body: postBody,
        encoding: Encoding.getByName("utf-8"));
    Map<String, dynamic> json = jsonDecode(response.body);
    print(json);
    return json;
  }

  static Future<dynamic> updateData(
      String url, Map<String, dynamic> updateBody) async {
    Uri uri = Uri.parse(url);
    final response = await http.put(uri,
        headers: {"Content-Type": "application/x-www-form-urlencoded"},
        body: updateBody,
        encoding: Encoding.getByName("utf-8"));

    Map<String, dynamic> json = jsonDecode(response.body);

    return json;
  }

  static Future<http.StreamedResponse> uploadFile(String url,
      String multiPartField, dynamic filePath, String filename) async {
    Uri uri = Uri.parse(url);
    final request = http.MultipartRequest("PUT", uri);

    request.headers.addAll({"Content-Type": "multipart/form-data"});

    request.files.add(http.MultipartFile(
      multiPartField,
      File(filePath).readAsBytes().asStream(),
      File(filePath).lengthSync(),
      filename: filename,
    ));

    final streamedResponse = request.send();
    return streamedResponse;
  }

  static Future<Map<String, dynamic>> deleteData(String url) async {
    Uri uri = Uri.parse(url);
    final response = await http.delete(uri);
    Map<String, dynamic> json = jsonDecode(response.body);

    return json;
  }

  static Widget getImageFromNetwork(
      String url, String path, Map<String, dynamic>? style) {
    String uri = url + path;
    return ClipOval(
      child: SizedBox.fromSize(
          size: style!.isNotEmpty
              ? const Size.fromRadius(48)
              : Size.fromRadius(style["radius"]),
          child: style.isNotEmpty
              ? Image.network(
                  uri,
                  fit: style["fit"],
                  width: style["width"],
                  height: style["height"],
                  scale: style["scale"] ?? 5.0,
                )
              : Image.network(
                  uri,
                )),
    );
  }

  static Widget getPaymnentProofImageFromNetwork(
      String url, String path, Map<String, dynamic>? style) {
    String uri = url + path;
    if (style!.isEmpty) {
      return Image.network(
        uri,
      );
    } else {
      return Image.network(
        uri,
        fit: style["fit"],
        width: style["width"],
        height: style["height"],
      );
    }
  }
}
