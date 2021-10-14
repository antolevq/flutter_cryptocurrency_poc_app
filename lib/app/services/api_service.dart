import 'dart:convert';
import 'package:cryptocurrency_poc_app/app/services/asset.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cryptocurrency_poc_app/app/services/api.dart';

class APIService {
  APIService(this.api);
  final API api;

  Future<List<Asset>> getAssets(@required Endpoint endpoint) async {
    final uri = api.endpointUri(endpoint);
    print(uri.toString());
    final response =
        await http.get(uri, headers: {'X-CoinAPI-Key': '${api.apiKey}'});
    if (response.statusCode == 200) {
      return parseAssets(response.body);
    }

    print(
        "Request $uri failed\nResponse: ${response.statusCode} ${response.reasonPhrase}");
    throw response;
  }

  List<Asset> parseAssets(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Asset>((json) => Asset.fromJson(json)).toList();
  }
}
