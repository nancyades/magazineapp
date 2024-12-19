import 'package:aanma_nalam/View/shop/shopmorepage.dart';
import 'package:aanma_nalam/constant/app_theme.dart';
import 'package:aanma_nalam/constant/topmenu.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShopHomePage extends StatefulWidget {
  const ShopHomePage({super.key});

  @override
  State<ShopHomePage> createState() => _ShopHomePageState();
}

class _ShopHomePageState extends State<ShopHomePage> {
  // Sample data for categories
  final List<Map<String, String>> categories = [
    {
      'title': 'Elevate your walls with faith.',
      'image': 'assets/images/icons/Rectangle.png',
    },
    {
      'title': 'Decorate with style.',
      'image': 'assets/images/icons/Rectangle.png',
    },
    {
      'title': 'Inspirational Quotes.',
      'image': 'assets/images/icons/Rectangle.png',
    },
    {
      'title': 'Nature Inspired Art.',
      'image': 'assets/images/icons/Rectangle.png',
    },
  ];

  final List<String> imageList = [
    'assets/images/icons/Frame.png',
    'assets/images/icons/Frame.png',
    'assets/images/icons/Frame.png',
  ];

  int _current = 0;

  bool _isClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomHeaderContainer(),
          Padding(
            padding: const EdgeInsets.only(
                top: 16.0, left: 16, right: 16, bottom: 16),
            child: Row(
              children: [
                Image.asset(
                  'assets/images/shoplogo.png', // Ensure correct path
                  width: 115,
                  height: 60,
                  color: AppTheme.corecolor,
                  fit: BoxFit.contain,
                ),
                SizedBox(width: 10),
                Expanded(
                  child: SizedBox(
                    height: 38,
                    child: TextField(
                      style: TextStyle(color: AppTheme.grey),
                      decoration: InputDecoration(
                        hintText: 'Search',
                        hintStyle: TextStyle(
                          color:AppTheme.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.bold

                        ),
                        filled: true,
                        fillColor: AppTheme.whitecolor,
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 4.0, horizontal: 20.0), // Reduced vertical padding
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.grey, width: 1.5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.grey, width: 1.5),
                        ),
                        prefixIcon: Container(
                        height: 10, // Set desired height
                        width: 10,  // Set desired width
                        padding: EdgeInsets.all( 8), // Optional padding for additional control
                        child: Image.asset(
                          'assets/images/icons/Search icon.png',
                          color: AppTheme.grey,
                          fit: BoxFit.contain,
                        ),
                      ),

                      ),
                    ),
                  ),
                ),

                SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isClicked = !_isClicked; // Toggle the state
                    });
                  },
                  child: SizedBox(
                    width: 30,
                    height: 30,
                    child: Image.asset(
                      _isClicked
                          ? 'assets/images/paymentimage/FILL HEART.png' // Image for clicked state
                          : 'assets/images/paymentimage/heart.png', // Image for unclicked state
                      color:_isClicked ?AppTheme.corecolor  : AppTheme.coretextcolor,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
          ),

          CarouselSlider(
            options: CarouselOptions(
              height: 170.0,
              autoPlay: false,
              enlargeCenterPage: true,
              enableInfiniteScroll: true,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
            ),
            items: imageList.map((item) {
              return Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: AssetImage(item),
                    fit: BoxFit.contain,
                  ),
                ),
              );
            }).toList(),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imageList.asMap().entries.map((entry) {
                return Padding(
                  padding: const EdgeInsets.only(top: 3.0, bottom: 12.0),
                  child: GestureDetector(
                    onTap: () => setState(() {
                      _current = entry.key;
                    }),
                    child: Container(
                      width: 6,
                      height: 6,
                      margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 2.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _current == entry.key
                            ? AppTheme.corecolor // Active dot color
                            : Colors.grey, // Inactive dot color
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          // Categories Section Title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Text(
              "Categories",
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.categoriescolor),
            ),
          ),
          SizedBox(height: 10),
          // Make only this section scrollable
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: Get.height * 0.02), // Dynamic bottom padding
                    child: Stack(
                      children: [
                        // Background Image
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12), // Optional: Add rounded corners
                          child: Image.asset(
                            categories[index]['image']!,
                            height: Get.height * 0.45, // Dynamic height for responsiveness
                            width: Get.width, // Full screen width
                            fit: BoxFit.contain,
                          ),
                        ),

                        // Positioned Button
                        Positioned(
                          bottom: Get.height * 0.025, // Adjust bottom based on screen height
                          right: Get.width * 0.35, // Adjust right based on screen width
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              minimumSize: Size(Get.width * 0.3, Get.height * 0.05), // Dynamic button size
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            onPressed: () {
                              Get.to(ShopMoreScreen()); // Navigate to another screen
                            },
                            child: Text(
                              'See More',
                              style: TextStyle(
                                color: AppTheme.blackcolor,
                                fontSize: Get.width * 0.04, // Dynamic font size based on width
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );



                  // Padding(
                  //   padding: const EdgeInsets.only(bottom: 22.0),
                  //   child: Stack(
                  //     children: [
                  //       ClipRRect(
                  //         child: Image.asset(
                  //           categories[index]['image']!,
                  //           height: 390,
                  //           width: double.infinity,
                  //           fit: BoxFit.contain,
                  //         ),
                  //       ),
                  //
                  //       Positioned(
                  //         bottom: Get.height * 0.035, // Adjust bottom based on screen height
                  //         right: Get.width * 0.3, // Adjust right based on screen width
                  //         child: ElevatedButton(
                  //           style: ElevatedButton.styleFrom(
                  //             backgroundColor: Colors.white,
                  //             minimumSize: Size(Get.width * 0.2, Get.height * 0.05), // Dynamic size
                  //             shape: RoundedRectangleBorder(
                  //               borderRadius: BorderRadius.circular(8.0),
                  //             ),
                  //           ),
                  //           onPressed: () {
                  //             Get.to(ShopMoreScreen()); // Navigate to another screen
                  //           },
                  //           child: Text(
                  //             'See More',
                  //             style: TextStyle(
                  //               color: AppTheme.blackcolor,
                  //               fontSize: Get.width * 0.04, // Dynamic font size based on width
                  //               fontWeight: FontWeight.bold,
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //
                  //
                  //
                  //
                  //       /* Positioned(
                  //         bottom: 15,
                  //         right: 120,
                  //         child: ElevatedButton(
                  //           style: ElevatedButton.styleFrom(
                  //             backgroundColor: Colors.white,
                  //
                  //             minimumSize: Size(102, 40),
                  //             shape: RoundedRectangleBorder(
                  //               borderRadius: BorderRadius.circular(8.0),
                  //             ),
                  //           ),
                  //           onPressed: () {
                  //             Get.to(ShopMoreScreen());
                  //
                  //             // Handle see more action
                  //           },
                  //           child: Text(
                  //             'See More',
                  //             style: TextStyle(color: AppTheme.blackcolor, fontSize: 17, fontWeight: FontWeight.bold),
                  //           ),
                  //         ),
                  //       ),*/
                  //     ],
                  //   ),
                  // );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
