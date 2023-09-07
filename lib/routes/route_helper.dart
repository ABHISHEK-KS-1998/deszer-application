import 'package:deszer_application1/pages/Cake/popular_cake_deatails.dart';
import 'package:deszer_application1/pages/cart/cart_page.dart';
import 'package:deszer_application1/pages/home/home_page.dart';
import 'package:deszer_application1/pages/home/main_cake_page.dart';
import 'package:get/get.dart';
import '../pages/Cake/recommended_cake_detail.dart';
import '../pages/splash/splash_page.dart';

class RouteHelper {
  static const String splashpage='/splash-page';
  static const String  initital='/';
  static const String popularCake='/popular-cake';
  static const String recommendedCake='/recommended-cake';
  static const String cartPage='/cart-page';


  static String getSplashPage()=>'$splashpage';
  static String getInitial()=>'$initital';
  static String getPopularCake(int pageId,String page)=>'$popularCake?pageId=$pageId&page=$page';
  static String getRecommendedCake(int pageId,String page)=>'$recommendedCake?pageId=$pageId&page=$page';
  static String getCartPage()=>'$cartPage';


  static List<GetPage> routes=[
    GetPage(name: splashpage, page: ()=>SplashScreen()),
    GetPage(name: initital, page: ()=>HomePage()),

    GetPage(name: popularCake, page:(){
      var pageId=Get.parameters['pageId'];
      var page=Get.parameters['page'];
      return PopularCakeDetail(pageId:int.parse(pageId!), page: page!);
      },

      transition: Transition.fadeIn

      ),
    GetPage(name: recommendedCake, page:(){
      var pageId=Get.parameters['pageId'];
      var page=Get.parameters['page'];
      return RecommendedCakeDetail(pageId:int.parse(pageId!),page:page!);
      },

      transition: Transition.fadeIn

      ),
    GetPage(name: cartPage, page: (){
      return CartPage();
    },
      transition: Transition.fadeIn
    )
  ];
}