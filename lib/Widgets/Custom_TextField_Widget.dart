import 'package:delivery_app/consts/consts.dart';
import 'package:velocity_x/velocity_x.dart';

// ignore: must_be_immutable

Widget CustomTextField(
    {required String titleText,
    required String hintText,
    required bool obsecureText,
    controller}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      titleText.text.color(redColor).fontFamily(semibold).size(16).make(),
      5.heightBox,
      TextFormField(
        controller: controller,
        decoration: InputDecoration(
          isDense: true,
          hintText: hintText,
          hintStyle: TextStyle(color: textfieldGrey, fontFamily: semibold),
          fillColor: lightGrey,
          filled: true,
          border: InputBorder.none,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: redColor),
          ),
        ),
        obscureText: obsecureText,
      )
    ],
  );
}
