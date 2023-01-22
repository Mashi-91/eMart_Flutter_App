import 'package:delivery_app/Widgets/Custom_Button.dart';
import 'package:delivery_app/Widgets/home_buttons.dart';
import 'package:delivery_app/consts/consts.dart';
import 'package:delivery_app/consts/lists.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ItemDetail extends StatelessWidget {
  final String title;
  const ItemDetail({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGrey,
      appBar: AppBar(
        elevation: 0,
        title: title.text.color(darkFontGrey).fontFamily(bold).make(),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                EvaIcons.share,
              )),
          IconButton(onPressed: () {}, icon: Icon(EvaIcons.heartOutline)),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      VxSwiper.builder(
                          height: 350,
                          aspectRatio: 16 / 9,
                          autoPlay: true,
                          itemCount: 3,
                          itemBuilder: ((context, index) {
                            return Image.asset(
                              imgFc5,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            );
                          })),
                      10.heightBox,
                      title.text
                          .size(16)
                          .color(darkFontGrey)
                          .fontFamily(semibold)
                          .make(),
                      10.heightBox,
                      VxRating(
                        onRatingUpdate: (val) {},
                        normalColor: textfieldGrey,
                        selectionColor: golden,
                        count: 5,
                        size: 25,
                        stepInt: true,
                      ),
                      10.heightBox,
                      "\$30,000"
                          .text
                          .color(redColor)
                          .fontFamily(bold)
                          .size(18)
                          .make(),
                      10.heightBox,
                      Row(
                        children: [
                          Expanded(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              "Seller".text.white.fontFamily(semibold).make(),
                              5.heightBox,
                              "In House Brands"
                                  .text
                                  .fontFamily(semibold)
                                  .color(darkFontGrey)
                                  .size(16)
                                  .make()
                            ],
                          )),
                          const CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(
                              EvaIcons.messageCircle,
                              color: darkFontGrey,
                            ),
                          )
                        ],
                      )
                          .box
                          .height(60)
                          .roundedSM
                          .padding(EdgeInsets.symmetric(horizontal: 16))
                          .color(textfieldGrey)
                          .make(),
                      20.heightBox,
                      Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 100,
                                child:
                                    "Color: ".text.color(textfieldGrey).make(),
                              ),
                              Row(
                                children: List.generate(
                                    3,
                                    (index) => VxBox()
                                        .size(35, 35)
                                        .roundedFull
                                        .margin(
                                            EdgeInsets.symmetric(horizontal: 6))
                                        .color(Vx.randomPrimaryColor)
                                        .shadow
                                        .make()),
                              )
                            ],
                          ).box.padding(EdgeInsets.all(8)).make(),
                          Row(
                            children: [
                              SizedBox(
                                width: 100,
                                child: "Quantity: "
                                    .text
                                    .color(textfieldGrey)
                                    .make(),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(EvaIcons.minusCircle)),
                                  "0".text.size(16).fontFamily(bold).make(),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(EvaIcons.plusCircle)),
                                  10.widthBox,
                                  "(0 available)"
                                      .text
                                      .color(textfieldGrey)
                                      .make(),
                                ],
                              )
                            ],
                          ).box.padding(EdgeInsets.all(8)).make(),
                          Container(
                            color: lightgolden,
                            height: 45,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 100,
                                  child: "Total Price: "
                                      .text
                                      .color(textfieldGrey)
                                      .make(),
                                ),
                                Row(
                                  children: [
                                    "\$0.00"
                                        .text
                                        .size(15)
                                        .color(redColor)
                                        .make()
                                  ],
                                )
                              ],
                            ).box.padding(EdgeInsets.all(8)).make(),
                          ),
                          20.heightBox
                        ],
                      ).box.white.shadowSm.roundedSM.make(),
                      10.heightBox,
                      "Description"
                          .text
                          .color(darkFontGrey)
                          .fontFamily(semibold)
                          .make(),
                      10.heightBox,
                      "This is a dummy item and description here...."
                          .text
                          .color(darkFontGrey)
                          .make(),
                      ListView(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        children: List.generate(
                            cutomerOptions.length,
                            (index) => ListTile(
                                  tileColor: Colors.white,
                                  title: cutomerOptions[index]
                                      .text
                                      .fontFamily(semibold)
                                      .color(darkFontGrey)
                                      .make(),
                                  trailing: Icon(EvaIcons.arrowRight),
                                )
                                    .box
                                    .margin(EdgeInsets.symmetric(vertical: 3))
                                    .make()),
                      ),
                      20.heightBox,
                      "Products you may also like"
                          .text
                          .fontFamily(bold)
                          .size(16)
                          .color(darkFontGrey)
                          .make(),
                      10.heightBox,
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                              6,
                              (i) => Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        imgP1,
                                        width: 150,
                                        fit: BoxFit.cover,
                                      ),
                                      20.heightBox,
                                      "Laptop 16GB/1tb"
                                          .text
                                          .fontFamily(semibold)
                                          .color(darkFontGrey)
                                          .make(),
                                      10.heightBox,
                                      "\$600"
                                          .text
                                          .color(redColor)
                                          .size(18)
                                          .make()
                                    ],
                                  )
                                      .box
                                      .white
                                      .margin(const EdgeInsets.symmetric(
                                          horizontal: 5))
                                      .padding(EdgeInsets.all(8))
                                      .roundedSM
                                      .make()),
                        ),
                      )
                    ]),
              ),
            ),
          ),
          SizedBox(
              width: double.infinity,
              height: 60,
              child: CustomButton(
                  text: 'Add to Cart'.text.white.make(),
                  color: redColor,
                  function: () {}))
        ],
      ),
    );
  }
}
