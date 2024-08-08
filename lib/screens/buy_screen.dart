import 'package:appdemo/screens/home_page_screen.dart';
import 'package:appdemo/screens/home_screen.dart';
import 'package:flutter/material.dart';

class BuyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 124,),
            Text("SUCCESS!", style:TextStyle( fontSize: 36, fontWeight: FontWeight.w700) ,),
            SizedBox(height: 30,),
            Image.asset('assets/success.png', height: 269, width:screenWidth),
            SizedBox(height: 30,),
            Text("Your order will be delivered soon \n Thank you for choosing our app!",
              style: TextStyle(fontSize: 18, color: Colors.grey,fontFamily: AutofillHints.addressCity),),
            SizedBox(height: 50,),
            Container(
              alignment: Alignment.center,
              width: screenWidth *0.8,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(8)
              ),
              child: Text("Track your orders", style: TextStyle(color: Colors.white,fontSize: 18),),
            ),
            SizedBox(height: 30,),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePageScreen()),
                );
              },
              child:
              Container(
                alignment: Alignment.center,
                width: screenWidth *0.8,
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.black, width: 1)
                ),
                child: Text("BACK TO HOME", style: TextStyle(color: Colors.black,fontSize: 18),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
