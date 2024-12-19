import 'package:aanma_nalam/constant/app_theme.dart';
import 'package:aanma_nalam/constant/topmenu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class DeliveryLocationScreen extends StatefulWidget {
  const DeliveryLocationScreen({super.key});

  @override
  State<DeliveryLocationScreen> createState() => _DeliveryLocationScreenState();
}

class _DeliveryLocationScreenState extends State<DeliveryLocationScreen> {
  final FocusNode _focusNode = FocusNode(); // Create a FocusNode
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _focusNode.dispose(); // Dispose FocusNode
    _controller.dispose(); // Dispose TextEditingController
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomHeaderContainer(),
          Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
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
                          Text(
                            "Select Delivery Location",
                            style: TextStyle(
                                fontSize: 16,
                                // Example size, replace with AppTheme
                                fontWeight: FontWeight.bold,
                                color: AppTheme
                                    .grey // Replace with AppTheme.coretextcolor
                            ),
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

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: 27, // Adjust height
                            width: 26,
                            child: Image.asset(
                              'assets/images/icons/Heart icon.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: 27, // Adjust height
                            width: 26, // Adjust width
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
                      right: 50,
                      bottom: 22,
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
                      right: 3,
                      bottom: 22,
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
          // Pincode input field
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: GestureDetector(
              onTap: () {
                _focusNode.requestFocus(); // Focus on the TextField
              },
              child: Container(
                height: 60, // Set the desired height here
                padding: EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/icons/location.png',
                      height: 27,
                      width: 30,
                      fit: BoxFit.contain,
                      color: AppTheme.coretextcolor, // Replace with your text color
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        focusNode: _focusNode, // Assign the FocusNode
                        keyboardType: TextInputType.number, // Set the keyboard type to number
                        decoration: InputDecoration(
                          hintText: 'Enter Delivery Pincode',
                          hintStyle: TextStyle(
                              fontSize: 16,
                              // Example size, replace with AppTheme
                              fontWeight: FontWeight.bold,
                              color: AppTheme
                                  .grey
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Image.asset(
                      'assets/images/icons/Search icon.png',
                      height: 27,
                      width: 30,
                    ),
                  ],
                ),
              ),
            ),
          ),

          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Don't Know Pincode?",
              style: TextStyle(
                color: AppTheme
                    .corecolor,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Spacer(),
          // Custom Keypad

        ],
      ),
    );
  }
}






