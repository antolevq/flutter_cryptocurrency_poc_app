import 'package:flutter/material.dart';

class CryptoCard extends StatelessWidget {
  const CryptoCard(
      {Key? key, required this.cryptoCode, required this.cryptoUsdPrice})
      : super(key: key);
  final String cryptoCode;
  final String cryptoUsdPrice;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                cryptoCode ?? '',
                style: Theme.of(context).textTheme.headline6,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    cryptoUsdPrice,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
