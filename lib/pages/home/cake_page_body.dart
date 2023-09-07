import 'package:deszer_application1/controllers/popular_product_controller.dart';
import 'package:deszer_application1/controllers/recommended_product_controller.dart';
import 'package:deszer_application1/routes/route_helper.dart';
import 'package:deszer_application1/utlis/app_constants.dart';
import 'package:deszer_application1/utlis/colors.dart';
import 'package:deszer_application1/widgets/app_column.dart';
import 'package:deszer_application1/widgets/big_text.dart';
import 'package:deszer_application1/widgets/icon_and_text.dart';
import 'package:deszer_application1/widgets/small_text.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/product_model.dart';
import '../../utlis/dimensinons.dart';


class CakePageBody extends StatefulWidget {
  const CakePageBody({super.key});

  @override
  State<CakePageBody> createState() => _CakePageBodyState();
}

class _CakePageBodyState extends State<CakePageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimensions.pageViewContainer;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //sliding section
            GetBuilder<PopularProductController>(builder: (popularProduct){
              return popularProduct.isLoaded?Container(
                height: Dimensions.pageView,


                  child: PageView.builder(
                      controller: pageController,
                      itemCount: popularProduct.popularProductList.length,
                      itemBuilder: (context, position) {
                        return _buildpageitem(position,popularProduct.popularProductList[position]);
                      }),

              ):CircularProgressIndicator(
                color: AppColors.maincolor,
              );
            }),
        //dots
         GetBuilder<PopularProductController>(builder:(popularProducts){
           return  DotsIndicator(
             dotsCount: popularProducts.popularProductList.isEmpty?1:popularProducts.popularProductList.length,
             position: _currPageValue.toInt(),
             decorator: DotsDecorator(
               activeColor: AppColors.maincolor,
               size: const Size.square(9.0),
               activeSize: const Size(18.0, 9.0),
               activeShape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(5.0)),
             ),
           );
         }),

        //popular text
        SizedBox(height: Dimensions.height20),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width25),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: 'Recommended'),
              SizedBox(width: Dimensions.width10),
              Container(
                margin: EdgeInsets.only(bottom: 3),
                child: BigText(
                  text: '.',
                  color: AppColors.blackcolor,
                ),
              ),
              SizedBox(width: Dimensions.width10),
              Container(
                  margin: EdgeInsets.only(bottom: 2),
                  child: SmallText(text: 'Food pairing')),
            ],
          ),
        ),
        //list of cake and images
        GetBuilder<RecommendedProductController>(builder: (recommendedProduct){
          return recommendedProduct.isLoaded?ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: recommendedProduct.recommendedProductList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){
                    Get.toNamed(RouteHelper.getRecommendedCake(index,'home'));
                  },
                  child: Container(
                      margin: EdgeInsets.only(
                          left: Dimensions.width20,
                          right: Dimensions.width20,
                          bottom: Dimensions.height10),
                      child: Row(
                        children: [
                          //image section
                          Container(
                            width: Dimensions.listViewImgSize,
                            height: Dimensions.listViewImgSize,
                            decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(Dimensions.radius20),
                                color: Colors.white38,
                                image: DecorationImage(
                                    image: NetworkImage(
                                        AppConstants.BASE_URL+AppConstants.UPLOAD_URL +recommendedProduct.recommendedProductList[index].img!
                                    ),
                                    fit: BoxFit.cover)),
                          ),
                          //text container
                          Expanded(
                            child: Container(
                              height: Dimensions.listViewTextContSize,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topRight:
                                      Radius.circular(Dimensions.radius20),
                                      bottomRight:
                                      Radius.circular(Dimensions.radius20)),
                                  color: Colors.white),
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: Dimensions.width10,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    BigText(
                                        text: recommendedProduct.recommendedProductList[index].name!),
                                    SizedBox(height: Dimensions.height10),
                                    SmallText(
                                        text: 'With chinese charecteristics'),
                                    SizedBox(height: Dimensions.height10),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        IconAndTextWidget(
                                            icon: Icons.circle_sharp,
                                            text: 'Normal',
                                            iconColor: AppColors.iconcolor1),
                                        const SizedBox(width: 10),
                                        IconAndTextWidget(
                                            icon: Icons.location_on,
                                            text: '1.7km',
                                            iconColor: AppColors.maincolor),
                                        const SizedBox(width: 10),
                                        IconAndTextWidget(
                                            icon: Icons.access_time_rounded,
                                            text: '35min',
                                            iconColor: AppColors.iconcolor2),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      )),
                );
              }):CircularProgressIndicator(
            color: AppColors.maincolor,
          );
        }),

      ],
    );
  }

  Widget _buildpageitem(int index,ProductModel popularProduct) {
    Matrix4 matrix = new Matrix4.identity();
    if (index == _currPageValue.floor()) {
      //floor() is used to round off the value
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          GestureDetector(
            onTap: (){
              Get.toNamed(RouteHelper.getPopularCake(index,"home"));
            },
            child: Container(
              height: Dimensions.pageViewContainer,
              margin: EdgeInsets.only(
                  left: Dimensions.width10, right: Dimensions.width10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius30),
                  color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
                  image: DecorationImage(
                      image: NetworkImage(
                      AppConstants.BASE_URL+AppConstants.UPLOAD_URL +popularProduct.img!
                      ),
                      fit: BoxFit.cover)),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.only(
                  left: Dimensions.width25,
                  right: Dimensions.width25,
                  bottom: Dimensions.height30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 5),
                      color: Color(0xFFe8e8e8),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(-5, 0),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(5, 0),
                    ),
                  ]),
              child: Container(
                padding: EdgeInsets.only(
                    top: Dimensions.height15, left: Dimensions.width10),
                child: AppColumn(text: popularProduct.name!)
              ),
            ),
          ),
        ],
      ),
    );
  }
}
