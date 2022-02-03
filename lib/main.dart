import 'package:flutter/material.dart';
import 'package:flutter_puzzle_hack/const/app_string.dart';
import 'package:flutter_puzzle_hack/routes/routes.dart';
import 'package:flutter_puzzle_hack/view/home_page/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    precacheImage(
      Image.asset('assets/jpg/pexels.jpg').image,
      context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      showPerformanceOverlay: true,
      title: AppString.flutterPuzzleHack,
      home: HomePage(),
      onGenerateRoute: Routes.onGenerateRoute,
    );
  }
}
