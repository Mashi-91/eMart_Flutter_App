import 'package:delivery_app/View/screens/Home_Screen/home.dart';
import 'package:delivery_app/Widgets/Custom_Button.dart';
import 'package:delivery_app/Widgets/Custom_TextField_Widget.dart';
import 'package:delivery_app/Widgets/Customlogo_widget.dart';
import 'package:delivery_app/Widgets/applogo_widget.dart';
import 'package:delivery_app/Widgets/bg_widget.dart';
import 'package:delivery_app/consts/consts.dart';
import 'package:delivery_app/controller/auth_controller.dart';
import 'package:get/get.dart';

import 'SignUp_Screen.dart';

class LoginScreen extends StatelessWidget {
  var controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(
            children: [
              (context.screenHeight * 0.1).heightBox,
              applogoWidget(),
              10.heightBox,
              "Log in to eMart".text.size(18).white.fontFamily(bold).make(),
              15.heightBox,
              Obx(
                () => Column(
                  children: [
                    CustomTextField(
                        controller: controller.emailConroller,
                        titleText: email,
                        hintText: email,
                        obsecureText: false),
                    10.heightBox,
                    CustomTextField(
                        controller: controller.passwordConroller,
                        titleText: password,
                        hintText: passwordHint,
                        obsecureText: true),
                    8.heightBox,
                    Align(
                      alignment: Alignment.centerRight,
                      child: "Forgot Password"
                          .text
                          .color(const Color.fromRGBO(27, 57, 80, 1))
                          .size(12)
                          .make()
                          .onInkTap(() {}),
                    ),
                    18.heightBox,
                    controller.isLoading.value
                        ? const CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(redColor),
                          )
                        : CustomButton(
                            text: 'Log in'
                                .text
                                .color(whiteColor)
                                .fontFamily(bold)
                                .make(),
                            color: redColor,
                            function: () async {
                              controller.isLoading(true);
                              await controller
                                  .loginMethod(context: context)
                                  .then((value) {
                                if (value != null) {
                                  VxToast.show(context,
                                      msg: "Login successful");
                                  Get.offAll(() => Home());
                                } else {
                                  controller.isLoading(false);
                                }
                              });
                            }),
                    10.heightBox,
                    "or create a new account".text.bold.make(),
                    10.heightBox,
                    CustomButton(
                      color: lightgolden,
                      function: () => Get.toNamed('/signUp'),
                      text: "Sign up"
                          .text
                          .fontFamily(bold)
                          .color(redColor)
                          .make(),
                    ),
                    10.heightBox,
                    "Login with".text.bold.make(),
                    13.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomLogo(imgName: icFacebookLogo),
                        8.widthBox,
                        CustomLogo(imgName: icGoogleLogo),
                        8.widthBox,
                        CustomLogo(imgName: icTwitterLogo),
                      ],
                    ),
                    8.heightBox
                  ],
                )
                    .box
                    .white
                    .outerShadowMd
                    .rounded
                    .padding(EdgeInsets.all(16))
                    .width(context.screenWidth - 70)
                    .make(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
