import 'package:get/get.dart';
import 'package:getx_chef_shop/shop/data/model/product.dart';
import 'package:getx_chef_shop/shop/data/repository/product_repository.dart';

class ShopController extends GetxController {
  var productList = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();

    fetchData();
  }

  void fetchData() async {
    var products = await ProductRepository.fetchProduct();
    if (products != null) {
      productList.value = products;
    }
  }
}
