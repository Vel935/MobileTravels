import 'package:flutter/material.dart';
import 'package:mobiletravels/pages/HomePage.dart';
import 'package:mobiletravels/pages/TripsPage.dart';
import 'package:mobiletravels/providers/ExpenseProvider.dart';
import 'package:mobiletravels/providers/TripProvider.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ExpenseProvider()),
        ChangeNotifierProvider(create: (_) => TripProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Viajes y Aventuras',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TripsPage(),
    );
  }
}
