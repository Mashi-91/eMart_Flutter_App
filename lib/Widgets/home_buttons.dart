import '../consts/consts.dart';

Widget homeButtons({width, height, required String title, icon, onPress}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(icon, width: 26),
      10.heightBox,
      title.text.fontFamily(bold).color(darkFontGrey).make()
    ],
  ).box.rounded.white.size(width, height).make().onInkTap(onPress);
}
