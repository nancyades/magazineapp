
import 'package:aanma_nalam/View/shop/paymentscreen.dart';
import 'package:aanma_nalam/constant/app_theme.dart';
import 'package:aanma_nalam/constant/customnavbar.dart';
import 'package:aanma_nalam/constant/topmenu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Checkoutscreen extends StatefulWidget {
  const Checkoutscreen({super.key});

  @override
  State<Checkoutscreen> createState() => _CheckoutscreenState();
}

class _CheckoutscreenState extends State<Checkoutscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomHeaderContainer(),
          Padding(
            padding:
            const EdgeInsets.symmetric(vertical: 15.0, horizontal: 16),
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

          // Saved Addresses Section
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Saved Addresses',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                            color: AppTheme.grey,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(Icons.add_circle_outline, color: Colors.red, size: 18,),
                            SizedBox(width: 5),
                            Text(
                              'Add New Addresses',
                              style: TextStyle(
                                fontSize: 13,
                                color: AppTheme.corecolor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 35),
                    AddressCard(),
            
                    SizedBox(height: 20),
            
                    // Shopping Cart Section
                    Text(
                      'Shopping Cart (1)',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: AppTheme.grey,
                      ),
                    ),
                    SizedBox(height: 10),
                    ShoppingCartItem(),
            
                    SizedBox(height: 20),
                    PriceDetails(),
                    SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Delivery in 2 Hours
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/track.png', // Ensure correct path
                            width: Get.width * 0.1, // Responsive width
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: Get.width * 0.02),
                            child: Text(
                              'Delivery In\n2 Hours',
                              style: TextStyle(
                                fontSize: Get.width * 0.025, // Responsive font size
                                color: AppTheme.grey,
                              ),
                            ),
                          ),
                        ],
                      ),

                      // Trusted By Millions
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/handshake.png', // Ensure correct path
                            width: Get.width * 0.1, // Responsive width
                          ),
                          SizedBox(height: Get.height * 0.005), // Responsive spacing
                          Padding(
                            padding: EdgeInsets.only(left: Get.width * 0.02),
                            child: Text(
                              'Trusted\nBy Millions',
                              style: TextStyle(
                                fontSize: Get.width * 0.025, // Responsive font size
                                color: AppTheme.grey,
                              ),
                            ),
                          ),
                        ],
                      ),

                      // Services in 6000 Cities
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/tower.png', // Ensure correct path
                            width: Get.width * 0.15, // Responsive width
                          ),
                          SizedBox(height: Get.height * 0.005), // Responsive spacing
                          Padding(
                            padding: EdgeInsets.only(left: Get.width * 0.02),
                            child: Text(
                              'Services\nin 6000 Cities',
                              style: TextStyle(
                                fontSize: Get.width * 0.025, // Responsive font size
                                color: AppTheme.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),


                  /*Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/images/track.png', // Ensure correct path
                              width: 50,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Text('Delivery In\n2 Hours',  style: TextStyle(fontSize: 11, color: AppTheme.grey)),
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            Image.asset(
                              'assets/images/handshake.png', // Ensure correct path
                              width: 40,
                            ),
                            SizedBox(height: 5),
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Text('Trusted\nBy Millions',  style: TextStyle(fontSize: 11, color: AppTheme.grey)),
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            Image.asset(
                              'assets/images/tower.png', // Ensure correct path
                              width: 60,
                            ),
                            SizedBox(height: 5),
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Text('Services\nin 6000 Cities',  style: TextStyle(fontSize: 11, color: AppTheme.grey)),
                            ),
                          ],
                        ),
                      ],
                    ),*/
            
                    SizedBox(height: 20),
            
                  ],
                ),
              ),
            ),
          ),



          // Continue Button

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
            child: ElevatedButton(
              onPressed: () {
                Get.to(paymentPage());
              },
              child: Center(
                child: Text('Continue', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13, color: AppTheme.whitecolor),),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero, // Box shape with sharp corners
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

// Address Card Widget
class AddressCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        color: AppTheme.container1bg,
        borderRadius: BorderRadius.circular(10),
       /* boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 2), // Shadow position
          ),
        ],*/
      ),
      width: double.infinity, // Ensure it takes full width
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity, // Matching width for both containers
            padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 16),
            decoration: BoxDecoration(
              color: AppTheme.container1bg,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey.shade300, width: 1),
            ),
            child: Row(
              children: [
                Text(
                  'Aravinth',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppTheme.grey,
                    fontWeight: FontWeight.w700
                  ),
                ),
                Spacer(),
                Text(
                  'Home',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppTheme.grey,
                      fontWeight: FontWeight.w700
                  ),
                ),
              ],
            ),
          ),


          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                    '75, th street, MMDA, TNHB Layout, Chennai, Mathur, Tamil Nadu 600068', style: TextStyle(
                  fontSize: 13,
                  color: AppTheme.grey,
                ),),
                SizedBox(height: 45),
                Row(
                  children: [
                    Image.asset(
                      'assets/images/icons/carbon_edit.png',
                      width: 18,
                      height: 18,
                      color: AppTheme.grey,
                    ),
                    SizedBox(width: 5),
                    Text('Edit Address', style: TextStyle(
                      fontSize: 13,
                      color: AppTheme.grey,
                    ),),
                    Spacer(),


                    Image.asset(
                      'assets/images/icons/DELETE ICON.png',
                      width: 18,
                      height: 18,
                      color: AppTheme.grey,
                    ),
                    SizedBox(width: 5),
                    Text('Remove', style: TextStyle(
                      fontSize: 13,
                      color: AppTheme.grey,
                    ),),
                  ],
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}

