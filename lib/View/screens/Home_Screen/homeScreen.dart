import 'package:delivery_app/View/components/feature_button.dart';
import 'package:delivery_app/Widgets/home_buttons.dart';
import 'package:delivery_app/consts/lists.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../consts/consts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 12),
      color: lightGrey,
      width: context.screenWidth,
      height: context.screenHeight,
      child: SafeArea(
        child: Column(
          children: [
            Container(
              height: 60,
              alignment: Alignment.center,
              color: lightGrey,
              child: TextFormField(
                decoration: const InputDecoration(
                    filled: true,
                    border: InputBorder.none,
                    suffixIcon: Icon(EvaIcons.search),
                    fillColor: whiteColor,
                    hintText: searchanything,
                    hintStyle: TextStyle(color: textfieldGrey)),
              ),
            ),
            8.heightBox,
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    VxSwiper.builder(
                      aspectRatio: 16 / 9,
                      autoPlay: true,
                      height: 150,
                      enlargeCenterPage: true,
                      itemCount: brandList.length,
                      itemBuilder: (ctx, index) {
                        return Container(
                          child: Image.asset(
                            brandList[index],
                            fit: BoxFit.fill,
                          )
                              .box
                              .rounded
                              .clip(Clip.antiAlias)
                              .margin(const EdgeInsets.symmetric(horizontal: 5))
                              .make(),
                        );
                      },
                    ),
                    10.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                        2,
                        (i) => homeButtons(
                            height: context.screenHeight * 0.15,
                            width: context.screenWidth / 2.5,
                            icon: i == 0 ? icTodaysDeal : icFlashDeal,
                            title: i == 0 ? todayDeal : flashsale,
                            onPress: () {}),
                      ),
                    ),
                    10.heightBox,
                    VxSwiper.builder(
                      aspectRatio: 16 / 9,
                      height: 150,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      itemCount: secondSwiperList.length,
                      itemBuilder: (ctx, index) {
                        return Container(
                          child: Image.asset(
                            secondSwiperList[index],
                            fit: BoxFit.fill,
                          )
                              .box
                              .rounded
                              .clip(Clip.antiAlias)
                              .margin(const EdgeInsets.symmetric(horizontal: 5))
                              .make(),
                        );
                      },
                    ),
                    10.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                        3,
                        (i) => homeButtons(
                            height: context.screenHeight * 0.13,
                            width: context.screenWidth / 3.5,
                            icon: i == 0
                                ? icTopCategories
                                : i == 1
                                    ? icBrands
                                    : icTopSeller,
                            title: i == 0
                                ? topcategory
                                : i == 1
                                    ? brand
                                    : topsellers,
                            onPress: () {}),
                      ),
                    ),
                    20.heightBox,
                    Align(
                        alignment: Alignment.centerLeft,
                        child: featurecategory.text
                            .size(18)
                            .semiBold
                            .color(darkFontGrey)
                            .make()),
                    20.heightBox,
                    SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(
                          featureImages1.length,
                          (index) => Column(
                            children: [
                              featureButton(
                                  icon: featureImages1[index],
                                  title: featureTitle1[index]),
                              10.heightBox,
                              featureButton(
                                  icon: featureImages2[index],
                                  title: featureTitle2[index]),
                            ],
                          ),
                        ),
                      ),
                    ),

                    /// Featured Products

                    20.heightBox,
                    Container(
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      color: Colors.red,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          "Featured Products"
                              .text
                              .white
                              .size(18)
                              .fontFamily(semibold)
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
                        ],
                      ),
                    ),
                    20.heightBox,
                    VxSwiper.builder(
                      aspectRatio: 16 / 9,
                      height: 150,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      itemCount: secondSwiperList.length,
                      itemBuilder: (ctx, index) {
                        return Container(
                          child: Image.asset(
                            secondSwiperList[index],
                            fit: BoxFit.fill,
                          )
                              .box
                              .rounded
                              .clip(Clip.antiAlias)
                              .margin(const EdgeInsets.symmetric(horizontal: 5))
                              .make(),
                        );
                      },
                    ),

                    20.heightBox,
                    GridView.builder(
                        itemCount: 6,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisExtent: 300,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10),
                        itemBuilder: (ctx, i) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(imgPi1,
                                  height: 200, width: 200, fit: BoxFit.fill),
                              Spacer(),
                              "Nike Football Shoe"
                                  .text
                                  .color(darkFontGrey)
                                  .fontFamily(semibold)
                                  .make(),
                              2.heightBox,
                              "\$1000".text.color(redColor).make(),
                            ],
                          )
                              .box
                              .roundedSM
                              .margin(const EdgeInsets.symmetric(horizontal: 4))
                              .padding(const EdgeInsets.all(12))
                              .white
                              .make();
                        })
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
