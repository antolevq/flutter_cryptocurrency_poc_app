import 'package:cryptocurrency_poc_app/app/repositories/data_repository.dart';
import 'package:cryptocurrency_poc_app/app/services/api.dart';
import 'package:cryptocurrency_poc_app/app/services/api_service.dart';
import 'package:cryptocurrency_poc_app/app/ui/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<DataRepository>(
      create: (_) => DataRepository(APIService(API.sandbox())),
      child: MaterialApp(
        title: 'CryptoCurrency App',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: const Color(0xFF101010),
          cardColor: const Color(0xFF222222)
        ),
        home: Dashboard(),
      ),
    );
  }
}