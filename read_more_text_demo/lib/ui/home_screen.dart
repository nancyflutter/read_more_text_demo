import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:read_more_text_demo/controller/home_controller.dart';
import 'package:read_more_text_demo/ui/maxline_rich_text_demo.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
      init: HomeController(),
      builder: (textController) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              "read More text demo from one string",
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Get.to(() => const MaxLineRichText());
                },
                icon: const Icon(Icons.arrow_forward),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: textController.initialText.value,
                    style: const TextStyle(color: Colors.black),
                  ),
                  if (textController.isExpanded.value)
                    TextSpan(
                      text: textController.additionalText.value,
                      style: const TextStyle(color: Colors.black),
                    ),
                  TextSpan(
                    text: textController.isExpanded.value ? ' Read Less' : ' Read More',
                    style: const TextStyle(color: Colors.blue),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        textController.toggleExpanded();
                      },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
