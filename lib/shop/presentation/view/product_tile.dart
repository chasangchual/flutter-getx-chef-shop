import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_chef_shop/shop/data/model/product.dart';

class ProductTile extends StatelessWidget {
  final Product product;

  ProductTile(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 75,
                  width: 100,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
                  child: Image.network(product.imageLink, fit: BoxFit.fill),
                ),
                Obx(() => CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 15,
                      child: IconButton(
                        icon: product.like.isTrue
                            ? const Icon(Icons.favorite_rounded)
                            : const Icon(Icons.favorite_border),
                        onPressed: () {
                          product.like.toggle();
                        },
                        iconSize: 18,
                      ),
                    ))
              ],
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              product.name,
              maxLines: 2,
              style: const TextStyle(fontWeight: FontWeight.w400),
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: 4,
            ),
            Container(
                decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(12)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      product.rating.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                    Icon(
                      Icons.star,
                      size: 16,
                      color: Colors.white,
                    )
                  ],
                )),
            SizedBox(
              height: 4,
            ),
            Text(
              '\$${product.price}',
              style: TextStyle(fontSize: 14),
            )
          ],
        ),
      ),
    );
  }
}
