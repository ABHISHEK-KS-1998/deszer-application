import 'package:deszer_application1/controllers/cart_controller.dart';
import 'package:deszer_application1/controllers/popular_product_controller.dart';
import 'package:deszer_application1/data/repository/cart_repo.dart';
import 'package:deszer_application1/data/repository/popular_product_repo.dart';
import 'package:deszer_application1/utlis/app_constants.dart';
import 'package:deszer_application1/utlis/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../controllers/recommended_product_controller.dart';
import '../data/api/api_client.dart';
import 'package:get/get.dart';
import '../data/repository/recommended_product_repo.dart';

Future<void>init()async {
  final sharedPreferences=await SharedPreferences.getInstance();

  Get.lazyPut(()=>sharedPreferences);
  //api client
  Get.lazyPut(()=>ApiClient(appBaseUrl: AppConstants.BASE_URL));

  //repositories
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(()=>CartRepo(sharedPreferences:Get.find()));

  //controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(() => RecommendedProductController(RecommendedProductRepo: Get.find()));
  Get.lazyPut(()=>CartController(cartRepo: Get.find()));
}