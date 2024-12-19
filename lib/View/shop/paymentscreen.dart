
import 'package:aanma_nalam/View/shop/onlinepaymentscreen.dart';
import 'package:aanma_nalam/constant/app_theme.dart';
import 'package:aanma_nalam/constant/customnavbar.dart';
import 'package:aanma_nalam/constant/topmenu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class paymentPage extends StatefulWidget {
  const paymentPage({super.key});

  @override
  State<paymentPage> createState() => _paymentPageState();
}

class _paymentPageState extends State<paymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomHeaderContainer(),
          Padding(
            padding:
            const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    BackButtonContainer(),     ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Choose the payment method',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: AppTheme.coretextcolor,
                  ),
                ),

              ],
            ),
          ),
          SizedBox(height: 10,),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 15),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [

                    Stack(
                      children: [
                        
                        Container(
                         // padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          width: double.infinity,
                          height: 282,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey, // Outline border color
                              width: 0.6,         // Outline border width
                            ),
                            borderRadius: BorderRadius.circular(10.0), // Rounded corners
                          ),
                          child: Column(
                            children: [
                             
                        
                              // List of Payment Options
                              PaymentOptionTile(title: '', isFirst: false, isLast: false),
                              PaymentOptionTile(title: 'UPI', isFirst: false, isLast: false),
                              PaymentOptionTile(title: 'Credit/Debit Card', isFirst: false, isLast: false),
                              PaymentOptionTile(title: 'Wallets', isFirst: false, isLast: false),
                              PaymentOptionTile(title: 'Net Banking', isFirst: false, isLast: false),
                              PaymentOptionTile(title: 'Paypal', isFirst: false, isLast: true),
                        
                        
                        
                            ],
                          ),
                        ),
                        Positioned(
                          child:  Container(
                          height: 51,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppTheme.corecolor, // Outline border color
                              width: 1,         // Outline border width
                            ),
                            color: AppTheme.corecolor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0),
                              bottomLeft: Radius.circular(10.0),
                              bottomRight: Radius.circular(10.0),
                            ),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'You Pay',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,

                                ),
                              ),
                              Text(
                                '₹259',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Colors.white,
                                  fontSize: 16,

                                ),
                              ),
                            ],
                          ),
                        ),)
                      ],
                    ),

                    // Header: "You Pay" with red background and top rounded corners





                    //SizedBox(height: 5,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity, // Matching width for both containers
                          padding: EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft:  Radius.zero,
                              bottomRight: Radius.zero,
                            ),
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.grey.withOpacity(0.3), // Bottom border color
                                width: 1.0, // Thickness of the bottom border
                              ),
                            ),

                          ),
                          /*decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey.shade300, width: 1),
                          ),*/
                          child: Row(
                            children: [
                              Text(
                                'Aravinth',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  color: AppTheme.grey,
                                ),
                              ),
                              Spacer(),
                              Text(
                                'Home',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  color: AppTheme.grey,),
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
                                  color: AppTheme.grey // Replace with AppTheme.coretextcolor
                              ),),
                              SizedBox(height: 15),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'Change Address',
                                    style: TextStyle(
                                      color: AppTheme.corecolor,
                                      fontWeight: FontWeight.bold

                                    ),
                                  ),
                                ],
                              ),

                            ],
                          ),
                        ),

                      ],
                    ),
                    SizedBox(height: 7,),

                    Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Colors.grey, // Set the border color here
                          width: 0.7, // Optional: Set the border width
                        ),
                      ),
                      child:  Column(
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
                    ),


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
                    SizedBox(height: 20),
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









// Custom widget for each payment option row using Container
class PaymentOptionTile extends StatelessWidget {
  final String title;
  final bool isFirst;
  final bool isLast;

  PaymentOptionTile({required this.title, this.isFirst = false, this.isLast = false});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
        Get.to(OnlinePaymentScreen());
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: isLast ? Radius.circular(8.0) : Radius.zero,
            bottomRight: isLast ? Radius.circular(8.0) : Radius.zero,
          ),
          border: Border(
            bottom: BorderSide(
              color:isLast ? Colors.transparent : Colors.grey.withOpacity(0.3), // Bottom border color
              width: 1.0, // Thickness of the bottom border
            ),
          ),
          color: Colors.white, // Background color
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 15.0,
                color: AppTheme.grey, // Text color
              ),
            ),
            GestureDetector(
              onTap: (){
                Get.to(OnlinePaymentScreen());
              },
              child: Image.asset(
                'assets/images/icons/updownarrow.png',
                // Ensure correct path
                width: 20,
                height: 20,
              ),
            ),
          ],
        ),
      ),
    );



      /*Container(

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: isLast ? Radius.circular(8.0) : Radius.zero,
          bottomRight: isLast ? Radius.circular(8.0) : Radius.zero,
        ),
        border: Border.all(color: Colors.grey.shade100),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          GestureDetector(
            onTap: (){
              Get.to(OnlinePaymentScreen());
            },
              child: Icon(Icons.arrow_drop_down)),
        ],
      ),
    );*/
  }
}







