

import 'dart:ui';

import 'package:aanma_nalam/View/shop/paymentprocessingscreen.dart';
import 'package:aanma_nalam/constant/app_theme.dart';
import 'package:aanma_nalam/constant/topmenu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class OnlinePaymentScreen extends StatefulWidget {
  const OnlinePaymentScreen({super.key});

  @override
  State<OnlinePaymentScreen> createState() => _OnlinePaymentScreenState();
}

class _OnlinePaymentScreenState extends State<OnlinePaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: [
          CustomHeaderContainer(),


          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [

                    Padding(
                      padding:
                      const EdgeInsets.only(top: 16.0, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              BackButtonContainer(),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Preferred Payment',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: AppTheme.grey,
                          ),
                        ),

                      ],
                    ),

                    SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {
                        Get.to(PaymentProcessingScreen(onlinepayment: "phonepay"));
                      },
                      child: Container(
                        height: 57,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.15), // Reduce opacity for a lighter shadow
                              spreadRadius: 1, // Smaller spread
                              blurRadius: 3, // Smaller blur for less softness
                              offset: Offset(0, 1), // Smaller offset for less pronounced shadow
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              SizedBox(width: 5,),
                              Image.asset(
                                'assets/images/paymentimage/phonepay.png',
                                fit: BoxFit.contain, // Ensures the image covers the entire area
                                width: 40.0, // Set the width
                                height: 40.0, // Set the height
                              ),
                              SizedBox(width: 10,),
                              Text(
                                'Phone Pay',
                                style: TextStyle(
                                  //fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: AppTheme.grey,
                                ),
                              ),
                            ],
                          ),
                        ),


                        /*ListTile(
                          leading: CircleAvatar(
                            backgroundImage: AssetImage('assets/images/paymentimage/phonepay.png' ),
                          ),
                          title: Text(
                            'Phone Pay',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: AppTheme.grey,
                            ),
                          ),
                          tileColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),*/
                      ),
                    ),

                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'UPI',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: AppTheme.grey,
                          ),
                        ),

                      ],
                    ),
                    SizedBox(height: 10),
                    GestureDetector(
                      onTap: (){
                        Get.to(PaymentProcessingScreen(onlinepayment: "phonepay",));
                      },
                      child: Container(
                        height: 57,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.15), // Reduce opacity for a lighter shadow
                              spreadRadius: 1, // Smaller spread
                              blurRadius: 3, // Smaller blur for less softness
                              offset: Offset(0, 1), // Smaller offset for less pronounced shadow
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              SizedBox(width: 5,),
                              Image.asset(
                                'assets/images/paymentimage/phonepay.png',
                                fit: BoxFit.contain, // Ensures the image covers the entire area
                                width: 40.0, // Set the width
                                height: 40.0, // Set the height
                              ),
                              SizedBox(width: 10,),
                              Text(
                                'Phone Pay',
                                style: TextStyle(
                                  //fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: AppTheme.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                       /* ListTile(
                          leading: CircleAvatar(
                            backgroundImage: AssetImage('assets/images/paymentimage/phonepay.png'),
                          ),
                          title: Text('Phone Pay',  style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: AppTheme.grey,
                          )),
                          tileColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),*/


                      ),
                    ),
                    SizedBox(height: 3),
                    GestureDetector(
                      onTap: (){
                        Get.to(PaymentProcessingScreen(onlinepayment: "gpay",));
                      },
                      child: Container(
                        height: 57,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.15), // Reduce opacity for a lighter shadow
                              spreadRadius: 1, // Smaller spread
                              blurRadius: 3, // Smaller blur for less softness
                              offset: Offset(0, 1), // Smaller offset for less pronounced shadow
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              SizedBox(width: 5,),
                              Image.asset(
                                'assets/images/paymentimage/gpay.png',
                                fit: BoxFit.contain, // Ensures the image covers the entire area
                                width: 40.0, // Set the width
                                height: 40.0, // Set the height
                              ),
                              SizedBox(width: 10,),
                              Text(
                                'Google Pay',
                                style: TextStyle(
                                  //fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: AppTheme.grey,
                                ),
                              ),
                            ],
                          ),
                        ),

                      ),
                    ),
                    SizedBox(height: 3),
                    Container(
                      height: 57,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.15), // Reduce opacity for a lighter shadow
                            spreadRadius: 1, // Smaller spread
                            blurRadius: 3, // Smaller blur for less softness
                            offset: Offset(0, 1), // Smaller offset for less pronounced shadow
                          ),
                        ],
                      ),
                      child:  Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            SizedBox(width: 5,),
                            Image.asset(
                              'assets/images/paymentimage/basil_add-outline.png',
                              fit: BoxFit.contain, // Ensures the image covers the entire area
                              width: 40.0, // Set the width
                              height: 40.0, // Set the height
                            ),
                            SizedBox(width: 10,),
                            Text(
                              'Add new UPI ID',
                              style: TextStyle(
                                //fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: AppTheme.grey,
                              ),
                            ),
                          ],
                        ),
                      ),

                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Card or Debit Cards',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: AppTheme.grey,
                          ),
                        ),

                      ],
                    ),

                    SizedBox(height: 10),
                    Container(
                      height: 57,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.15), // Reduce opacity for a lighter shadow
                            spreadRadius: 1, // Smaller spread
                            blurRadius: 3, // Smaller blur for less softness
                            offset: Offset(0, 1), // Smaller offset for less pronounced shadow
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            SizedBox(width: 5,),
                            Image.asset(
                              'assets/images/paymentimage/visa.png',
                              fit: BoxFit.contain, // Ensures the image covers the entire area
                              width: 40.0, // Set the width
                              height: 40.0, // Set the height
                            ),
                            SizedBox(width: 10,),
                            Text(
                              'XXXX XXXX XX23 45678',
                              style: TextStyle(
                                //fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: AppTheme.grey,
                              ),
                            ),
                          ],
                        ),
                      ),



                    ),
                    SizedBox(height: 3),
                    Container(
                      height: 57,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.15), // Reduce opacity for a lighter shadow
                            spreadRadius: 1, // Smaller spread
                            blurRadius: 3, // Smaller blur for less softness
                            offset: Offset(0, 1), // Smaller offset for less pronounced shadow
                          ),
                        ],
                      ),
                      child:
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            SizedBox(width: 5,),
                            Image.asset(
                              'assets/images/paymentimage/basil_add-outline.png',
                              fit: BoxFit.contain, // Ensures the image covers the entire area
                              width: 40.0, // Set the width
                              height: 40.0, // Set the height
                            ),
                            SizedBox(width: 10,),
                            Text(
                              'Add new UPI ID',
                              style: TextStyle(
                                //fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: AppTheme.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'More Payment Options',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: AppTheme.grey,
                          ),
                        ),

                      ],
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 57,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.15), // Reduce opacity for a lighter shadow
                            spreadRadius: 1, // Smaller spread
                            blurRadius: 3, // Smaller blur for less softness
                            offset: Offset(0, 1), // Smaller offset for less pronounced shadow
                          ),
                        ],
                      ),
                      child:
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 8, right: 8, left: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                //SizedBox(width: 2,),
                                Image.asset(
                                  'assets/images/paymentimage/Delivery icon.png',
                                  fit: BoxFit.cover, // Ensures the image covers the entire area
                                  width: 55.0, // Set the width
                                  height: 50.0, // Set the height
                                ),
                                SizedBox(width: 8,),
                                Text(
                                  'Cash on Delivery',
                                  style: TextStyle(
                                    //fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: AppTheme.grey,
                                  ),
                                ),
                              ],
                            ),

                            Padding(
                              padding: const EdgeInsets.only(right: 15.0),
                              child: Icon( color: AppTheme.grey,Icons.arrow_forward_ios, size: 18),
                            ),
                          ],
                        ),
                      ),


                    ),
                    SizedBox(height: 3),
                    Container(
                      height: 57,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.15), // Reduce opacity for a lighter shadow
                            spreadRadius: 1, // Smaller spread
                            blurRadius: 3, // Smaller blur for less softness
                            offset: Offset(0, 1), // Smaller offset for less pronounced shadow
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SizedBox(width: 5,),
                                Image.asset(
                                  'assets/images/paymentimage/tower.png',
                                  fit: BoxFit.contain, // Ensures the image covers the entire area
                                  width: 40.0, // Set the width
                                  height: 40.0, // Set the height
                                ),
                                SizedBox(width: 10,),
                                Text(
                                  'Networking',
                                  style: TextStyle(
                                    //fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: AppTheme.grey,
                                  ),
                                ),
                              ],
                            ),

                            Padding(
                              padding: const EdgeInsets.only(right: 15.0),
                              child: Icon( color: AppTheme.grey,Icons.arrow_forward_ios, size: 18),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 3),
                    Container(
                      height: 57,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.15), // Reduce opacity for a lighter shadow
                            spreadRadius: 1, // Smaller spread
                            blurRadius: 3, // Smaller blur for less softness
                            offset: Offset(0, 1), // Smaller offset for less pronounced shadow
                          ),
                        ],
                      ),
                      child:
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            SizedBox(width: 5,),
                            Image.asset(
                              'assets/images/paymentimage/basil_add-outline.png',
                              fit: BoxFit.contain, // Ensures the image covers the entire area
                              width: 40.0, // Set the width
                              height: 40.0, // Set the height
                            ),
                            SizedBox(width: 10,),
                            Text(
                              'Add new UPI ID',
                              style: TextStyle(
                                //fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: AppTheme.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),




        ],
      ),
    );
  }
}



