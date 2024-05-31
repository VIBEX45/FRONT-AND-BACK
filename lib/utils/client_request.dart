import 'dart:convert';
import 'dart:io';
import 'package:flutter/gestures.dart';
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

  //TODO: Change the host IP
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
}