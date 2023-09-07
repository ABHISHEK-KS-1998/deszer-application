import 'package:deszer_application1/controllers/popular_product_controller.dart';
import 'package:deszer_application1/pages/Cake/recommended_cake_detail.dart';
import 'package:deszer_application1/pages/auth/sign_in_page.dart';
import 'package:deszer_application1/pages/auth/sign_up_page.dart';
import 'package:deszer_application1/pages/cart/cart_page.dart';
import 'package:deszer_application1/pages/home/cake_page_body.dart';
import 'package:deszer_application1/pages/home/main_cake_page.dart';
import 'package:deszer_application1/pages/splash/splash_page.dart';
import 'package:deszer_application1/routes/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/cart_controller.dart';
import 'controllers/recommended_product_controller.dart';
import 'helper/dependencies.dart' as dep;

void main()async {
  WidgetsFlutterBinding.ensureInitialized(); //waits until all dependencies are loaded
  await dep.init(); //to initialise dependencies
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
 Get.find<CartController>().getCartData();

    return GetBuilder<PopularProductController>(builder: (_){
      return GetBuilder<RecommendedProductController>(builder: (_){
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          // home: SignInPage(),
          //  home: SplashScreen(),
          initialRoute:RouteHelper.getSplashPage(),
           getPages:RouteHelper.routes,
        );
      });
    });
  }
}

