import 'package:flutter/material.dart';
import 'package:flutter_puzzle_hack/const/app_string.dart';
import 'package:flutter_puzzle_hack/routes/routes.dart';

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
    return const SafeArea(
      child: Scaffold(
        body: Image(
          image: AssetImage('assets/jpg/pexels.jpg'),
        ),
      ),
    );
  }
}
