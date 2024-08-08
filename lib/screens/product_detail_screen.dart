import 'package:appdemo/screens/buy_screen.dart';
import 'package:flutter/material.dart';
import '../api/models/product.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  ProductDetailScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    width: 343,
                    height: 475,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(52),
                      ),
                      image: DecorationImage(
                        image: NetworkImage(product.img),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                // Đoạn text nổi lên trên ảnh
                Positioned(
                  top: 30, // Khoảng cách từ trên cùng
                  right: 300, // Khoảng cách từ bên phải
                  child: Column(

                    children: [
                      Container(
                        height: 44,
                        width: 44,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Image.asset('assets/back.png', height: 24, width: 24),
                      ),
                      SizedBox(height: 30),
                      Container(
                        padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                        child:Image.asset('assets/color.png', height: 320, width: 70, fit: BoxFit.fitHeight),
                      )

                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${product.price} USD',
                        style: TextStyle(fontSize: 30, color: Colors.black, fontWeight: FontWeight.w500),
                      ),
                      Row(
                        children: [
                          Image.asset('assets/star.png', height: 24, width: 24),
                          SizedBox(width: 8,),
                          Text("4.5", style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                          SizedBox(width: 16,),
                          Text("(50 reviews)", style: TextStyle(fontSize: 14, color: Colors.grey),),
                        ],
                      )
                    ],
                  ),

                  SizedBox(height: 30),
                  Text(
                    product.title,
                    style: TextStyle(fontSize: 14,fontFamily: AutofillHints.jobTitle, height: 1.7),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 30,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(8)
                        ),
                        child: Image.asset('assets/like.png', height: 24, width: 24) ,
                      ),
                      SizedBox(width: 30,),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => BuyScreen()),
                          );
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 260,
                          height: 60,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(8)
                          ),
                          child: Text("BUY", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),) ,
                        ),
                      ),

                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
