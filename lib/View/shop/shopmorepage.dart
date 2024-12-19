import 'dart:ui';

import 'package:aanma_nalam/View/shop/deliverylocation.dart';
import 'package:aanma_nalam/View/shop/singshopimage.dart';
import 'package:aanma_nalam/constant/app_theme.dart';
import 'package:aanma_nalam/constant/topmenu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ShopMoreScreen extends StatefulWidget {
  const ShopMoreScreen({super.key});

  @override
  State<ShopMoreScreen> createState() => _ShopMoreScreenState();
}

class _ShopMoreScreenState extends State<ShopMoreScreen> {
  final List<Map<String, dynamic>> products = [
    {
      'title': 'Personalised Frames 150x300',
      'price': '₹159',
      'oldPrice': '₹259',
      'discount': '36% off',
      'deliveryDate': '22-Sep',
      'image': 'assets/images/icons/cardframes.png',
      'rating': 4.9,
      'reviews': '15 Reviews',
      'isFavorite': false,
      'isshopcard': false,
    },
    {
      'title': 'Geed Weruts Coted Thets',
      'price': '₹159',
      'oldPrice': '₹259',
      'discount': '36% off',
      'deliveryDate': '22-Sep',
      'image': 'assets/images/icons/cardframes.png',
      'rating': 4.9,
      'reviews': '15 Reviews',
      'isFavorite': false,
      'isshopcard': false,
    },
    {
      'title': 'The Sem Youkin',
      'price': '₹159',
      'oldPrice': '₹259',
      'discount': '36% off',
      'deliveryDate': '22-Sep',
      'image': 'assets/images/icons/cardframes.png',
      'rating': 4.9,
      'reviews': '15 Reviews',
      'isFavorite': false,
      'isshopcard': false,
    },
    {
      'title': 'Smile Happy',
      'price': '₹159',
      'oldPrice': '₹259',
      'discount': '36% off',
      'deliveryDate': '22-Sep',
      'image': 'assets/images/icons/cardframes.png',
      'rating': 4.9,
      'reviews': '15 Reviews',
      'isFavorite': false,
      'isshopcard': false,
    },
    {
      'title': 'Smile Happy',
      'price': '₹159',
      'oldPrice': '₹259',
      'discount': '36% off',
      'deliveryDate': '22-Sep',
      'image': 'assets/images/icons/cardframes.png',
      'rating': 4.9,
      'reviews': '15 Reviews',
      'isFavorite': false,
      'isshopcard': false,
    }
  ];

  String? selectedrole;

  final List<String> cast = [
    "Roman Catholic",
    "Pentecostal",
    "Recoverversion",
  ];

  String _selectedLanguage = '';

