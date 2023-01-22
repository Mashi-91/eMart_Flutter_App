import 'package:delivery_app/consts/consts.dart';

Widget featureButton({required String icon, required String title}) {
  return Row(
    children: [
      Image.asset(
        icon,
        width: 60,
        fit: BoxFit.fill,
      ),
      10.widthBox,
      title.text.fontFamily(semibold).color(darkFontGrey).make()
    ],
  )
      .box
      .white
      .margin(EdgeInsets.symmetric(horizontal: 4))
      .width(200)
      .padding(const EdgeInsets.all(4))
      .roundedSM
      .outerShadowSm
      .make();
}
