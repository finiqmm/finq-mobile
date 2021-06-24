import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'app_constants.dart';

class ApiClient {
  final Client _client;
  ApiClient(this._client);

  dynamic get() async {
    final response = await _client.get(getPath(), headers: {
      'Content-Type': 'application/json',
    });
    print(response.statusCode.toString());
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Uri getPath() => Uri.parse(
      '${AppConstants.BASE_URL}${AppConstants.ARTICLE_PATH}?user_content_key=${AppConstants.USER_CONTENT_KEY}');
}
