// lib/widgets/product_tile.dart

import 'package:flutter/material.dart';
import '../api/models/product.dart';
import '../screens/product_detail_screen.dart';

class ProductTile extends StatelessWidget {
  final Product product;

  ProductTile({required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(product: product),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0), // Thay đổi giá trị để điều chỉnh góc bo
              child: Image.network(
                product.img,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),

            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8),
                  Text(
                    product.name,
                    style: TextStyle(fontSize: 14, color: Colors.black),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 8),
                  Text(
                    '${product.price} USD',
                    style: TextStyle(fontSize: 14,  fontWeight: FontWeight.bold,)
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
