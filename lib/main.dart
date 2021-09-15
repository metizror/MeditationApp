import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_meditaion_demo/pages/mainHomePage/main_home_page.dart';

import 'inject_dependency.dart';

Future<void> main() async {
  await injectAllTheDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Montserrat',
        primaryColor: const Color(0xFF2238A3),
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        cardColor: Colors.grey[500],
        unselectedWidgetColor: Colors.black45,
        focusColor: Colors.black,
      ),
      home: const MyHomePage(),
    );
  }
}
