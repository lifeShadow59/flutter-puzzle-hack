import 'dart:math';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_puzzle_hack/view/home_page/file_picker.dart';
// import "package:image/image.dart" as image;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin, FilePicker {
  late Animation<double> animation;
  late AnimationController _controller;
  // image.Image? fromImagePicker;
  List<int>? imageBytesList;
  List<Image>? imageMemoryList;
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
      body: Column(
        children: [
          AnimetedWidget(
            animation: animation,
            sizeTween: Tween<double>(
                begin: screenMinWidth - 60, end: screenMinWidth - 40),
          ),
          const SizedBox(
            height: 100,
          ),
          IconButton(
            onPressed: () async {
              Timeline.timeSync(
                'interesting function',
                () async {
                  MediaQueryData queryData = MediaQuery.of(context);
                  double devicePixelRatio = queryData.devicePixelRatio;
                  imageMemoryList = await pickImage();
                  setState(() {});
                },
              );
            }

            // Timeline.finishSync();
            ,
            icon: const Icon(Icons.ac_unit_outlined),
            iconSize: 50,
          ),
          if (imageMemoryList != null && imageMemoryList!.isNotEmpty)
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          imageMemoryList![0],
                          imageMemoryList![1],
                          imageMemoryList![2],
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          imageMemoryList![3],
                          imageMemoryList![4],
                          imageMemoryList![5],
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          imageMemoryList![6],
                          imageMemoryList![7],
                          imageMemoryList![8],
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
        ],
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
