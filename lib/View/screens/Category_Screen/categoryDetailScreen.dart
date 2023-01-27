import 'package:delivery_app/View/screens/Category_Screen/itemDetail.dart';
import 'package:delivery_app/Widgets/bg_widget.dart';
import 'package:delivery_app/consts/consts.dart';
import 'package:delivery_app/consts/lists.dart';
import 'package:delivery_app/controller/product_controller.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class CategoryDetail extends StatelessWidget {
  final String title;

  const CategoryDetail({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProductController>();
    return bgWidget(Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: title.text.size(18).fontFamily(bold).white.make(),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(controller.subCat.length, (index) {
                  return Container(
                    child: "${controller.subCat[index]}"
                        .text
                        .fontFamily(semibold)
                        .size(12)
                        .center
                        .makeCentered()
                        .box
                        .white
                        .roundedSM
                        .size(120, 60)
                        .p8
                        .margin(const EdgeInsets.symmetric(horizontal: 10))
                        .make(),
                  );
                }),
              ),
            ),
            10.heightBox,
            Expanded(
                child: Container(
              child: GridView.builder(
                  itemCount: 6,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 250,
                  ),
                  itemBuilder: (ctx, i) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          imgP1,
                          height: 120,
                          width: 200,
                          fit: BoxFit.cover,
                        ),
                        10.heightBox,
                        "Hello, world!".text.color(darkFontGrey).make(),
                        10.heightBox,
                        "\$600".text.color(redColor).size(18).make()
                      ],
                    )
                        .box
                        .white
                        .margin(const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 5))
                        .padding(const EdgeInsets.all(8))
                        .roundedSM
                        .outerShadowSm
                        .make()
                        .onTap(() {
                      Get.to(() => ItemDetail(title: "Dymmy Title"));
                    });
                  }),
            ))
          ],
        ),
      ),
    ));
  }
}
