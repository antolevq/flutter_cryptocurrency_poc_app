import 'package:cryptocurrency_poc_app/app/services/api_keys.dart';
import 'package:flutter/foundation.dart';


enum Endpoint {
  assets,
}
class API {
  API({@required this.apiKey});
  final String? apiKey;

  factory API.sandbox() => API(apiKey: ApiKeys.apiKey);

  static const String host = "rest.coinapi.io";

  Uri endpointUri(Endpoint endpoint) => Uri(
        scheme: 'https',
        host: host,
        path: _paths[endpoint],
      );

  static final Map<Endpoint, String> _paths = {
    Endpoint.assets: 'v1/assets',
  };

}