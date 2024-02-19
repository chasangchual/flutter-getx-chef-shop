import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_chef_shop/shop/presentation/control/shop_controller.dart';
import 'package:getx_chef_shop/shop/presentation/view/product_tile.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final controller = Get.put(ShopController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Chef Shop",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black87,
        elevation: 0,
        leading: Icon(
          Icons.menu,
          color: Colors.grey,
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.view_list_outlined)),
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart)),
        ],
      ),
      body: Container(
          child: Padding(
        padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
        child: Obx(
          () => GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
              itemCount: controller.productList.length,
              itemBuilder: (context, index) {
                return ProductTile(controller.productList[index]);
              }),
        ),
      )),
    );
  }
}
