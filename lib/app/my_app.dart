import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../presentation/home/home.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NearBy Me',
      home: Home(title: 'NearBy Me'),
    );
  }
}
