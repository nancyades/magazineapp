import 'package:aanma_nalam/View/shop/orderconfirmationscreen.dart';
import 'package:aanma_nalam/constant/app_theme.dart';
import 'package:aanma_nalam/constant/topmenu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class PaymentProcessingScreen extends StatefulWidget {
  String? onlinepayment;
  PaymentProcessingScreen({super.key, this.onlinepayment});

  @override
  State<PaymentProcessingScreen> createState() => _PaymentProcessingScreenState();
}

class _PaymentProcessingScreenState extends State<PaymentProcessingScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      _showPaymentSuccessDialog();
    });
  }

  void _showPaymentSuccessDialog() {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async {
            Navigator.of(context).pop();
            return true;
          },
          child: AlertDialog(
            backgroundColor: AppTheme.whitecolor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            content: Container(
              width: MediaQuery.of(context).size.width * 1,
              height: MediaQuery.of(context).size.height * 0.57,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(height: 30),
                  // Adjusted Image
                  Image.asset(
                    'assets/images/paymentimage/success.png',
                    width: 100, // Increased width
                    height: 100, // Increased height
                    fit: BoxFit.contain,
                  ),
                  SizedBox(height: 20),
                  // Payment Success Text
                  Text(
                    'Payment Success',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.corecolor,
                    ),
                  ),
                  SizedBox(height: 20),
                  // Payment Details
                  _buildPaymentDetailRow('Paid:', '250'),
                  SizedBox(height: 10),
                  _buildPaymentDetailRow('Date:', 'May 10, 2023'),
                  SizedBox(height: 10),
                  _buildPaymentDetailRow(
                    'Through:',
                    widget.onlinepayment == 'phonepay' ? 'Phone Pay' : 'Google Pay',
                  ),
                  SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: () {
                      Get.to(OrderConfirmationScreen());
                    },
                    child: Center(
                      child: Text(
                        'Track Order',
                        style: TextStyle(fontSize: 16, color: AppTheme.whitecolor),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.corecolor,
                      minimumSize: Size(30, 46),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ).then((_) {
      Navigator.of(context).pop();
    });
  }


  // Helper function to create payment detail rows
  Widget _buildPaymentDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 18,
                      color: AppTheme.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    value,
                    style: TextStyle(
                      color: AppTheme.grey,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.whitecolor,
      body: Column(
        children: [
          CustomHeaderContainer(),
          SizedBox(height: 250,),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Phone Pay Logo (Asset Image)
                    Image.asset(
                      widget.onlinepayment == "phonepay" ?
                      'assets/images/paymentimage/phonepay.png' :
                      'assets/images/paymentimage/gpay.png',
                      height: 50,
                      width: 50,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(height: 10),
                    // User's name
                    Text(
                      'Jessica',
                      style: TextStyle(
                        fontSize: 15,
                        color: AppTheme.blackcolor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 15),
                    // 'to' text
                    Text(
                      'to',
                      style: TextStyle(
                        color: AppTheme.grey,
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Image.asset(
                      'assets/images/shoplogo.png', // Ensure correct path
                      width: 140,
                      height: 60,
                      color: AppTheme.corecolor,
                    ),
                    SizedBox(height: 30),
                    // 'Payment is processing' text
                    Text(
                      'Payment is processing',
                      style: TextStyle(
                        fontSize: 20,
                        color: AppTheme.corecolor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    // Instruction text
                    Text(
                      'Open the phonepay app on your phone\nand complete your transaction',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: AppTheme.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

