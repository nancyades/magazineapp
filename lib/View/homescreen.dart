import 'package:aanma_nalam/constant/app_theme.dart';
import 'package:aanma_nalam/constant/customnavbar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _current = 0;
  final PageController _pageController = PageController(
    initialPage: 0, // Start with the first item
    viewportFraction: 0.33, // Adjust this value based on how much of the page you want to show
  );

  int _selectedIndex = -1;


  final List<String> imageList = [
    'assets/images/icons/banner.png',
    'assets/images/icons/banner.png',
    'assets/images/icons/banner.png',
  ];
  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: Get.width,
              height: 50,
              color: AppTheme.corecolor,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Greeting text
                  Text(
                    'Hello, Guest',
                    style: TextStyle(
                      fontSize:AppTheme.highMediumFontSize,
                      fontWeight: FontWeight.w800,
                      color: AppTheme.coretextcolor,
                    ),
                  ),
                  // Icon buttons and profile picture with notification badge
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/icons/Coins Icons.png', // Replace with your asset image path
                        width: 25,
                        height: 25,
                      ),
                      // Icon 1 with count
                      Padding(
                        padding: const EdgeInsets.only(left: 4.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          constraints: BoxConstraints(
                            minWidth: 16,
                            minHeight: 16,
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(
                                '20',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w800,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 5.0),
                      // Icon 2 with count
                      Image.asset(
                        'assets/images/icons/Shopping icon.png', // Replace with your asset image path
                        width: 25,
                        height: 25,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 4.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          constraints: BoxConstraints(
                            minWidth: 16,
                            minHeight: 16,
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(
                                '05',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w800,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(width: 5.0),
                      // Profile picture with badge
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          CircleAvatar(
                            radius: 16.0,
                            backgroundImage: AssetImage('assets/images/icons/Ellipse 39.png'), // replace with your image path
                          ),
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: Container(
                              padding: EdgeInsets.all(2.0),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Icon(Icons.add, color: Colors.white, size: 12.0),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Banner Section
            CarouselSlider(
              options: CarouselOptions(
                height: 160.0,
                autoPlay: true,
                enlargeCenterPage: true,
                enableInfiniteScroll: true,
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                },
              ),
              items: imageList.map((item) => Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  //width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: AssetImage(item),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              )).toList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imageList.asMap().entries.map((entry) {
                return Padding(
                  padding: const EdgeInsets.only(top: 3.0, bottom: 12.0),
                  child: GestureDetector(
                    onTap: () => setState(() {
                      _current = entry.key;
                    }),
                    child: Container(
                      width: 8,
                      height: 8,
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
            // Magazine List
            Container(
              width: Get.width,
              height: 246,
              color: AppTheme.magazinebgcolor,
              child: Column(
                children: [


                  Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 0),
                      child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Read Magazine',
                          style: TextStyle(
                            color: AppTheme.coretextcolor,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Container(
                          height: 35,
                          child: TextButton(
                            onPressed: () {
                              Get.toNamed('/magazine');
                            },
                            child: Text(
                              'See All',
                              style: TextStyle(
                                color: AppTheme.seeallcolor,
                                fontSize: AppTheme.smallFontSize,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    ),
                  ),
                  Column(
                    children: [
                      Container(

                        height: 200, // Height for the entire ListView
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 8.0,top: 3),
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: books.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _selectedIndex = index;
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: 120,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(
                                        color: _selectedIndex == index
                                            ? Colors.red
                                            : AppTheme.coretextcolor,
                                        width: 1,
                                      ),
                                      boxShadow: [
                                        _selectedIndex == index
                                            ? BoxShadow(
                                          color: Colors.grey.withOpacity(0.3),
                                          spreadRadius: 2,
                                          blurRadius: 5,
                                          offset: Offset(0, 3),
                                        )
                                            : BoxShadow(
                                          color: Colors.transparent,
                                        )
                                      ],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center, // Center content vertically
                                        children: [
                                          Flexible(
                                            child: Card(
                                              elevation: 7,
                                              child: Container(
                                                width: 90,
                                                height: 140, // Keep the height of the Card unchanged
                                                decoration: BoxDecoration(
                                                 // borderRadius: BorderRadius.circular(10),
                                                  image: DecorationImage(
                                                    image: AssetImage(books[index].imageUrl),
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(bottom: 4.0, top: 2),
                                            child: Text(
                                              books[index].month,
                                              style: TextStyle(
                                                color: AppTheme.seeallcolor,
                                                fontSize: AppTheme.verySmallFontSize,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      Container(
                        height: 10,

                      )
                    ],
                  )


                ],
              )

            ),

            // Bottom Buttons
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 18.0),
          child: Wrap(
            spacing: 12.0, // Space between items
            runSpacing: 12.0, // Space between rows
            alignment: WrapAlignment.center, // Center the children
            children: [
              // Shop Button
              Container(
                height: 182,
                width: MediaQuery.of(context).size.width * 0.42, // Make the width responsive
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.0),
                  image: DecorationImage(
                    image: AssetImage('assets/images/icons/shop.jpg'), // Replace with your asset image path
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueGrey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7),
                          ),
                          minimumSize: Size(100, 33), // Set the width and height
                        ),
                        child: Text(
                          'SHOP',
                          style: TextStyle(
                            color: AppTheme.whitecolor,
                            fontSize: AppTheme.mediumFontSize,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Start Button
              Container(
                height: 182,
                width: MediaQuery.of(context).size.width * 0.42, // Make the width responsive
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.0),
                  image: DecorationImage(
                    image: AssetImage('assets/images/icons/shop.jpg'), // Replace with your asset image path
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: ElevatedButton(
                        onPressed: () {
                          Get.toNamed('/levels');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppTheme.corecolor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7),
                          ),
                          minimumSize: Size(100, 33),
                        ),
                        child: Text(
                          'Start',
                          style: TextStyle(
                            color: AppTheme.whitecolor,
                            fontSize: AppTheme.mediumFontSize,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )

        ],
        ),
      ),
    );
  }
  final List<
      Book> books = [
    Book(
        imageUrl: 'assets/images/Books-Wrapper/final/2024/jan.jpg',
        title: 'Book Title 1',
        month: 'JANUARY'),
    Book(
        imageUrl: 'assets/images/Books-Wrapper/final/2024/feb.jpg',
        title: 'Book Title 2',
        month: 'FEBRUARY'),
    Book(
        imageUrl: 'assets/images/Books-Wrapper/final/2024/march.jpg',
        title: 'Book Title 3',
        month: 'MARCH'),
    Book(
        imageUrl: 'assets/images/Books-Wrapper/final/2024/april.jpg',
        title: 'Book Title 1',
        month: 'APRIL'),
    Book(
        imageUrl: 'assets/images/Books-Wrapper/final/2024/may.jpg',
        title: 'Book Title 2',
        month: 'MAY'),
    Book(
        imageUrl: 'assets/images/Books-Wrapper/final/2024/june.jpg',
        title: 'Book Title 3',
        month: 'JUNE'),
    Book(
        imageUrl: 'assets/images/Books-Wrapper/final/2024/july.jpg',
        title: 'Book Title 1',
        month: 'JULY'),
    Book(
        imageUrl: 'assets/images/Books-Wrapper/final/2024/aug.jpg',
        title: 'Book Title 2',
        month: 'AUGUST'),


  ];
}





class Book {
  final String imageUrl;
  final String title;
  final String month;

  Book({required this.imageUrl, required this.title, required this.month});
}








