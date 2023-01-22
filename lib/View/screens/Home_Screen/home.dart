import 'package:delivery_app/View/screens/Cart_Screen/cartScreen.dart';
import 'package:delivery_app/View/screens/Category_Screen/categoryScreen.dart';
import 'package:delivery_app/View/screens/Home_Screen/homeScreen.dart';
import 'package:delivery_app/View/screens/Profile_Screen/profileScreen.dart';
import 'package:delivery_app/consts/consts.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../../controller/home_controller.dart';

class Home extends StatelessWidget {
  var controller = Get.put(HomeController());

  var navbarItem = const [
    BottomNavigationBarItem(
        icon: Icon(
          EvaIcons.home,
        ),
        label: home),
    BottomNavigationBarItem(
        icon: Icon(
          EvaIcons.grid,
        ),
        label: categories),
    BottomNavigationBarItem(
        icon: Icon(
          EvaIcons.shoppingCart,
        ),
        label: cart),
    BottomNavigationBarItem(
        icon: Icon(
          EvaIcons.person,
        ),
        label: account),
  ];

  var navBody = [
    HomeScreen(),
    CategoryScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx((() => Container(
          child: navBody.elementAt(controller.currentNavIndex.value)))),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currentNavIndex.value,
          selectedItemColor: redColor,
          selectedLabelStyle: TextStyle(fontFamily: semibold),
          type: BottomNavigationBarType.fixed,
          backgroundColor: whiteColor,
          items: navbarItem,
          onTap: (val) {
            controller.currentNavIndex.value = val;
          },
        ),
      ),
    );
  }
}
