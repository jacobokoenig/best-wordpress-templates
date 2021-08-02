import 'package:best_wordpress_sites/get_it.dart' as sl;
import 'package:best_wordpress_sites/home/presentation/pages/home_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());

  sl.init();
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // fontFamily: 'OpenSans',
        primarySwatch: Colors.blue,
      ),
      home: HomeView(),
    );
  }
}