// Shopping Cart Item Widget
class ShoppingCartItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
       /* boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],*/
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image placeholder
            Container(
              width: 107,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[200],
              ),
              child: Image.asset(
                'assets/images/icons/Rectangle 233.png',
                fit: BoxFit.fill,),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      'Personalised Frame',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: Get.width * 0.04, // Responsive font size
                        color: AppTheme.grey,
                      ),
                    ),
                    SizedBox(height: Get.height * 0.01), // Responsive spacing

                    // Estimated Delivery Row
                    Row(
                      children: [
                        Text(
                          'Estimated Delivery:',
                          style: TextStyle(
                            color: AppTheme.grey,
                            fontSize: Get.width * 0.035,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: Get.width * 0.02),
                          child: Text(
                            '24-Sep',
                            style: TextStyle(
                              color: AppTheme.greentextcolor,
                              fontSize: Get.width * 0.035,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: Get.height * 0.015),

                    // Courier Product Button
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Action when button is clicked
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: Get.width * 0.04,
                              vertical: Get.height * 0.005,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: Border.all(
                                color: Colors.grey,
                                width: 0.7,
                              ),
                              borderRadius: BorderRadius.circular(14.0),
                            ),
                            child: Text(
                              'Courier Product',
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: Get.width * 0.033,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: Get.height * 0.02),

                    // Price and Remove Button Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Price
                        Text(
                          '₹ 259',
                          style: TextStyle(
                            color: AppTheme.amountcolor,
                            fontFamily: 'Roboto',
                            fontSize: Get.width * 0.045, // Responsive font size
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // Remove Icon and Text
                        Padding(
                          padding: EdgeInsets.only(top: Get.height * 0.02),
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/images/icons/DELETE ICON.png',
                                width: Get.width * 0.05, // Responsive icon size
                                height: Get.width * 0.05,
                                color: AppTheme.bluecolor,
                              ),
                              SizedBox(width: Get.width * 0.01),
                              Text(
                                'Remove',
                                style: TextStyle(
                                  color: AppTheme.bluecolor,
                                  fontSize: Get.width * 0.033,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),



                /*   Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Personalised Frame',
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15, color: AppTheme.grey),
                    ),
                    SizedBox(height:  4),

                    Row(
                      children: [
                        Text('Estimated Delivery: ', style: TextStyle(color: AppTheme.grey, fontSize: 14,fontWeight: FontWeight.bold)),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text('24-Sep', style: TextStyle(color: AppTheme.greentextcolor, fontSize: 14,fontWeight: FontWeight.bold)),
                        ),

                      ],
                    ),
                    SizedBox(height: 7),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Action when button is clicked
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0), // Padding inside the container
                            decoration: BoxDecoration(
                              color: Colors.transparent, // Background color
                              border: Border.all(
                                color: Colors.grey, // Border color
                                width: 0.7,         // Border width
                              ),
                              borderRadius: BorderRadius.circular(14.0), // Rounded corners
                            ),
                            child: Text(
                              'Courier Product',
                              style: TextStyle(
                                color: Colors.grey[600], // Text color
                                fontSize: 14.0,          // Font size
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                  SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '₹ 259',
                          style: TextStyle(
                            color: AppTheme.amountcolor,
                            fontFamily: 'Roboto',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Image.asset(
                                'assets/images/icons/DELETE ICON.png',
                                // Ensure correct path
                                width: 20,
                                height: 20,
                                color: AppTheme.bluecolor,
                              ),
                              SizedBox(width: 2),
                              Text('Remove', style: TextStyle(
                                  color: AppTheme.bluecolor,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold
                              )),
                            ],
                          ),
                        )
                      ],
                    ),

                  ],
                ),*/


              ),
            ),
          ],
        ),
      ),
    );

  }
}

