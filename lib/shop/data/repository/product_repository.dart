import 'package:getx_chef_shop/shop/data/model/product.dart';
import 'package:http/http.dart' as http;

class ProductRepository {
  static var client = http.Client();

  static Future<List<Product>?> fetchProduct() async {
    var response =
        await client.get(Uri.parse('https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline'));
    if (response.statusCode == 200) {
      return productFromJson(response.body);
    } else {
      return null;
    }
    ;
  }
}
