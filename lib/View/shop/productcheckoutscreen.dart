import 'package:aanma_nalam/View/shop/checkoutscreen.dart';
import 'package:aanma_nalam/constant/app_theme.dart';
import 'package:aanma_nalam/constant/customnavbar.dart';
import 'package:aanma_nalam/constant/topmenu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ProductCheckoutScreen extends StatefulWidget {
  const ProductCheckoutScreen({super.key});

  @override
  State<ProductCheckoutScreen> createState() => _ProductCheckoutScreenState();
}

class _ProductCheckoutScreenState extends State<ProductCheckoutScreen> {
  int quantity = 1;

  bool _isClicked = false;

  // Function to increment quantity
  void _incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  // Function to decrement quantity but not allow negative values
  void _decrementQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomHeaderContainer(),

          Padding(
            padding:
            const EdgeInsets.only(left: 16.0, right: 16.0,top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    BackButtonContainer(),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/images/shoplogo.png', // Ensure correct path
                            width: 140,
                            height: 60,
                            color: AppTheme.corecolor,
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Row(
                      children: [

                        SizedBox(width: 10,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: 27, // Adjust height
                            width: 25,
                            child: Image.asset(
                              'assets/images/icons/Heart icon.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: 27, // Adjust height
                            width: 25, // Adjust width
                            child: Image.asset(
                              'assets/images/icons/Bag icon.png',
                              fit: BoxFit
                                  .contain, // This ensures the image fits within the box
                            ),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      right: 49,
                      bottom: 21,
                      child: Container(
                        width: 20,
                        height: 20,
                        padding: EdgeInsets.all(1.0),
                        decoration: BoxDecoration(
                          color: AppTheme.corecolor,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                            child: Text("10",
                                style: TextStyle(color: AppTheme.whitecolor))),
                      ),
                    ),
                    Positioned(
                      right: 1,
                      bottom: 21,
                      child: Container(
                        width: 20,
                        height: 20,
                        padding: EdgeInsets.all(1.0),
                        decoration: BoxDecoration(
                          color: AppTheme.corecolor,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                            child: Text("5",
                                style: TextStyle(color: AppTheme.whitecolor))),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),


          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16, top: 10),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey, // Outline border color
                          width: 0.9, // Thinner border width (adjust this value as needed)
                        ),
                        borderRadius: BorderRadius.circular(8.0), // Rounded corners
                      ),
                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Pincode Text and Value
                          Row(
                            children: [
                              Text(
                                'Select Pincode: ',
                                style: TextStyle(
                                  color: AppTheme.grey,
                                  fontSize: Get.width * 0.035, // Responsive font size
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: Get.width * 0.03), // Responsive left padding
                                child: Text(
                                  '686611',
                                  style: TextStyle(
                                    color: AppTheme.grey,
                                    fontSize: Get.width * 0.035, // Responsive font size
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // Change Pincode Button
                          GestureDetector(
                            onTap: () {
                              // Action when change pincode is clicked
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: Get.width * 0.03, // Responsive horizontal padding
                                vertical: Get.height * 0.01, // Responsive vertical padding
                              ),
                              decoration: BoxDecoration(
                                color: Colors.transparent, // Background color
                                border: Border.all(
                                  color: AppTheme.corecolor, // Border color
                                  width: Get.width * 0.0025, // Responsive border width
                                ),
                                borderRadius: BorderRadius.circular(Get.width * 0.02), // Responsive border radius
                              ),
                              child: Text(
                                'Change Pincode',
                                style: TextStyle(
                                  color: AppTheme.corecolor,
                                  fontSize: Get.width * 0.035, // Responsive font size
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),



                      /*Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Pincode Text and Value
                          Row(
                            children: [
                              Text(
                                'Select Pincode: ',
                                style: TextStyle(
                                  color: AppTheme.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Text(
                                  '686611',
                                  style: TextStyle(
                                    color: AppTheme.grey,
                                    fontSize: 14,
                                      fontWeight: FontWeight.w700
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // Change Pincode Button
                          GestureDetector(
                            onTap: () {
                              // Action when change pincode is clicked
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0), // Adjust padding for button size
                              decoration: BoxDecoration(
                                color: Colors.transparent, // Background color
                                border: Border.all(
                                  color: AppTheme.corecolor, // Border color
                                  width: 0.5, // Thinner border width (adjust this value as needed)
                                ),
                                borderRadius: BorderRadius.circular(8.0), // Rounded corners
                              ),
                              child: Text(
                                'Change Pincode',
                                style: TextStyle(
                                  color: AppTheme.corecolor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),*/


                    ),
                  ),
                  SizedBox(height: 15),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: Get.width * 0.04), // Responsive horizontal padding
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: Get.width * 0.04, // Responsive inner horizontal padding
                        vertical: Get.height * 0.01,  // Responsive inner vertical padding
                      ),
                      width: double.infinity,
                      height: Get.height * 0.4, // Dynamic height based on screen height
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey, // Outline border color
                          width: 0.9,         // Outline border width
                        ),
                        borderRadius: BorderRadius.circular(Get.width * 0.02), // Responsive rounded corners
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              // Product Image
                              Image.asset(
                                'assets/images/icons/Rectangle 233.png',
                                height: Get.height * 0.18, // Responsive height
                                width: Get.width * 0.35,  // Responsive width
                                fit: BoxFit.fill,
                              ),
                              Padding(
                                padding: EdgeInsets.all(Get.width * 0.03), // Responsive padding
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Product Name
                                    Text(
                                      'Personalised Frame',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: Get.width * 0.04, // Responsive font size
                                        color: AppTheme.grey,
                                      ),
                                    ),
                                    SizedBox(height: Get.height * 0.005), // Responsive vertical spacing

                                    // Courier Product Button
                                    GestureDetector(
                                      onTap: () {
                                        // Action when button is clicked
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: Get.width * 0.04, // Responsive horizontal padding
                                          vertical: Get.height * 0.007, // Responsive vertical padding
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          border: Border.all(
                                            color: Colors.grey,
                                            width: Get.width * 0.002, // Responsive border width
                                          ),
                                          borderRadius: BorderRadius.circular(Get.width * 0.035), // Responsive border radius
                                        ),
                                        child: Text(
                                          'Courier Product',
                                          style: TextStyle(
                                            color: Colors.grey[600],
                                            fontSize: Get.width * 0.035, // Responsive font size
                                          ),
                                        ),
                                      ),
                                    ),

                                    SizedBox(height: Get.height * 0.01), // Responsive vertical spacing

                                    // Pricing Row
                                    Row(
                                      children: [
                                        Text(
                                          '₹ 259',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: AppTheme.amountcolor,
                                            fontFamily: 'Roboto',
                                            fontSize: Get.width * 0.04, // Responsive font size
                                          ),
                                        ),
                                        SizedBox(width: Get.width * 0.02), // Responsive horizontal spacing
                                        Text(
                                          "₹259",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: AppTheme.amountcolor,
                                            fontFamily: 'Roboto',
                                            fontSize: Get.width * 0.04, // Responsive font size
                                            decoration: TextDecoration.lineThrough,
                                          ),
                                        ),
                                        SizedBox(width: Get.width * 0.02),
                                        Text(
                                          '(36% off)',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: AppTheme.greentextcolor,
                                            fontFamily: 'Roboto',
                                            fontSize: Get.width * 0.035, // Responsive font size
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: Get.height * 0.015), // Responsive vertical spacing

                                    // Quantity Row
                                    Row(
                                      children: [
                                        Text(
                                          'Qty:',
                                          style: TextStyle(
                                            fontSize: Get.width * 0.03, // Responsive font size
                                            fontWeight: FontWeight.bold,
                                            color: AppTheme.grey,
                                          ),
                                        ),
                                        SizedBox(width: Get.width * 0.02), // Responsive horizontal spacing
                                        // Decrement Button
                                        Container(
                                          height: Get.height * 0.03, // Responsive height
                                          width: Get.width * 0.06,   // Responsive width
                                          decoration: BoxDecoration(
                                            border: Border.all(color: Colors.grey),
                                            //borderRadius: BorderRadius.circular(Get.width * 0.015), // Responsive radius
                                          ),
                                          child: IconButton(
                                            padding: EdgeInsets.zero,
                                            icon: Icon(Icons.remove, size: Get.width * 0.04, color: AppTheme.blackcolor),
                                            onPressed: _decrementQuantity,
                                          ),
                                        ),
                                        SizedBox(width: Get.width * 0.02), // Responsive horizontal spacing
                                        // Quantity Display
                                        Container(
                                          height: Get.height * 0.03,
                                          width: Get.width * 0.06,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: Colors.grey),
                                            // borderRadius: BorderRadius.circular(Get.width * 0.015),
                                          ),
                                          child: Center(
                                            child: Text(
                                              '$quantity',
                                              style: TextStyle(
                                                fontSize: Get.width * 0.035, // Responsive font size
                                                fontWeight: FontWeight.bold,
                                                color: AppTheme.grey,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: Get.width * 0.02),
                                        // Increment Button
                                        Container(
                                          height: Get.height * 0.03,
                                          width: Get.width * 0.06,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: Colors.grey),
                                            // borderRadius: BorderRadius.circular(Get.width * 0.015),
                                          ),
                                          child: IconButton(
                                            padding: EdgeInsets.zero,
                                            icon: Icon(Icons.add, size: Get.width * 0.04, color: AppTheme.blackcolor),
                                            onPressed: _incrementQuantity,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: Get.height * 0.02), // Responsive vertical spacing
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),


                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Left Column
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Type caption text:',
                                    style: TextStyle(
                                      color: AppTheme.grey,
                                      fontSize: Get.width * 0.035, // Responsive font size
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: Get.height * 0.02), // Responsive vertical spacing
                                  Text(
                                    'Estimated Delivery:',
                                    style: TextStyle(
                                      color: AppTheme.grey,
                                      fontSize: Get.width * 0.035,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: Get.height * 0.02),
                                  Text(
                                    'Shipping Method:',
                                    style: TextStyle(
                                      color: AppTheme.grey,
                                      fontSize: Get.width * 0.035,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              // Right Column
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: Get.width * 0.03), // Responsive padding
                                    child: Text(
                                      'GEED WERUTS COTED THETS',
                                      style: TextStyle(
                                        color: AppTheme.bluecolor,
                                        fontSize: Get.width * 0.033, // Responsive font size
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: Get.height * 0.02),
                                  Padding(
                                    padding: EdgeInsets.only(left: Get.width * 0.03),
                                    child: Text(
                                      '24-Sep',
                                      style: TextStyle(
                                        color: AppTheme.grey,
                                        fontSize: Get.width * 0.035,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: Get.height * 0.02),
                                  Padding(
                                    padding: EdgeInsets.only(left: Get.width * 0.03),
                                    child: Text(
                                      'Courier',
                                      style: TextStyle(
                                        color: AppTheme.grey,
                                        fontSize: Get.width * 0.033,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),








                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Image.asset(
                                'assets/images/icons/DELETE ICON.png',
                                // Ensure correct path
                                width: 20,
                                height: 20,
                                color: AppTheme.bluecolor,
                                // color: Colors.blue,
                              ),
                              SizedBox(width: 5),
                              Text('Remove', style: TextStyle(
                                  color: AppTheme.bluecolor,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold
                              )),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),


                /*  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      width: double.infinity,
                      height: 320,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey, // Outline border color
                          width: 0.9,         // Outline border width
                        ),
                        borderRadius: BorderRadius.circular(8.0), // Rounded corners
                      ),

                    ),
                  ),*/
                  SizedBox(height: 15),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 35,
                            padding: EdgeInsets.symmetric(vertical: 8),
                            decoration: BoxDecoration(
                              color: Colors.redAccent,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'Available Quiz Coins',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Column(
                              children: [
                                SizedBox(height: 5),
                                Image.asset(
                                  'assets/images/icons/Coins Icons.png', // Your coin image asset path
                                  width: 40,
                                  height: 40,
                                  color: Colors.amber[700],
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'Your Available Quiz Coins:1000',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Total Amount ',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    Text(
                                      '  ₹ 100',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'Roboto',
                                          color: AppTheme.blackcolor,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                    child: Row(
                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                  children: [
                                                                    ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppTheme.grey,
                                      minimumSize: Size(100, 33),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    child: Text('Refresh', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15, color: AppTheme.whitecolor),),
                                                                    ),
                                                                    ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        _isClicked = !_isClicked; // Toggle the state
                                      });
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: _isClicked ? AppTheme.corecolor : AppTheme.greentextcolor,
                                      minimumSize: Size(100, 33),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    child: Text('Apply', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15, color: AppTheme.whitecolor),),
                                                                    ),
                                                                  ],
                                                                ),
                                  ),
                                SizedBox(height: 10),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey.shade300),
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
                    ),
                  ),

                ],
              ),
            ),
          ),

          SizedBox(
            height: 10,
          ),


          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
            child: ElevatedButton(
              onPressed: () {
                Get.to(Checkoutscreen());
              },
              child: Center(
                child: Text('Continue To Checkout', style: TextStyle(fontSize: 13, color: AppTheme.whitecolor),),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.greenbuttoncolor,
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








