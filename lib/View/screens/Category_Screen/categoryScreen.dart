import 'package:delivery_app/View/screens/Category_Screen/categoryDetailScreen.dart';
import 'package:delivery_app/Widgets/bg_widget.dart';
import 'package:delivery_app/consts/lists.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../../consts/consts.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        title: categories.text.fontFamily(bold).white.make(),
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        child: GridView.builder(
          itemCount: categoriesImages.length,
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisExtent: 200,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8),
          itemBuilder: ((context, i) {
            return Column(
              children: [
                Image.asset(
                  categoriesImages[i],
                  height: 120,
                  width: 200,
                  fit: BoxFit.cover,
                ),
                10.heightBox,
                "${categoriesList[i]}"
                    .text
                    .color(darkFontGrey)
                    .align(TextAlign.center)
                    .make()
              ],
            )
                .box
                .roundedSM
                .white
                .clip(Clip.antiAlias)
                .outerShadowSm
                .make()
                .onTap(() {
              Get.to(() => CategoryDetail(title: categoriesList[i]));
            });
          }),
        ),
      ),
    ));
  }
}
