import 'package:flutter/material.dart';
import 'package:on_point_executions/presentation/dashboard/dashboard_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins',
      ),
      home: DashboardScreen(
        events: [
          {'name': 'Event 1', 'isActive': true},
          {'name': 'Event 2', 'isActive': false},
          {'name': 'Event 3', 'isActive': true},
        ],
      ),
    );
  }
}