import 'dart:convert';
import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:http/http.dart' as http;

class ClientRequest{

  static Future<Map<String, dynamic>> getData(String url) async {
    Uri uri = Uri.parse(url);
    final response = await http.get(uri);
    Map<String, dynamic> json = jsonDecode(response.body);

    return json;
  }

  static Future<dynamic> postData(String url, Map<String, dynamic> postBody) async{
    Uri uri = Uri.parse(url);
    final response = await http.post(uri,
      headers: {
        "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8"
      },
      body: postBody,
      encoding: Encoding.getByName("utf-8")
    );
    Map<String, dynamic> json = jsonDecode(response.body);
    return json;
  }

  static Future<http.StreamedResponse> uploadFile(String url, String multiPartField, dynamic filePath) async{
    Uri uri = Uri.parse(url);
    final request = http.MultipartRequest("PUT", uri);

    await http.MultipartFile(
      multiPartField, 
      File(filePath).readAsBytes().asStream(),
      File(filePath).lengthSync(),
      filename: filePath.split["/"].last(),
    );

    final streamedResponse = request.send();
    return streamedResponse;

  }



}