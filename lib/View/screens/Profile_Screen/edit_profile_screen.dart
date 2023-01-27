import 'dart:io';

import 'package:delivery_app/Widgets/Custom_Button.dart';
import 'package:delivery_app/Widgets/Custom_TextField_Widget.dart';
import 'package:delivery_app/Widgets/bg_widget.dart';
import 'package:delivery_app/consts/consts.dart';
import 'package:delivery_app/controller/profile_controller.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatelessWidget {
  dynamic data;

  EditProfileScreen(this.data);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();
    return bgWidget(Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Obx(
        () => SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              data['imageUrl'] == '' && controller.profileImgPath.isEmpty
                  ? Image.asset(imgProfile, width: 100, fit: BoxFit.cover)
                      .box
                      .roundedFull
                      .clip(Clip.antiAlias)
                      .make()
                  : data['imageUrl'] != '' && controller.profileImgPath.isEmpty
                      ? Image.network(
                          data['imageUrl'],
                          width: 100,
                          fit: BoxFit.cover,
                        ).box.roundedFull.clip(Clip.antiAlias).make()
                      : Image.file(
                          File(controller.profileImgPath.value),
                          width: 80,
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
                controller: controller.nameController,
                titleText: name,
                hintText: nameHint,
                obsecureText: false,
              ),
              10.heightBox,
              CustomTextField(
                  controller: controller.oldPassController,
                  titleText: "Old Password",
                  hintText: passwordHint,
                  obsecureText: true),
              10.heightBox,
              CustomTextField(
                  controller: controller.newPassController,
                  titleText: "New Password",
                  hintText: passwordHint,
                  obsecureText: true),
              20.heightBox,
              controller.isLoading.value
                  ? const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(redColor),
                    )
                  : CustomButton(
                      text: 'Save'.text.fontFamily(bold).white.make(),
                      color: redColor,
                      function: () async {
                        controller.isLoading(true);

                        if(controller.profileImgPath.value.isNotEmpty) {
                          await controller.uploadProfileImage();
                        } else {
                          controller.profileLinkImage = data['imageUrl'];
                        }

                        if(controller.oldPassController.text == data['password']) {
                          await controller.changeAuthPass(
                            email: data['email'],
                            password: controller.oldPassController.text,
                            newPassword: controller.newPassController.text
                          );

                          await controller.uploadProfile(
                              name: controller.nameController.text,
                              password: controller.newPassController.text,
                              imgUrl: controller.profileLinkImage);
                          VxToast.show(context, msg: "Updated");
                        }else {
                          VxToast.show(context, msg: "Wrong Old Password");
                        }
                        controller.isLoading(false);
                      })
            ],
          )
              .box
              .white
              .shadowSm
              .roundedSM
              .padding(const EdgeInsets.all(16))
              .margin(const EdgeInsets.all(15))
              .make(),
        ),
      ),
    ));
  }
}