// Price Details Widget
class PriceDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
        /*boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],*/
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Price Details (1 Items)',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppTheme.grey,
            ),
          ),
          SizedBox(height: 15),

          Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'MRP Total',
                    style: TextStyle(fontSize: 13, color: AppTheme.grey),
                  ),
                  SizedBox(height: 15),
                  Text(
                    'MRP Discount',
                    style: TextStyle(fontSize: 13, color: AppTheme.grey),
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Delivery Charge',
                    style: TextStyle(fontSize: 13, color: AppTheme.grey),
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Text(
                        'Convenience Charge',
                        style:
                        TextStyle(fontSize: 13, color: AppTheme.grey),
                      ),
                      SizedBox(width: 5,),
                      Image.asset(
                        'assets/images/icons/iround.png',
                        // Ensure correct path
                        width: 15,
                        height: 15,
                        // color: Colors.blue,
                      ),
                    ],
                  ),
                ],
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 40.0),
                    child: Text(
                      '₹ 259',
                      style: TextStyle(fontFamily: 'Roboto',fontSize: 13, color: AppTheme.amountcolor),
                    ),
                  ),
                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.only(left: 40.0),
                    child: Text(
                      '-₹ 259',
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 13,
                          color: AppTheme.amountcolor
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.only(left: 40.0),
                    child: Text(
                      'Free',
                      style: TextStyle(fontSize: 13, color: AppTheme.amountcolor),
                    ),
                  ),
                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.only(left: 40.0),
                    child: Text(
                      '₹ 5',
                      style: TextStyle(fontFamily: 'Roboto', fontSize: 13, color: AppTheme.amountcolor),
                    ),
                  ),

                ],
              )
            ],
          ),
          SizedBox(
            height:  15,
          ),
          CustomPaint(
            size: Size(double.infinity, 1),
            painter: DashLinePainter(),
          ),
          SizedBox(height: 15),
          Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total Amount',
                    style: TextStyle(  color: AppTheme.grey, fontWeight: FontWeight.bold,
                      fontSize: 14,),
                  ),
                ],
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 110.0),
                    child: Text(
                      '₹ 259',
                      style: TextStyle(color: AppTheme.amountcolor,fontFamily: 'Roboto', fontWeight: FontWeight.bold,
                        fontSize: 14,),
                    ),
                  ),

                ],
              )
            ],
          ),

          SizedBox(height: 15),
          CustomPaint(
            size: Size(double.infinity, 1),
            painter: DashLinePainter(),
          ),
          SizedBox(height: 25),

          Text(
            'You will save ₹ 14 on this order',
            style: TextStyle( fontWeight: FontWeight.bold,
                fontSize: 15,color: AppTheme.greentextcolor),
          ),
          SizedBox(height: 20),

        ],
      ),
    );

  }
}









