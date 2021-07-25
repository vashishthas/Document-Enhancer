import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiRequest {
  String baseUrl = "http://hi5daksh.pythonanywhere.com/upload";

  Future<Image> sendRequest(File imageFile) async {
    Map data = convertImageToString(imageFile);
    var body = json.encode(data);

    var url = Uri.parse("$baseUrl");
    try {
      var res = await http.post(url,
          headers: {"Content-Type": "application/json"}, body: body);
      print(res.statusCode);
      print(res.body);
      final jsonBody = json.decode(res.body);
      print("@@${jsonBody["output"]}");
      final bytes = base64Decode(jsonBody["output"]);
      return Image.memory(bytes);
    } catch (e) {
      print(e);
      return Image.file(imageFile);
    }
  }

  Map<String, String> convertImageToString(File imageFile) {
    final bytes = imageFile.readAsBytesSync();
    String img64 = base64Encode(bytes);
    print("Converted string: $img64");
    Map<String, String> data = {
      "feature": "True",
      "base64": img64,
    };
    return data;
    // sendRequest(data);
  }
}
