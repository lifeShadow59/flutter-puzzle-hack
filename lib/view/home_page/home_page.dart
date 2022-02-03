import 'dart:math';
import 'dart:typed_data';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_puzzle_hack/view/home_page/crop_image.dart';
import 'package:flutter_puzzle_hack/view/home_page/file_picker.dart';
import 'dart:developer' as developer;
import "package:image/image.dart" as ui;
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin, FilePicker {
  late Animation<double> animation;
  late AnimationController _controller;
  List<dynamic> bytes = [];
  Image? thumbnail;
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
              Timeline.timeSync('interesting function', () async {
                bytes = await pickImage();
                if (bytes.isNotEmpty) {
                  final ui.Image? image = ui.decodeImage(bytes[0]);
                  if (image != null) {
                    ui.Image newCropImage =
                        ui.Image(image.width ~/ 4, image.height ~/ 4);
                    ui.Image newEmege = copyInto(
                      newCropImage,
                      image,
                      dstX: 0,
                      dstY: 0,
                      srcH: image.height,
                      srcW: image.width,
                      srcX: 0,
                      srcY: 0,
                    );
                    bytes.add(newEmege);
                    newEmege;
                    thumbnail = Image.memory(image.getBytes());
                    print('run this');
                    print('bytes len -> ${bytes.length}');
                    print(thumbnail);
                  }
                  setState(() {});
                }
              });

              // Timeline.finishSync();
            },
            icon: const Icon(Icons.ac_unit_outlined),
            iconSize: 50,
          ),
          if (thumbnail != null)
            Expanded(
              child: SingleChildScrollView(
                // child: Image.memory(bytes[0]),
                child: thumbnail,
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
