import 'package:best_wordpress_sites/get_it.dart' as sl;
import 'package:best_wordpress_sites/home/presentation/pages/home_view.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());

  sl.init();
}

class MyApp extends StatelessWidget {
  final FirebaseAnalytics analytics = FirebaseAnalytics();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'untheme',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeView(),
      navigatorObservers: [
        FirebaseAnalyticsObserver(analytics: analytics),
      ],
    );
  }
}
