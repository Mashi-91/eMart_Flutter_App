import 'package:delivery_app/consts/consts.dart';

Widget detailsCard(
    {required width, required String title, required String subtitle}) {
  return Column(
    children: [
      title.text.fontFamily(bold).color(darkFontGrey).make(),
      5.heightBox,
      subtitle.text.color(darkFontGrey).make()
    ],
  )
      .box
      .roundedSM
      .white
      .height(60)
      .width(width)
      .padding(EdgeInsets.all(4))
      .make();
}