  bool isFavorite = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      show();
    });
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
                const EdgeInsets.only(left: 16.0, top: 20.0, bottom: 20, right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    BackButtonContainer(),
                    Padding(
                      padding: EdgeInsets.only(left: Get.width * 0.03), // Responsive left padding (3% of screen width)
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Personalised Frames",
                            style: TextStyle(
                              fontSize: Get.width * 0.04, // Responsive font size (4% of screen width)
                              fontWeight: FontWeight.w800,
                              color: AppTheme.coretextcolor, // Replace with your theme color
                            ),
                          ),
                         // SizedBox(height: Get.height * 0.01), // Responsive vertical spacing (1% of screen height)
                          Text(
                            "30 items",
                            style: TextStyle(
                              fontSize: Get.width * 0.035, // Responsive font size (3.5% of screen width)
                              fontWeight: FontWeight.w500,
                              color: AppTheme.coretextcolor, // Replace with your theme color
                            ),
                          ),
                        ],
                      ),
                    )

                  ],
                ),
                Stack(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/icons/Search icon.png',
                          height: Get.height * 0.035, // Adjust height dynamically (3.5% of screen height)
                          width: Get.width * 0.08,   // Adjust width dynamically (8% of screen width)
                        ),
                        SizedBox(
                          width: Get.width * 0.04, // Adjust horizontal spacing (4% of screen width)
                        ),
                        Padding(
                          padding: EdgeInsets.all(Get.width * 0.02), // Responsive padding
                          child: SizedBox(
                            height: Get.height * 0.035, // Adjust height dynamically
                            width: Get.width * 0.07,   // Adjust width dynamically
                            child: Image.asset(
                              'assets/images/icons/Heart icon.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: Get.width * 0.03, // Adjust horizontal spacing
                        ),
                        Padding(
                          padding: EdgeInsets.all(Get.width * 0.02), // Responsive padding
                          child: SizedBox(
                            height: Get.height * 0.035, // Adjust height dynamically
                            width: Get.width * 0.07,   // Adjust width dynamically
                            child: Image.asset(
                              'assets/images/icons/Bag icon.png',
                              fit: BoxFit.contain, // Ensures the image fits within the box
                            ),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      right: Get.width * 0.15, // Dynamic right position (15% of screen width)
                      bottom: Get.height * 0.025, // Dynamic bottom position (2.5% of screen height)
                      child: Container(
                        width: Get.width * 0.05,  // Dynamic width (5% of screen width)
                        height: Get.width * 0.05, // Dynamic height (5% of screen width)
                        padding: EdgeInsets.all(Get.width * 0.005), // Responsive padding
                        decoration: BoxDecoration(
                          color: AppTheme.corecolor,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            "10",
                            style: TextStyle(
                              fontSize: Get.width * 0.03, // Dynamic font size (3% of screen width)
                              color: AppTheme.whitecolor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: Get.width * 0.02, // Dynamic right position (2% of screen width)
                      bottom: Get.height * 0.025, // Dynamic bottom position (2.5% of screen height)
                      child: Container(
                        width: Get.width * 0.05,  // Dynamic width (5% of screen width)
                        height: Get.width * 0.05, // Dynamic height (5% of screen width)
                        padding: EdgeInsets.all(Get.width * 0.005), // Responsive padding
                        decoration: BoxDecoration(
                          color: AppTheme.corecolor,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            "5",
                            style: TextStyle(
                              fontSize: Get.width * 0.03, // Dynamic font size (3% of screen width)
                              color: AppTheme.whitecolor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              show();
              //_showDeliveryLocationPopup(context);
            },
            child: Container(
              height: 49,
              color: AppTheme.bgcontainer, // Replace with your background color
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/icons/indialflag.png',
                          width: 40,
                          fit: BoxFit.contain,
                        ),
                        Container(
                          height: 35, // Set height for the divider
                          child: VerticalDivider(
                            color: AppTheme.awardbgcolor,
                            thickness: 2.5,
                            width:
                                20, // Controls the width of space around the divider
                          ),
                        ),
                        Image.asset(
                          'assets/images/icons/location.png',
                          // Ensure correct asset path
                          width: 25,
                          fit: BoxFit.contain,
                          color: AppTheme
                              .coretextcolor, // Replace with your text color
                        ),
                        GestureDetector(
                          onTap: () {
                            show();
                            //_showDeliveryLocationPopup(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              'Delivery In',
                              style: TextStyle(
                                fontSize: 15,
                                // Replace with your font size
                                //fontWeight: FontWeight.w800,
                                color: AppTheme
                                    .coretextcolor, // Replace with your text color
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 1.0),
                      child: Image.asset(
                        'assets/images/icons/Arrow.png',
                        // Ensure correct asset path
                        width: 25,
                        height: 25,
                        fit: BoxFit.contain,
                        color: AppTheme
                            .coretextcolor, // Replace with your text color
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [


               /*   Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DropdownButton<String>(
                          value: selectedrole,
                          items: cast.map((String year) {
                            return DropdownMenuItem<String>(
                              value: year,
                              child: Text(
                                year,
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 13.0,
                                  // Set your desired font size for the dropdown items
                                  color: AppTheme.coretextcolor,
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedrole = newValue;
                            });
                          },
                          hint: Text(
                            'Roman Catholic',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                color: AppTheme.grey,
                                fontSize:
                                    14.0), // Adjust font size of hint text
                          ),
                          underline: SizedBox(),
                          icon: Icon(Icons.arrow_drop_down,
                              color: AppTheme.coretextcolor),
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: AppTheme.grey,
                            fontSize:
                                16.0, // Adjust font size for selected value
                          ),
                          dropdownColor: Colors.white,
                        ),
                        Row(
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _selectedLanguage = "tamil";
                                    });
                                  },
                                  child: Container(
                                    width: 14, // Adjust size as needed
                                    height: 14,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: _selectedLanguage == "tamil"
                                            ? AppTheme.corecolor
                                            : Colors.transparent,
                                        width: 2.0,
                                      ),
                                      color: _selectedLanguage == "tamil"
                                          ? AppTheme.corecolor
                                          : AppTheme.awardbgcolor,
                                    ),
                                    child: _selectedLanguage == "tamil"
                                        ? Icon(Icons.circle,
                                            size: 10,
                                            color: Colors
                                                .white) // Optional check mark
                                        : null,
                                  ),
                                ),
                                SizedBox(width: 4),
                                // Space between the container and text
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _selectedLanguage = "tamil";
                                    });
                                  },
                                  child: Text(
                                    "Tamil",
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 14,
                                      color: AppTheme.grey,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _selectedLanguage = "english";
                                    });
                                  },
                                  child: Container(
                                    width: 14,
                                    height: 14,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: _selectedLanguage == "english"
                                            ? AppTheme.corecolor
                                            : Colors.transparent,
                                        width: 2.0,
                                      ),
                                      color: _selectedLanguage == "english"
                                          ? AppTheme.corecolor
                                          : AppTheme.awardbgcolor,
                                    ),
                                    child: _selectedLanguage == "english"
                                        ? Icon(Icons.circle,
                                            size: 10, color: Colors.white)
                                        : null,
                                  ),
                                ),
                                SizedBox(width: 4),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _selectedLanguage = "english";
                                    });
                                  },
                                  child: Text(
                                    "English",
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 14,
                                      color: AppTheme.grey,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Filter",
                              style: TextStyle(
                                  color: AppTheme.grey,
                                  fontFamily: 'Poppins',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                            GestureDetector(
                              onTap: () {
                                // Your onPressed action here
                              },
                              child: Container(
                                padding: EdgeInsets.all(8.0),
                                // Add padding for touchable area
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  // Make it circular like IconButton
                                  color: Colors
                                      .transparent, // Set a background color if needed
                                ),
                                child: Image.asset(
                                  'assets/images/paymentimage/mage_filter-fill.png',
                                  // Ensure correct path
                                  width: 18,
                                  height: 18,
                                ),

                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
*/


                  Padding(
                    padding: EdgeInsets.only(left: Get.width * 0.02),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Dropdown Button
                        DropdownButton<String>(
                          value: selectedrole,
                          items: cast.map((String year) {
                            return DropdownMenuItem<String>(
                              value: year,
                              child: Text(
                                year,
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: Get.width * 0.035, // Responsive font size
                                  color: AppTheme.coretextcolor,
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedrole = newValue;
                            });
                          },
                          hint: Text(
                            'Roman Catholic',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: AppTheme.grey,
                              fontSize: Get.width * 0.037, // Responsive font size
                            ),
                          ),
                          underline: SizedBox(),
                          icon: Icon(Icons.arrow_drop_down, color: AppTheme.coretextcolor),
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: AppTheme.grey,
                            fontSize: Get.width * 0.04, // Responsive font size
                          ),
                          dropdownColor: Colors.white,
                        ),
                        // Language Selector
                        Row(
                          children: [
                            // Tamil Option
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _selectedLanguage = "tamil";
                                    });
                                  },
                                  child: Container(
                                    width: Get.width * 0.04, // Responsive size
                                    height: Get.width * 0.04,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: _selectedLanguage == "tamil"
                                            ? AppTheme.corecolor
                                            : Colors.transparent,
                                        width: 2.0,
                                      ),
                                      color: _selectedLanguage == "tamil"
                                          ? AppTheme.corecolor
                                          : AppTheme.awardbgcolor,
                                    ),
                                    child: _selectedLanguage == "tamil"
                                        ? Icon(Icons.circle, size: Get.width * 0.025, color: Colors.white)
                                        : null,
                                  ),
                                ),
                                SizedBox(width: Get.width * 0.01), // Space between circle and text
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _selectedLanguage = "tamil";
                                    });
                                  },
                                  child: Container(
                                    height: 25,
                                    color: Colors.transparent,
                                    child: Center(
                                      child: Text(
                                        "Tamil",
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: Get.width * 0.035, // Responsive font size
                                          color: AppTheme.grey,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: Get.width * 0.03), // Space between Tamil and English
                            // English Option
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _selectedLanguage = "english";
                                    });
                                  },
                                  child: Container(
                                    width: Get.width * 0.04,
                                    height: Get.width * 0.04,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: _selectedLanguage == "english"
                                            ? AppTheme.corecolor
                                            : Colors.transparent,
                                        width: 2.0,
                                      ),
                                      color: _selectedLanguage == "english"
                                          ? AppTheme.corecolor
                                          : AppTheme.awardbgcolor,
                                    ),
                                    child: _selectedLanguage == "english"
                                        ? Icon(Icons.circle, size: Get.width * 0.025, color: Colors.white)
                                        : null,
                                  ),
                                ),
                                SizedBox(width: Get.width * 0.01),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _selectedLanguage = "english";
                                    });
                                  },
                                  child: Container(
                                    height: 25,
                                    color: Colors.transparent,
                                    child: Center(
                                      child: Text(
                                        "English",
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: Get.width * 0.035,
                                          color: AppTheme.grey,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        // Filter Section
                        Row(
                          children: [
                            Text(
                              "Filter",
                              style: TextStyle(
                                color: AppTheme.grey,
                                fontFamily: 'Poppins',
                                fontSize: Get.width * 0.038, // Responsive font size
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                // Handle filter action
                              },
                              child: Container(
                                padding: EdgeInsets.all(Get.width * 0.02),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.transparent,
                                ),
                                child: Image.asset(
                                  'assets/images/paymentimage/mage_filter-fill.png',
                                  width: Get.width * 0.05, // Responsive size
                                  height: Get.width * 0.05,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),


                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: GestureDetector(
                              onTap: () {},
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0, vertical: 5.0),
                                decoration: BoxDecoration(
                                  color: AppTheme.awardbgcolor.withOpacity(0.4),
                                  borderRadius: BorderRadius.circular(30.0),
                                  border: Border.all(
                                    color: AppTheme.grey,
                                    // Set the outline color
                                    width: 0.2, // Set the outline thickness
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: Text(
                                    "Birthday Gifts",
                                    style: TextStyle(
                                      color: AppTheme.blackcolor,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0, vertical: 5.0),
                              // Adjust padding to control size
                              decoration: BoxDecoration(
                                color: AppTheme.awardbgcolor.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(30.0),
                                // Matches the rounded corners
                                border: Border.all(
                                  color: AppTheme.grey, // Set the outline color
                                  width: 0.2, // Set the outline thickness
                                ), // No border color
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: Text(
                                  "Anniversary Gifts",
                                  style: TextStyle(
                                    color: AppTheme.blackcolor,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0, vertical: 5.0),
                              // Adjust padding to control size
                              decoration: BoxDecoration(
                                color: AppTheme.awardbgcolor.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(30.0),
                                // Matches the rounded corners
                                border: Border.all(
                                  color: AppTheme.grey, // Set the outline color
                                  width: 0.2, // Set the outline thickness
                                ), // No border color
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: Text(
                                  "House Warming Gifts",
                                  style: TextStyle(
                                    color: AppTheme.blackcolor,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0, vertical: 5.0),
                              // Adjust padding to control size
                              decoration: BoxDecoration(
                                color: AppTheme.awardbgcolor.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(30.0),
                                // Matches the rounded corners
                                border: Border.all(
                                  color: AppTheme.grey, // Set the outline color
                                  width: 0.2, // Set the outline thickness
                                ), // No border color
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: Text(
                                  "Birthday Gifts",
                                  style: TextStyle(
                                    color: AppTheme.blackcolor,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0, vertical: 5.0),
                              // Adjust padding to control size
                              decoration: BoxDecoration(
                                color: AppTheme.awardbgcolor.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(30.0),
                                // Matches the rounded corners
                                border: Border.all(
                                  color: AppTheme.grey, // Set the outline color
                                  width: 0.2, // Set the outline thickness
                                ), // No border color
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: Text(
                                  "Anniversary Gifts",
                                  style: TextStyle(
                                    color: AppTheme.blackcolor,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0, vertical: 5.0),
                              // Adjust padding to control size
                              decoration: BoxDecoration(
                                color: AppTheme.awardbgcolor.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(30.0),
                                // Matches the rounded corners
                                border: Border.all(
                                  color: AppTheme.grey, // Set the outline color
                                  width: 0.2, // Set the outline thickness
                                ), // No border color
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: Text(
                                  "House Warming Gifts",
                                  style: TextStyle(
                                    color: AppTheme.blackcolor,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: GridView.builder(
                      padding: EdgeInsets.only(
                        top: Get.height * 0.01,
                        left: Get.width * 0.01,
                        right: Get.width * 0.01,
                      ),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // Keep the number of columns consistent
                        childAspectRatio: 0.63, // Aspect ratio remains the same
                        crossAxisSpacing: Get.width * 0.03, // Adjust spacing dynamically
                        mainAxisSpacing: Get.height * 0.015,
                      ),
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        final product = products[index];
                        return Stack(
                          children: [
                            Container(
                              height: Get.height * 0.4,
                              decoration: BoxDecoration(
                              //  color: Colors.pink,
                                borderRadius: BorderRadius.circular(Get.width * 0.02),
                                border: Border.all(
                                  color: AppTheme.grey,
                                  width: Get.width * 0.001,
                                ),
                              ),
                              child: Column(
                                //mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Get.to(SingleShopeImage());
                                        },
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(Get.width * 0.02),
                                            topRight: Radius.circular(Get.width * 0.02),
                                          ),
                                          child: Image.asset(
                                            product['image'],
                                            width: double.infinity,
                                            height: Get.height * 0.19,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: Get.height * 0.01,
                                        left: Get.width * 0.02,
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              product['isFavorite'] = !product['isFavorite'];
                                            });
                                          },
                                          child: Container(
                                            width: Get.width * 0.09,
                                            height: Get.width * 0.09,
                                            decoration: BoxDecoration(
                                              color: Colors.white.withOpacity(0.8),
                                              borderRadius: BorderRadius.circular(
                                                Get.width * 0.045,
                                              ),
                                            ),
                                            child: Center(
                                              child: Image.asset(
                                                product['isFavorite']
                                                    ? 'assets/images/paymentimage/FILL HEART.png'
                                                    : 'assets/images/paymentimage/heart.png',
                                                width: Get.width * 0.06,
                                                height: Get.width * 0.06,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: Get.height * 0.01,
                                      bottom: Get.height * 0.01,
                                      left: Get.width * 0.02,
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          product['title'],
                                          style: TextStyle(
                                            fontSize: Get.width * 0.03,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w500,
                                            color: AppTheme.coretextcolor,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        SizedBox(height: Get.height * 0.005),
                                        Row(
                                          children: [
                                            Text(
                                              product['price'],
                                              style: TextStyle(
                                                fontFamily: 'Roboto',
                                                fontSize: Get.width * 0.035,
                                                color: AppTheme.blackcolor,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(width: Get.width * 0.015),
                                            Text(
                                              product['oldPrice'],
                                              style: TextStyle(
                                                color: AppTheme.coretextcolor,
                                                fontFamily: 'Roboto',
                                                fontSize: Get.width * 0.03,
                                                fontWeight: FontWeight.w500,
                                                decoration: TextDecoration.lineThrough,
                                              ),
                                            ),
                                            SizedBox(width: Get.width * 0.02),
                                            Container(
                                              width: Get.width * 0.12,
                                              height: Get.height * 0.02,
                                              decoration: BoxDecoration(
                                                color: AppTheme.greencolor.withOpacity(0.2),
                                                borderRadius: BorderRadius.circular(
                                                  Get.width * 0.02,
                                                ),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  product['discount'],
                                                  style: TextStyle(
                                                    color: AppTheme.greentextcolor,
                                                    fontSize: Get.width * 0.025,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: Get.height * 0.005),
                                        Row(
                                          children: [
                                            Text(
                                              'Earliest Delivery:',
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontSize: Get.width * 0.028,
                                                color: Colors.grey,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(left: Get.width * 0.01),
                                              child: Text(
                                                '${product['deliveryDate']}',
                                                style: TextStyle(
                                                  fontSize: Get.width * 0.027,
                                                  fontWeight: FontWeight.bold,
                                                  color: AppTheme.greentextcolor,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: Get.height * 0.005),
                                        Row(
                                          children: [
                                            Container(
                                              width: Get.width * 0.12,
                                              height: Get.height * 0.03,
                                              decoration: BoxDecoration(
                                                color: AppTheme.greencolor,
                                                borderRadius: BorderRadius.circular(
                                                  Get.width * 0.02,
                                                ),
                                              ),
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(left: Get.width * 0.02),
                                                    child: Text(
                                                      product['rating'].toString(),
                                                      style: TextStyle(
                                                        color: AppTheme.whitecolor,
                                                        fontSize: Get.width * 0.025,
                                                      ),
                                                    ),
                                                  ),
                                                  Icon(
                                                    Icons.star,
                                                    color: AppTheme.whitecolor,
                                                    size: Get.width * 0.04,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(left: Get.width * 0.02),
                                              child: Text(
                                                product['reviews'],
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: Get.width * 0.03,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              bottom: Get.height * 0.015,
                              right: Get.width * 0.02,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    product['isshopcard'] = !product['isshopcard'];
                                  });
                                },
                                child: Container(
                                  width: Get.width * 0.07,
                                  height: Get.width * 0.07,
                                  decoration: BoxDecoration(
                                    color: product['isshopcard']
                                        ? AppTheme.shopcardbackground
                                        : AppTheme.corecolor,
                                    borderRadius: BorderRadius.circular(Get.width * 0.035),
                                  ),
                                  child: Center(
                                    child: Image.asset(
                                      product['isshopcard']
                                          ? 'assets/images/icons/ph_shopping-cart-fill.png'
                                          : 'assets/images/icons/ph_shopping-cart-fill-white.png',
                                      width: Get.width * 0.05,
                                      height: Get.width * 0.05,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),



                  /*Expanded(
                    child: GridView.builder(
                      padding: const EdgeInsets.only(top: 8, left: 4, right: 4),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.63,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 3,
                      ),
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        final product = products[index];
                        return Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: AppTheme.grey, width: 0.18),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                // Limit height based on content
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Get.to(SingleShopeImage());
                                        },
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10),
                                          ),
                                          child: Image.asset(
                                            product['image'],
                                            width: double.infinity,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 8,
                                        left: 8,
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              product['isFavorite'] =
                                                  !product['isFavorite'];
                                            });
                                          },
                                          child: Container(
                                            width: 33,
                                            height: 33,
                                            decoration: BoxDecoration(
                                              color: Colors.white.withOpacity(0.8),
                                              borderRadius: BorderRadius.circular(20),
                                            ),
                                            child: Center(
                                              child: Image.asset(
                                                product['isFavorite'] ? 'assets/images/paymentimage/FILL HEART.png' :'assets/images/paymentimage/heart.png',
                                                width: 25, // Adjust the width to reduce the size
                                                height: 25, // Adjust the height to reduce the size
                                              ),
                                            ),
                                          ),

                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8.0, bottom: 8, left: 6),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 2),
                                        Text(
                                          product['title'],
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w500,
                                            color: AppTheme.coretextcolor,
                                          ),
                                          maxLines: 1,
                                          // Limit the text to a single line
                                          overflow: TextOverflow
                                              .ellipsis, // Use ellipsis for overflow
                                        ),
                                        SizedBox(height: 2),
                                        Row(
                                          children: [
                                            Text(
                                              product['price'],
                                              style: TextStyle(
                                                fontFamily: 'Roboto',
                                                fontSize: 13,
                                                color: AppTheme.blackcolor,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(width: 6),
                                            Text(
                                              product['oldPrice'],
                                              style: TextStyle(
                                                color: AppTheme.coretextcolor,
                                                fontFamily: 'Roboto',
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500,
                                                decoration:
                                                    TextDecoration.lineThrough,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0),
                                              child: Container(
                                                width: 45,
                                                height: 16,
                                                decoration: BoxDecoration(
                                                  color: AppTheme.greencolor.withOpacity(0.2),
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    product['discount'],
                                                    style: TextStyle(
                                                      color: AppTheme
                                                          .greentextcolor,
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 2),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  'Earliest Delivery:',
                                                  style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    // fontWeight: FontWeight.w600,
                                                    fontSize: 11,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 4.0),
                                                  child: Text(
                                                    '${product['deliveryDate']}',
                                                    style: TextStyle(
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: AppTheme
                                                          .greentextcolor,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 4),
                                        Row(
                                          children: [
                                            Container(
                                              width: 50,
                                              height: 17,
                                              decoration: BoxDecoration(
                                                color: AppTheme.greencolor,
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                              ),
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8.0),
                                                    child: Text(
                                                      product['rating']
                                                          .toString(),
                                                      style: TextStyle(
                                                        color:
                                                            AppTheme.whitecolor,
                                                        fontSize: 10,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8.0),
                                                    child: Icon(
                                                      Icons.star,
                                                      color:
                                                          AppTheme.whitecolor,
                                                      size: 14,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0),
                                              child: Text(
                                                product['reviews'],
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 11,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 2),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              bottom: 15,
                              right: 8,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    product['isshopcard'] =
                                    !product['isshopcard'];
                                  });
                                },
                                child: Container(
                                  width: 27,
                                  height: 27,
                                  decoration: BoxDecoration(
                                    color:  product['isshopcard'] ? AppTheme.shopcardbackground : AppTheme.corecolor,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                    child: Image.asset(
                                      product['isshopcard'] ? 'assets/images/icons/ph_shopping-cart-fill.png' :'assets/images/icons/ph_shopping-cart-fill-white.png',
                                      width:product['isshopcard'] ? 20 : 16, // Adjust the width to reduce the size
                                      height:product['isshopcard'] ? 20 : 16, // Adjust the height to reduce the size
                                    ),
                                  ),
                                ),

                              ),
                            )
                          ],
                        );
                      },
                    ),
                  ),*/
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void show() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        String _selectedDelivery = '';
        return Container(
          decoration: BoxDecoration(
            color: AppTheme.whitecolor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Get.width * 0.04), // Responsive corner radius
              topRight: Radius.circular(Get.width * 0.04), // Responsive corner radius
            ),
          ),
          height: Get.height * 0.46, // Responsive height
          child: Center(
            child: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return Column(
                 // mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: AppTheme.deliverygrey,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(Get.width * 0.04),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: Get.width * 0.04,
                              vertical: Get.height * 0.03,
                            ),
                            child: Text(
                              'Select Delivery Location',
                              style: TextStyle(
                                fontSize: Get.width * 0.045, // Responsive font size
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: Get.width * 0.06),
                            child: GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: Image.asset(
                                'assets/images/paymentimage/close.png',
                                width: Get.width * 0.05, // Responsive icon size
                                height: Get.width * 0.05, // Responsive icon size
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: Get.height * 0.02),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Get.width * 0.04,
                        vertical: Get.height * 0.01,
                      ),
                      child: Text(
                        'Select a delivery location to see product availability',
                        style: TextStyle(
                          fontSize: Get.width * 0.035, // Responsive font size
                        ),
                      ),
                    ),
                    SizedBox(height: Get.height * 0.02),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: Get.width * 0.01),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                           // color: Colors.pink,
                            width: Get.width * 0.47, // Responsive width
                            child: ListTile(
                              leading: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _selectedDelivery = 'within_india_1';
                                  });
                                },
                                child: Container(
                                  width: Get.width * 0.05, // Responsive circle size
                                  height: Get.width * 0.05,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: _selectedDelivery == 'within_india_1'
                                          ? AppTheme.corecolor
                                          : AppTheme.corecolor,
                                      width: 3,
                                    ),
                                  ),
                                  child: _selectedDelivery == 'within_india_1'
                                      ? Center(
                                    child: Container(
                                      width: Get.width * 0.03, // Inner circle size
                                      height: Get.width * 0.03,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppTheme.corecolor,
                                      ),
                                    ),
                                  )
                                      : null,
                                ),
                              ),
                              title: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _selectedDelivery = 'within_india_1';
                                  });
                                },
                                child: Container(
                                  height: 30,
                                  color: Colors.transparent,
                                  child: Center(
                                    child: Text(
                                      'Within India',
                                      style: TextStyle(
                                        fontSize: Get.width * 0.03, // Responsive font size
                                        fontWeight: FontWeight.bold,
                                        color: AppTheme.blackcolor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: Get.width * 0.02), // Responsive spacing
                          Container(
                           // color: Colors.orange,
                            width: Get.width * 0.47, // Responsive width
                            child: ListTile(
                              leading: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _selectedDelivery = 'within_india_2';
                                  });
                                },
                                child: Container(
                                  width: Get.width * 0.05,
                                  height: Get.width * 0.05,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: _selectedDelivery == 'within_india_2'
                                          ? AppTheme.corecolor
                                          : AppTheme.corecolor,
                                      width: 3,
                                    ),
                                  ),
                                  child: _selectedDelivery == 'within_india_2'
                                      ? Center(
                                    child: Container(
                                      width: Get.width * 0.03,
                                      height: Get.width * 0.03,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppTheme.corecolor,
                                      ),
                                    ),
                                  )
                                      : null,
                                ),
                              ),
                              title: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _selectedDelivery = 'within_india_2';
                                  });
                                },
                                child: Container(
                                  height: 30,
                                  color: Colors.transparent,
                                  child: Center(
                                    child: Text(
                                      'Outside India',
                                      style: TextStyle(
                                        fontSize: Get.width * 0.03,
                                        fontWeight: FontWeight.bold,
                                        color: AppTheme.blackcolor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: Get.height * 0.02),
                    GestureDetector(
                      onTap: () {
                        Get.to(DeliveryLocationScreen());
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: Get.width * 0.04),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: Get.width * 0.04,
                            vertical: Get.height * 0.02,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(Get.width * 0.02),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    _selectedDelivery == 'within_india_1'
                                        ? 'assets/images/icons/location.png'
                                        : _selectedDelivery == 'within_india_2'
                                        ? 'assets/images/paymentimage/earth.png'
                                        : 'assets/images/icons/location.png',
                                    width: Get.width * 0.06, // Responsive icon size
                                    fit: BoxFit.contain,
                                    color: AppTheme.grey,
                                  ),
                                  SizedBox(width: Get.width * 0.02),
                                  Text(
                                    _selectedDelivery == 'within_india_1'
                                        ? 'Enter Delivery Area or Pincode'
                                        : _selectedDelivery == 'within_india_2'
                                        ? 'Select Country'
                                        : 'Enter Delivery Area or Pincode',
                                    style: TextStyle(
                                      color: AppTheme.grey,
                                      fontSize: Get.width * 0.04,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.grey,
                                size: Get.width * 0.045, // Responsive icon size
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: Get.height * 0.05),
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        height: Get.height * 0.07, // Responsive height
                        decoration: BoxDecoration(
                          color: AppTheme.continueshopping,
                          borderRadius: BorderRadius.zero,
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'CONTINUE SHOPPING',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: Get.width * 0.04, // Responsive font size
                            color: AppTheme.blackcolor,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: Get.height <= 845 ? Get.height * 0.02 :  Get.height * 0.025),
                  ],
                );
              },
            ),
          ),
        );



        //   Container(
        //   decoration: BoxDecoration(
        //     color: AppTheme.whitecolor,
        //     borderRadius: BorderRadius.only(
        //       topLeft: Radius.circular(15), // Curves the top-left corner
        //       topRight: Radius.circular(15), // Curves the top-right corner
        //     ),
        //   ),
        //   height: 367, // Set your desired height
        //   child: Center(child: StatefulBuilder(
        //     builder: (BuildContext context, StateSetter setState) {
        //       return Column(
        //         mainAxisSize: MainAxisSize.min,
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           Container(
        //             decoration: BoxDecoration(
        //               color: AppTheme.deliverygrey,
        //               borderRadius:
        //                   BorderRadius.vertical(top: Radius.circular(15)),
        //             ),
        //             child: Row(
        //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //               children: [
        //                 Padding(
        //                   padding: const EdgeInsets.symmetric(
        //                       horizontal: 16.0, vertical: 25),
        //                   child: Text(
        //                     'Select Delivery Location',
        //                     style: TextStyle(
        //                       fontSize: 18,
        //                       fontWeight: FontWeight.bold,
        //                     ),
        //                   ),
        //                 ),
        //                 Padding(
        //                   padding: const EdgeInsets.only(right: 25.0),
        //                   child: GestureDetector(
        //                     onTap: (){
        //                       Get.back();
        //                     },
        //                     child: Image.asset(
        //                       'assets/images/paymentimage/close.png', // Ensure correct path
        //                       width: 18,
        //                       height: 18,
        //                     ),
        //                   ),
        //                 ),
        //               ],
        //             ),
        //           ),
        //           SizedBox(height: 10),
        //           Padding(
        //             padding: const EdgeInsets.symmetric(
        //                 horizontal: 16.0, vertical: 8),
        //             child: Text(
        //               'Select a delivery location to see product availability',
        //               style: TextStyle(
        //                 fontSize: 13,
        //               ),
        //             ),
        //           ),
        //           SizedBox(height: 10),
        //
        //           Padding(
        //             padding: EdgeInsets.symmetric(horizontal: Get.width * 0.01),
        //             child: Row(
        //               mainAxisAlignment: MainAxisAlignment.start,
        //               children: [
        //                 Container(
        //                   width: Get.width * 0.45, // Adjust width based on screen size
        //                   child: ListTile(
        //                     leading: GestureDetector(
        //                       onTap: () {
        //                         setState(() {
        //                           _selectedDelivery = 'within_india_1';
        //                         });
        //                       },
        //                       child: Container(
        //                         width: Get.width * 0.06, // Responsive size for circle
        //                         height: Get.width * 0.06,
        //                         decoration: BoxDecoration(
        //                           shape: BoxShape.circle,
        //                           border: Border.all(
        //                             color: _selectedDelivery == 'within_india_1'
        //                                 ? AppTheme.corecolor
        //                                 : AppTheme.corecolor,
        //                             width: 3, // Border thickness remains fixed
        //                           ),
        //                         ),
        //                         child: _selectedDelivery == 'within_india_1'
        //                             ? Center(
        //                           child: Container(
        //                             width: Get.width * 0.03, // Inner circle size
        //                             height: Get.width * 0.03,
        //                             decoration: BoxDecoration(
        //                               shape: BoxShape.circle,
        //                               color: AppTheme.corecolor,
        //                             ),
        //                           ),
        //                         )
        //                             : null,
        //                       ),
        //                     ),
        //                     title: GestureDetector(
        //                       onTap: () {
        //                         setState(() {
        //                           _selectedDelivery = 'within_india_1';
        //                         });
        //                       },
        //                       child: Text(
        //                         'Within India',
        //                         style: TextStyle(
        //                           fontSize: Get.width * 0.035, // Responsive font size
        //                           fontWeight: FontWeight.bold,
        //                           color: AppTheme.blackcolor,
        //                         ),
        //                       ),
        //                     ),
        //                   ),
        //                 ),
        //                 SizedBox(width: Get.width * 0.02), // Responsive spacing
        //                 Container(
        //                   width: Get.width * 0.45, // Adjust width based on screen size
        //                   child: ListTile(
        //                     leading: GestureDetector(
        //                       onTap: () {
        //                         setState(() {
        //                           _selectedDelivery = 'within_india_2';
        //                         });
        //                       },
        //                       child: Container(
        //                         width: Get.width * 0.06, // Responsive size for circle
        //                         height: Get.width * 0.06,
        //                         decoration: BoxDecoration(
        //                           shape: BoxShape.circle,
        //                           border: Border.all(
        //                             color: _selectedDelivery == 'within_india_2'
        //                                 ? AppTheme.corecolor
        //                                 : AppTheme.corecolor,
        //                             width: 3,
        //                           ),
        //                         ),
        //                         child: _selectedDelivery == 'within_india_2'
        //                             ? Center(
        //                           child: Container(
        //                             width: Get.width * 0.03, // Inner circle size
        //                             height: Get.width * 0.03,
        //                             decoration: BoxDecoration(
        //                               shape: BoxShape.circle,
        //                               color: AppTheme.corecolor,
        //                             ),
        //                           ),
        //                         )
        //                             : null,
        //                       ),
        //                     ),
        //                     title: GestureDetector(
        //                       onTap: () {
        //                         setState(() {
        //                           _selectedDelivery = 'within_india_2';
        //                         });
        //                       },
        //                       child: Text(
        //                         'Outside India',
        //                         style: TextStyle(
        //                           fontSize: Get.width * 0.035, // Responsive font size
        //                           fontWeight: FontWeight.bold,
        //                           color: AppTheme.blackcolor,
        //                         ),
        //                       ),
        //                     ),
        //                   ),
        //                 ),
        //               ],
        //             ),
        //           ),
        //
        //
        //           /*Padding(
        //             padding: const EdgeInsets.symmetric(horizontal: 4.0),
        //             child: Row(
        //               mainAxisAlignment: MainAxisAlignment.start,
        //               // Aligns the children to the start
        //               children: [
        //                 Container(
        //
        //                   width: 180, // Adjust the width as needed
        //                   child: ListTile(
        //                     leading: GestureDetector(
        //                       onTap: () {
        //                         setState(() {
        //                           _selectedDelivery = 'within_india_1';
        //                         });
        //                       },
        //                       child: Container(
        //                         width: 22, // Customize size as needed
        //                         height: 22,
        //                         decoration: BoxDecoration(
        //                           shape: BoxShape.circle,
        //                           border: Border.all(
        //                             color: _selectedDelivery == 'within_india_1'
        //                                 ? AppTheme.corecolor
        //                                 : AppTheme.corecolor,
        //                             width: 3, // Set the border thickness here
        //                           ),
        //                         ),
        //                         child: _selectedDelivery == 'within_india_1'
        //                             ? Center(
        //                                 child: Container(
        //                                   width: 12, // Inner circle size
        //                                   height: 12,
        //                                   decoration: BoxDecoration(
        //                                     shape: BoxShape.circle,
        //                                     color: AppTheme
        //                                         .corecolor, // Color of the filled circle
        //                                   ),
        //                                 ),
        //                               )
        //                             : null,
        //                       ),
        //                     ),
        //                     title: GestureDetector(
        //                         onTap: () {
        //                           setState(() {
        //                             _selectedDelivery = 'within_india_1';
        //                           });
        //                         },
        //                         child: Text('Within India',style: TextStyle(
        //                           fontSize: 14,
        //                           fontWeight: FontWeight.bold,
        //                           color: AppTheme.blackcolor
        //                         ),)),
        //                   ),
        //                 ),
        //                 SizedBox(width: 0),
        //                 // Remove or set to zero to eliminate space between containers
        //                 Container(
        //
        //                   width: 180, // Adjust the width as needed
        //                   child: ListTile(
        //                     leading: GestureDetector(
        //                       onTap: () {
        //                         setState(() {
        //                           _selectedDelivery = 'within_india_2';
        //                         });
        //                       },
        //                       child: Container(
        //                         width: 22,
        //                         height: 22,
        //                         decoration: BoxDecoration(
        //                           shape: BoxShape.circle,
        //                           border: Border.all(
        //                             color: _selectedDelivery == 'within_india_2'
        //                                 ? AppTheme.corecolor
        //                                 : AppTheme.corecolor,
        //                             width: 3, // Set the border thickness here
        //                           ),
        //                         ),
        //                         child: _selectedDelivery == 'within_india_2'
        //                             ? Center(
        //                                 child: Container(
        //                                   width: 12,
        //                                   height: 12,
        //                                   decoration: BoxDecoration(
        //                                     shape: BoxShape.circle,
        //                                     color: AppTheme.corecolor,
        //                                   ),
        //                                 ),
        //                               )
        //                             : null,
        //                       ),
        //                     ),
        //                     title: GestureDetector(
        //                         onTap: () {
        //                           setState(() {
        //                             _selectedDelivery = 'within_india_2';
        //                           });
        //                         },
        //                         child: Text('Outside India',style: TextStyle(
        //                             fontSize: 14,
        //                             fontWeight: FontWeight.bold,
        //                             color: AppTheme.blackcolor
        //                         ))),
        //                   ),
        //                 ),
        //               ],
        //             ),
        //           ),*/
        //           SizedBox(height: 10),
        //           GestureDetector(
        //             onTap: () {
        //               Get.to(DeliveryLocationScreen());
        //             },
        //             child: Padding(
        //               padding: const EdgeInsets.symmetric(horizontal: 16.0),
        //               child: Container(
        //                 padding: EdgeInsets.symmetric(
        //                     horizontal: 16.0, vertical: 16.0),
        //                 decoration: BoxDecoration(
        //                   border: Border.all(color: Colors.grey.shade300),
        //                   borderRadius: BorderRadius.circular(8.0),
        //                 ),
        //                 child:
        //                 Row(
        //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                   children: [
        //                     Row(
        //                       children: [
        //                         Image.asset(
        //                           _selectedDelivery == 'within_india_1'
        //                               ? 'assets/images/icons/location.png'
        //                               : _selectedDelivery == 'within_india_2'
        //                               ? 'assets/images/paymentimage/earth.png'
        //                               : 'assets/images/icons/location.png',
        //                           width: Get.width * 0.06, // Responsive width
        //                           fit: BoxFit.contain,
        //                           color: AppTheme.grey, // Replace with your desired color
        //                         ),
        //                         SizedBox(width: Get.width * 0.02), // Responsive spacing
        //                         Text(
        //                           _selectedDelivery == 'within_india_1'
        //                               ? 'Enter Delivery Area or Pincode'
        //                               : _selectedDelivery == 'within_india_2'
        //                               ? 'Select Country'
        //                               : 'Enter Delivery Area or Pincode',
        //                           style: TextStyle(
        //                             color: AppTheme.grey,
        //                             fontSize: Get.width * 0.04, // Responsive font size
        //                             fontWeight: FontWeight.bold,
        //                           ),
        //                         ),
        //                       ],
        //                     ),
        //                     GestureDetector(
        //                       onTap: () {
        //                         Get.to(DeliveryLocationScreen());
        //                       },
        //                       child: Icon(
        //                         Icons.arrow_forward_ios,
        //                         color: Colors.grey,
        //                         size: Get.width * 0.045, // Responsive icon size
        //                       ),
        //                     ),
        //                   ],
        //                 )
        //
        //
        //
        //                 /* Row(
        //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                   children: [
        //                     Row(
        //                       children: [
        //                         Image.asset(_selectedDelivery == 'within_india_1' ?
        //                           'assets/images/icons/location.png': _selectedDelivery == 'within_india_2' ? 'assets/images/paymentimage/earth.png': 'assets/images/icons/location.png',
        //                           // Ensure correct asset path
        //                           width: 25,
        //                           fit: BoxFit.contain,
        //                           color: AppTheme
        //                               .grey, // Replace with your text color
        //                         ),
        //                         SizedBox(width: 8.0),
        //                         Text(_selectedDelivery == 'within_india_1' ?
        //                           'Enter Delivery Area or Pincode': _selectedDelivery == 'within_india_2' ?'Select Country' : 'Enter Delivery Area or Pincode',
        //                           style: TextStyle(
        //                             color: AppTheme.grey,
        //                             fontSize: 16.0,
        //                             fontWeight: FontWeight.bold
        //                           ),
        //                         ),
        //                       ],
        //                     ),
        //                     GestureDetector(
        //                       onTap: () {
        //                         Get.to(DeliveryLocationScreen());
        //                       },
        //                       child: Icon(Icons.arrow_forward_ios,
        //                           color: Colors.grey, size: 17.0),
        //                     ),
        //                   ],
        //                 ),*/
        //
        //
        //               ),
        //             ),
        //           ),
        //           SizedBox(height: 30),
        //           GestureDetector(
        //             onTap: () {
        //               Get.back();
        //
        //               // Navigator.of(context).pop();
        //             },
        //             child: Container(
        //               //width: double.infinity,
        //               height: 70,
        //               decoration: BoxDecoration(
        //                 color: AppTheme.continueshopping,
        //                 borderRadius: BorderRadius.zero,
        //               ),
        //               alignment: Alignment.center,
        //               child: Text(
        //                 'CONTINUE SHOPPING',
        //                 style: TextStyle(
        //                   fontWeight: FontWeight.bold,
        //                   fontSize: 16,
        //                   color: AppTheme.blackcolor,
        //                 ),
        //               ),
        //             ),
        //           ),
        //           SizedBox(height: 10),
        //         ],
        //       );
        //     },
        //   )),
        // );
      },
    );
  }

}
