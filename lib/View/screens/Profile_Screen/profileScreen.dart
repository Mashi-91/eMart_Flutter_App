import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_app/View/auth_screen/login_Screen.dart';
import 'package:delivery_app/View/screens/Profile_Screen/components/feature_card.dart';
import 'package:delivery_app/View/screens/Profile_Screen/edit_profile_screen.dart';
import 'package:delivery_app/Widgets/bg_widget.dart';
import 'package:delivery_app/controller/auth_controller.dart';
import 'package:delivery_app/services/firestore_services.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:get/get.dart';

import '../../../consts/consts.dart';
import '../../../controller/profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  var controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return bgWidget(SafeArea(
      child: Scaffold(
          body: StreamBuilder(
              stream: FirestoreServices.getUser(currentUser!.uid),
              builder: ((context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(redColor),
                    ),
                  );
                } else {
                  var data = snapshot.data!.docChanges[0].doc;

                  return SafeArea(
                    child: Container(
                      child: Column(
                        children: [
                          Align(
                              alignment: Alignment.topRight,
                              child: IconButton(
                                  onPressed: () {
                                    controller.nameController.text = data['name'];
                                    Get.to(() => EditProfileScreen(data));
                                  },
                                  icon: const Icon(EvaIcons.edit,
                                      color: whiteColor))),
                          Row(
                            children: [
                              data['imageUrl'] == '' ?
                              Image.asset(
                                imgProfile,
                                width: 80,
                                fit: BoxFit.cover,
                              ).box.roundedFull.clip(Clip.antiAlias).make()
                              : Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 5),
                                child: Image.network(data['imageUrl'],
                                  width: 70,
                                  fit: BoxFit.cover,
                                ).box.roundedFull.clip(Clip.antiAlias).make(),
                              )
                              ,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  "${data['name']}".text
                                      .fontFamily(semibold)
                                      .color(whiteColor)
                                      .make(),
                                  "${data['email']}".text
                                      .size(12)
                                      .color(whiteColor)
                                      .make()
                                ],
                              ),
                              Spacer(),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                width: 80,
                                height: 30,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        width: 1, color: whiteColor)),
                                child: "LogOut"
                                    .text
                                    .size(10)
                                    .color(whiteColor)
                                    .makeCentered(),
                              ).onTap(() async {
                                await Get.put(AuthController())
                                    .signOutMethod(context);
                                Get.offAll(() => LoginScreen());
                              })
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              detailsCard(
                                  width: context.screenWidth / 3.4,
                                  title: '${data['cart_count']}',
                                  subtitle: 'in your cart'),
                              detailsCard(
                                  width: context.screenWidth / 3.4,
                                  title: '${data['wishlist_count']}',
                                  subtitle: 'in your wishlist'),
                              detailsCard(
                                  width: context.screenWidth / 3.4,
                                  title: '${data['order_count']}',
                                  subtitle: 'your orders'),
                            ],
                          ),
                          Column(
                            children: [
                              ListTile(
                                leading: Icon(Icons.ballot_outlined),
                                title: "My Orders".text.size(12).make(),
                              ),
                              Divider(),
                              ListTile(
                                  leading: Icon(EvaIcons.heartOutline),
                                  title: "My Wishlist".text.size(12).make()),
                              Divider(),
                              ListTile(
                                  leading: Icon(EvaIcons.messageSquareOutline),
                                  title: "Messages".text.size(12).make()),
                            ],
                          )
                              .box
                              .color(whiteColor)
                              .shadow
                              .margin(EdgeInsets.all(12))
                              .roundedSM
                              .make()
                              .box
                              .color(const Color.fromRGBO(231, 42, 0, 1))
                              .make(),
                        ],
                      ),
                    ),
                  );
                }
              }))),
    ));
  }
}
