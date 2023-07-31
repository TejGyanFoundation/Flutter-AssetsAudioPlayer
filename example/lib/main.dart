import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'screens/home_page.dart';
import 'services/service_locator.dart' as service_locator;

Future<void> main() async {
  await service_locator.setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      builder: EasyLoading.init(),
      home: const MyHomePage(),
    );
  }
}
