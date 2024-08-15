import 'package:get/get.dart';

/// SPLIT SPECIFICS PART OF STRING AND MANAGE READ MORE TEXT

class HomeController extends GetxController {
  RxBool isExpanded = RxBool(false);
  RxString stringData = RxString('''Definition: a double-reed woodwind instrument having a conical tube, a brilliant penetrating tone, and a usual range from B flat below middle C upward for over 2¹/₂ octaves : an oboe

The English word oboe is, by orders of magnitude, more common than hautbois, which is used for the same instrument. Hautbois has about 200 more recorded years of usage than oboe, however. Oboe entered English in the 1700s from the Italian oboe, which in turn came from the French word… hautbois. Hautbois can also be spelled hautboy, and has two plural forms as well, hautbois and hautboys.

At Mid-Lent annually they attended with their court at the Quinze-Vingts, in Paris, in order to see blindfold persons, armed from head to foot, fighting with a lance or stick. This amusement was quite sufficient to attract all Paris. In 1425, on the last day of August, the inhabitants of the capital crowded their windows to witness the procession of four blind men, clothed in full armour, like knights going to a tournament, and preceded by two men, one playing the hautbois and the other bearing a banner on which a pig was painted.
— P. L. Jacob, Manners, Customs, and Dress During the Middle Ages and During the Renaissance Period, 1874''');

  RxString initialText = RxString('');
  RxString additionalText = RxString('');

  @override
  void onInit() {
    super.onInit();
    splitText();
  }

  void splitText() {
    // Split the text into initial and additional parts
    List<String> parts = stringData.value.split('At Mid-Lent annually');
    initialText.value = parts[0];
    additionalText.value = 'At Mid-Lent annually' + parts[1];
  }

  void toggleExpanded() {
    isExpanded.value = !isExpanded.value;
  }
}
