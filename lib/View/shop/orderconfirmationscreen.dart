import 'package:aanma_nalam/View/shop/shopmorepage.dart';
import 'package:aanma_nalam/View/shop/trackingscreen.dart';
import 'package:aanma_nalam/constant/app_theme.dart';
import 'package:aanma_nalam/constant/topmenu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderConfirmationScreen extends StatefulWidget {
  const OrderConfirmationScreen({super.key});

  @override
  State<OrderConfirmationScreen> createState() => _OrderConfirmationScreenState();
}

class _OrderConfirmationScreenState extends State<OrderConfirmationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          CustomHeaderContainer(),
          SizedBox(height: 150,),
          Image.asset(
            'assets/images/paymentimage/orderconfirm.png', // Replace with your image URL
            width: 305,
            height: 305,
            fit: BoxFit.contain,
          ),
          SizedBox(height: 20),
          Text(
            'Order Placed',
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: AppTheme.corecolor,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Your Order will be delivered Shortly',
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 14,
              color: AppTheme.grey,
            ),
          ),
          SizedBox(height: 70),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
            child: ElevatedButton(
              onPressed: () {
                Get.to(TrackOrderScreen());
              },
              child: Center(
                child: Text('Track Order', style: TextStyle( fontFamily: 'Roboto',fontWeight: FontWeight.bold,fontSize: 18, color: AppTheme.whitecolor),),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.corecolor,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero, // Box shape with sharp corners
                ),
              ),
            ),
          ),
          SizedBox(height: 20),

          GestureDetector(
            onTap: (){
              Get.to(ShopMoreScreen());

            },
            child: Text(
              'Continue to Browse Menu',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: AppTheme.corecolor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
