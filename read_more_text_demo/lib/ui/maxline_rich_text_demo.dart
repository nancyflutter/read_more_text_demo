import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:read_more_text_demo/controller/maxline_text_controller.dart';

class MaxLineRichText extends StatelessWidget {
  const MaxLineRichText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Read More Text Demo from One String",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GetX<MaxLineTextController>(
          init: MaxLineTextController(),
          initState: (_) {
            // Using initState to ensure text is split after the widget is built
            WidgetsBinding.instance.addPostFrameCallback((_) {
              // Get the controller instance
              final controller = Get.find<MaxLineTextController>();
              controller.splitTextBasedOnHeight(context);
            });
          },
          builder: (textController) {
            return RichText(
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
                  if (textController.isLongText.value)
                    TextSpan(
                      text: textController.isExpanded.value ? '... Read Less' : '... Read More',
                      style: const TextStyle(color: Colors.blue),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          textController.toggleExpanded();
                          textController.splitTextBasedOnHeight(context);
                        },
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
