import 'package:flutter/material.dart';
import 'package:git_hub_acctions_app/Screen/list_view_screen.dart';
import 'package:git_hub_acctions_app/environment.dart';

void main() {
  print('Using Service: ${Environment.serviceName}');
  print('Base URL: ${Environment.baseUrl}');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: UserListScreen(),
      ),
    );
  }
}
