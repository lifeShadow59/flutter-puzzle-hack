import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSized = MediaQuery.of(context).size;
    double screenMinWidth = min(screenSized.width, screenSized.height);
    return Scaffold(
      body: Container(
        color: Colors.red,
        child: AnimetedWidget(
          animation: animation,
          sizeTween: Tween<double>(
              begin: screenMinWidth - 60, end: screenMinWidth - 40),
        ),
      ),
    );
  }
}

class AnimetedWidget extends AnimatedWidget {
  const AnimetedWidget({
    Key? key,
    required Animation<double> animation,
    required this.sizeTween,
  }) : super(key: key, listenable: animation);
  final Tween<double> sizeTween;

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable as Animation<double>;
    return SizedBox(
      height: sizeTween.evaluate(animation),
      width: sizeTween.evaluate(animation),
      child: const FittedBox(
        fit: BoxFit.fill,
        child: Image(
          image: AssetImage('assets/jpg/pexels.jpg'),
        ),
      ),
    );
  }
}
