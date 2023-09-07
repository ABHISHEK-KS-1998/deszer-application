import 'package:deszer_application1/data/repository/popular_product_repo.dart';
import 'package:get/get.dart';
import '../models/product_model.dart';

class RecommendedProductController extends GetxController{
  final PopularProductRepo RecommendedProductRepo;

  RecommendedProductController({required this.RecommendedProductRepo});
  List<dynamic>_recommendedProductList=[];
  List<dynamic>get recommendedProductList =>_recommendedProductList;

  bool _isLoaded =true;
  bool get isLoaded=>_isLoaded;

  Future<void> getRecommendedProductList() async{
    Response response=await RecommendedProductRepo.getPopularProductList();

    if(response.statusCode==200){
      _recommendedProductList=[];
      _recommendedProductList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;
      update();
    }else{
      print('could not  find get');
    }
  }
}