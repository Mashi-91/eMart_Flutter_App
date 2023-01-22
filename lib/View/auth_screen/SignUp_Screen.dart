import 'package:delivery_app/View/auth_screen/login_Screen.dart';
import 'package:delivery_app/View/screens/Home_Screen/home.dart';
import 'package:delivery_app/Widgets/Custom_Button.dart';
import 'package:delivery_app/Widgets/Custom_TextField_Widget.dart';
import 'package:delivery_app/Widgets/Customlogo_widget.dart';
import 'package:delivery_app/Widgets/applogo_widget.dart';
import 'package:delivery_app/Widgets/bg_widget.dart';
import 'package:delivery_app/consts/consts.dart';
import 'package:delivery_app/controller/auth_controller.dart';
import 'package:get/get.dart';

class SigupScreen extends StatefulWidget {
  @override
  State<SigupScreen> createState() => _SigupScreenState();
}

class _SigupScreenState extends State<SigupScreen> {
  bool? isCheck = false;
  var controller = Get.put(AuthController());

  //text controllers

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordRetypeController = TextEditingController();

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
              25.heightBox,
              Obx(
                () => Column(
                  children: [
                    CustomTextField(
                        controller: nameController,
                        titleText: name,
                        hintText: username,
                        obsecureText: false),
                    10.heightBox,
                    CustomTextField(
                        controller: emailController,
                        titleText: email,
                        hintText: userEmail,
                        obsecureText: false),
                    8.heightBox,
                    Align(
                      alignment: Alignment.centerRight,
                      child: "or register with a phone number"
                          .text
                          .color(const Color.fromRGBO(27, 57, 80, 1))
                          .size(12)
                          .make()
                          .onInkTap(() {}),
                    ),
                    7.heightBox,
                    CustomTextField(
                        controller: passwordController,
                        titleText: password,
                        hintText: passwordHint,
                        obsecureText: true),
                    10.heightBox,
                    CustomTextField(
                        controller: passwordRetypeController,
                        titleText: "Retype Password",
                        hintText: passwordHint,
                        obsecureText: true),
                    Row(
                      children: [
                        Checkbox(
                          checkColor: whiteColor,
                          activeColor: redColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2)),
                          onChanged: (value) {
                            setState(() {
                              isCheck = value;
                            });
                          },
                          value: isCheck,
                        ),
                        5.widthBox,
                        Expanded(
                          child: RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: "I agree to the ",
                                  style: TextStyle(
                                    fontFamily: bold,
                                    color: fontGrey,
                                  ),
                                ),
                                TextSpan(
                                  text: termandcondition,
                                  style: TextStyle(
                                    fontFamily: bold,
                                    color: redColor,
                                  ),
                                ),
                                TextSpan(
                                  text: " & ",
                                  style: TextStyle(
                                    fontFamily: bold,
                                    color: fontGrey,
                                  ),
                                ),
                                TextSpan(
                                  text: privacypolicy,
                                  style: TextStyle(
                                    fontFamily: bold,
                                    color: redColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    controller.isLoading.value
                        ? CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(redColor),
                          )
                        : CustomButton(
                            text: 'Sign up'
                                .text
                                .color(whiteColor)
                                .fontFamily(bold)
                                .make(),
                            color: isCheck == true ? redColor : lightGrey,
                            function: () async {
                              controller.isLoading(true);
                              if (isCheck != false) {
                                try {
                                  await controller
                                      .signupMethod(
                                          context: context,
                                          email: emailController.text,
                                          password: passwordController.text)
                                      .then((val) => controller.storeUserData(
                                          email: emailController.text,
                                          password: passwordController.text,
                                          name: nameController.text))
                                      .then((value) {
                                    VxToast.show(context,
                                        msg: "Account Create Successfully");
                                    Get.offAll(() => LoginScreen());
                                  });
                                } catch (e) {
                                  auth.signOut();
                                  VxToast.show(context, msg: e.toString());
                                  controller.isLoading(false);
                                }
                              }
                            },
                          ),
                    10.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        "Already have an account ?"
                            .text
                            .color(fontGrey)
                            .bold
                            .make(),
                        5.widthBox,
                        "Login in".text.color(redColor).bold.make()
                      ],
                    ).onTap(() => Get.back())
                  ],
                )
                    .box
                    .white
                    .outerShadowMd
                    .rounded
                    .padding(EdgeInsets.all(16))
                    .width(context.screenWidth - 40)
                    .make(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
