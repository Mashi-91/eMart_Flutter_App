import 'dart:io';

import 'package:delivery_app/Widgets/Custom_Button.dart';
import 'package:delivery_app/Widgets/Custom_TextField_Widget.dart';
import 'package:delivery_app/Widgets/bg_widget.dart';
import 'package:delivery_app/consts/consts.dart';
import 'package:delivery_app/controller/profile_controller.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatelessWidget {
  var controller = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return bgWidget(Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Obx(
        () => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            controller.profileImgPath.isEmpty
                ? Image.asset(imgProfile, width: 100, fit: BoxFit.cover)
                    .box
                    .roundedFull
                    .clip(Clip.antiAlias)
                    .make()
                : Image.file(
                    File(controller.profileImgPath.value),
                    width: 100,
                    fit: BoxFit.cover,
                  ).box.roundedFull.clip(Clip.antiAlias).make(),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: redColor, elevation: 0),
                onPressed: () {
                  controller.changeImage(context);
                },
                child: "Change".text.white.make()),
            const Divider(),
            20.heightBox,
            CustomTextField(
                titleText: name, hintText: nameHint, obsecureText: false),
            CustomTextField(
                titleText: password,
                hintText: passwordHint,
                obsecureText: true),
            20.heightBox,
            CustomButton(
                text: 'Save'.text.fontFamily(bold).white.make(),
                color: redColor,
                function: () {})
          ],
        )
            .box
            .white
            .shadowSm
            .roundedSM
            .padding(EdgeInsets.all(16))
            .margin(EdgeInsets.all(15))
            .make(),
      ),
    ));
  }
}
