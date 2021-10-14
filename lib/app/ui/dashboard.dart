import 'package:cryptocurrency_poc_app/app/repositories/data_repository.dart';
import 'package:cryptocurrency_poc_app/app/services/asset.dart';
import 'package:cryptocurrency_poc_app/app/ui/crypto_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    super.initState();
    _updateData();
  }

  late List<Asset> _assets;

  Future<void> _updateData() async {
    final dataRepository = Provider.of<DataRepository>(context, listen: false);
    final assets = await dataRepository.getAssets();
    setState(() => _assets = assets);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cryptocurrency App'),
      ),
      body: RefreshIndicator(
        onRefresh: _updateData,
        child: ListView(
          children: [
            for (var asset in _assets)
            CryptoCard(
              cryptoCode: asset.name??'',
              cryptoUsdPrice: asset.getCurrencyFromPrice(),
            )
          ],
        ),
      ),
    );
  }
}
