import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// USING ONE STRING MANAGE READ MORE AND READ LESS WITH MANAGING MAX-LINES
/// AND ALSO MANAGE THAT IF STRING ARE ALREADY LESS THEN MAX-LINEs THEN DON'T SHOW READ MORE FUNCTIONALITY.

class MaxLineTextController extends GetxController {
  RxBool isExpanded = RxBool(false);
  RxString stringData = RxString(
      '''Flutter is Google’s mobile UI framework for crafting high-quality native interfaces on iOS and Android in record time.  Flutter works with existing code, is used by developers and organizations around the world, and is free and open source.  Flutter works with existing code, is used by developers and organizations around the world, and is free and open source. Flutter works with existing code, is used by developers and organizations around the world, and is free and open source. Flutter works with existing code, is used by developers and organizations around the world, and is free and open source. Flutter works with existing code, is used by developers and organizations around the world, and is free and open source. Flutter works with existing code, is used by developers and organizations around the world, and is free and open source. Flutter works with existing code, is used by developers and organizations around the world, and is free and open source.''');

  RxString initialText = RxString(''); // Stores the initial part of the text
  RxString additionalText = RxString(''); // Stores the remaining part of the text
  RxBool isLongText = RxBool(false); // New flag to indicate if the text exceeds three lines

  // Method to split the text based on the height of three lines
  void splitTextBasedOnHeight(BuildContext context) {
    final textPainter = TextPainter(
      text: TextSpan(text: stringData.value, style: TextStyle(fontSize: 16)),
      maxLines: 3,
      textDirection: TextDirection.ltr,
    );

    // Layout the text to measure its height and check if it exceeds three lines
    textPainter.layout(maxWidth: MediaQuery.of(context).size.width - 32); // Adjust for padding

    // If the text exceeds three lines, split it into initial and additional parts
    if (textPainter.didExceedMaxLines) {
      isLongText.value = true;
      initialText.value = stringData.value.substring(0, textPainter.getPositionForOffset(Offset(MediaQuery.of(context).size.width - 32, 3 * textPainter.preferredLineHeight)).offset);
      additionalText.value = stringData.value.substring(initialText.value.length);
    } else {
      // If the text does not exceed three lines, display it fully
      isLongText.value = false;
      initialText.value = stringData.value;
      additionalText.value = '';
    }
  }

  // Method to toggle the expanded state
  void toggleExpanded() {
    isExpanded.value = !isExpanded.value;
  }
}
