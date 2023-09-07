import 'package:deszer_application1/controllers/popular_product_controller.dart';
import 'package:deszer_application1/controllers/recommended_product_controller.dart';
import 'package:deszer_application1/pages/cart/cart_page.dart';
import 'package:deszer_application1/routes/route_helper.dart';
import 'package:deszer_application1/utlis/app_constants.dart';
import 'package:deszer_application1/utlis/colors.dart';
import 'package:deszer_application1/widgets/app_icon.dart';
import 'package:deszer_application1/widgets/expandable_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/cart_controller.dart';
import '../../utlis/dimensinons.dart';
import '../../widgets/big_text.dart';

class RecommendedCakeDetail extends StatelessWidget {
  final int pageId;
  final String page;
   RecommendedCakeDetail({required this.pageId,super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    var product=Get.find<RecommendedProductController>().recommendedProductList[pageId];
    Get.find<PopularProductController>().initProduct(product,Get.find<CartController>());
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(automaticallyImplyLeading: false,
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){
                    if(page=='cartpage'){
                      Get.toNamed(RouteHelper.getCartPage());
                    }else{
                      Get.toNamed(RouteHelper.getInitial());
                    }
                  },child: AppIcon(icon: Icons.clear)),
                GetBuilder<PopularProductController>(builder: (controller){
                  return GestureDetector(
                    onTap: (){
                      Get.toNamed(RouteHelper.getCartPage());
                    },
                    child: Stack(
                      children: [
                        AppIcon(icon: Icons.shopping_cart_outlined),
                        Get.find<PopularProductController>().totalItems>=1?
                        Positioned(
                            right:0,top:0,
                              child: AppIcon(icon: Icons.circle,
                                size: 20,iconColor: Colors.transparent,
                                backgroundColor: AppColors.maincolor,),
                            ):
                        Container(),
                        Get.find<PopularProductController>().totalItems>=1?
                        Positioned(
                          right:3,top:3,
                          child:BigText(
                            text: Get.find<PopularProductController>().totalItems.toString(),
                            size: 15,color: AppColors.whitecolor,
                          ),):
                        Container()
                      ],
                    ),
                  );
                })
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                child: Center(
                    child: BigText(
                  size: Dimensions.font26,
                  text: product.name!,
                )),
                width: double.maxFinite,
                padding: EdgeInsets.only(top: 5, bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimensions.radius20),
                      topRight: Radius.circular(Dimensions.radius20)),
                ),
              ),
            ),
            pinned: true,
            backgroundColor: AppColors.purplecolor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                AppConstants.BASE_URL+AppConstants.UPLOAD_URL+product.img,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
              child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                    left: Dimensions.width20, right: Dimensions.width20),
                child: ExpandableTextWidget(
                  text: product.description!,
                ),
              )
            ],
          ))
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(builder: (controller){
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.only(
                  left: Dimensions.width20 * 2.5,
                  right: Dimensions.width20 * 2.5,
                  top: Dimensions.height10,
                  bottom: Dimensions.height10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap:(){
                      controller.setQuantity(false);
                    },
                    child: AppIcon(
                      iconColor: Colors.white,
                      backgroundColor: AppColors.maincolor,
                      icon: Icons.remove,
                      iconsize: Dimensions.iconsize30,
                    ),
                  ),
                  BigText(
                    text: '\$ ${product.price!} X  ${controller.inCartItems} ',
                    color: AppColors.mainblackcolor,
                    size: Dimensions.font26,
                  ),
                  GestureDetector(
                    onTap: (){
                     controller.setQuantity(true);
                    },
                    child: AppIcon(
                      iconColor: Colors.white,
                      backgroundColor: AppColors.maincolor,
                      icon: Icons.add,
                      iconsize: Dimensions.iconsize30,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: Dimensions.bottomHeightBar,
              padding: EdgeInsets.only(
                  top: Dimensions.height30,
                  bottom: Dimensions.height30,
                  left: Dimensions.width20,
                  right: Dimensions.width20),
              decoration: BoxDecoration(
                  color: AppColors.buttonbackgroundcolor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimensions.radius20 * 2),
                      topRight: Radius.circular(Dimensions.radius20 * 2))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      padding: EdgeInsets.only(
                          top: Dimensions.height20,
                          bottom: Dimensions.height20,
                          left: Dimensions.width20,
                          right: Dimensions.width20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimensions.radius20),
                          color: Colors.white),
                      child:  Icon(
                        Icons.favorite,
                        color: AppColors.maincolor,
                      )
                  ),
                  GestureDetector(
                    onTap: (){
                      controller.addItem(product);
                    },
                    child: Container(
                      padding: EdgeInsets.only(
                          top: Dimensions.height20,
                          bottom: Dimensions.height20,
                          left: Dimensions.width20,
                          right: Dimensions.width20),
                      child: BigText(
                        text: '\$ ${product.price!}| Add to cart',
                        color: AppColors.whitecolor,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimensions.radius20),
                          color: AppColors.maincolor),
                    ),
                  )
                ],
              ),
            ),
          ],
        );
      })
    );
  }
}
