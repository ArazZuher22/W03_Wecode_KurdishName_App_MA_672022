import 'package:flutter/material.dart';
import 'package:kurdish_name/src/screens/futures_screen_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FuturesScreenView(),
    );
  }
}
