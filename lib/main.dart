import 'package:flutter/material.dart';
import 'package:flutter_puzzle_hack/const/app_string.dart';
import 'package:flutter_puzzle_hack/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppString.flutterPuzzleHack,
      home: HomePage(),
      onGenerateRoute: Routes.onGenerateRoute,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SizedBox(),
    );
  }
}
