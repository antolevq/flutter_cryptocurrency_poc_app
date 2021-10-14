import 'package:intl/intl.dart';

class Asset {
  final String assetId;
  final String name;
  final int isCrypto;
  final num? priceUsd;
  final String? dateStart;

  Asset(
      {required this.assetId,
      required this.name,
      required this.isCrypto,
      required this.priceUsd,
      required this.dateStart});

  String getCurrencyFromPrice() {
    if (priceUsd == null) {
      return "";
    }
    //final format = NumberFormat("#,##0.00", "en_US");
    //return format.format(priceUsd);
    return priceUsd.toString();
  }

  factory Asset.fromJson(Map<String, dynamic> json) {
    return Asset(
      assetId: json['asset_id'],
      name: json['name'],
      isCrypto: json['type_is_crypto'],
      priceUsd: json['price_usd'],
      dateStart: json['data_start'],
    );
  }
}
