import 'package:cryptocurrency_poc_app/app/services/api.dart';
import 'package:cryptocurrency_poc_app/app/services/api_service.dart';
import 'package:cryptocurrency_poc_app/app/services/asset.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class DataRepository {
  DataRepository(@required this.apiService);
  final APIService apiService;

  Future<List<Asset>> getAssets() async {
    try {
      return await apiService.getAssets(Endpoint.assets);
    } on Response catch (response) {
      if (response.statusCode == 401) {
        // handle token error
      }
      rethrow;
    }
  }
}
