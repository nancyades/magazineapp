import 'package:aanma_nalam/View/quiz/mainquiz.dart';
import 'package:aanma_nalam/View/shop/shopdashboard.dart';
import 'package:aanma_nalam/constant/app_theme.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _current = 0;
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
    double itemWidth = MediaQuery.of(context).size.width / 3;
    return Scaffold(

      body: Column(
        children: [
          Container(
            width: Get.width,
            height: 50,
            color: AppTheme.corecolor,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Greeting text
                Text(
                  'Hello, Guest',
                  style: TextStyle(
                    fontSize:16,
                    fontWeight: FontWeight.w800,
                    color: AppTheme.coretextcolor,
                  ),
                ),
                // Icon buttons and profile picture with notification badge
                Row(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/icons/Coins Icons.png', // Ensure correct path
                          width: 25,
                          height: 25,
                          color: AppTheme.coretextcolor,
                        ),
                        SizedBox(width: 3,),
                        // Count Badge
                        Container(
                          margin: EdgeInsets.only(left: 2.0),
                          padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          constraints: BoxConstraints(
                            minWidth: 16,
                            minHeight: 16,
                          ),
                          child: Text(
                            '20',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 8.0),
                    // Shopping Icon with Count
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/icons/Shopping icon.png', // Ensure correct path
                          width: 25,
                          height: 20,
                          color: AppTheme.coretextcolor,
                        ),
                        // Count Badge
                        Container(
                          margin: EdgeInsets.only(left: 2.0),
                          padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          constraints: BoxConstraints(
                            minWidth: 16,
                            minHeight: 16,
                          ),
                          child: Text(
                            '05',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 8.0),
                    // Profile Picture with Badge
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0,bottom: 8),
                          child: CircleAvatar(
                            radius: 16.0,
                            backgroundImage: AssetImage('assets/images/icons/Ellipse 39.png'), // Ensure correct path
                          ),
                        ),
                        Positioned(
                          right: 4,
                          bottom: 4,
                          child: Container(
                            width: 13,
                            height: 13,
                            padding: EdgeInsets.all(1.0),
                            decoration: BoxDecoration(
                              color:  AppTheme.coretextcolor,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.add, color: Colors.white, size: 11.0),
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
              height: 140.0,
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
          Padding(
            padding: const EdgeInsets.all(8.0),
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
          // Magazine List
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: Get.width,
                    height: 230,
                    color: AppTheme.magazinebgcolor,
                    child: Column(
                      children: [


                        Container(
                          child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.0,vertical: 0),
                              child: Text(
                                'Read',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: AppTheme.coretextcolor,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 0),
                              child: Container(
                                height: 35,
                                child: TextButton(
                                  onPressed: () {
                                    Get.toNamed('/magazine');
                                  },
                                  child: Text(
                                    'See All',
                                    style: TextStyle(
                                      color: AppTheme.seeallcolor,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                                              ),
                        ),
                        Column(
                          children: [
                            Container(
                              height: 180, // Height for the entire ListView
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
                                        padding: const EdgeInsets.only(right: 10.0, left: 10),
                                        child: Container(
                                          width:  itemWidth - 20,
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
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                     // borderRadius: BorderRadius.circular(10),
                                                      image: DecorationImage(
                                                        image: AssetImage(books[index].imageUrl),
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(bottom: 4.0,  left: 8, right: 8),
                                                  child: Text(
                                                    books[index].month,
                                                    style: TextStyle(
                                                      color: AppTheme.seeallcolor,
                                                      fontSize: 11,
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 18.0),
                    child: Wrap(
                      spacing: 12.0, // Space between items
                      runSpacing: 12.0, // Space between rows
                      alignment: WrapAlignment.center, // Center the children
                      children: [
                        // Shop Button
                        Padding(
                          padding: EdgeInsets.only(left: 6),
                          child: Container(
                            height: 200,
                            width: MediaQuery.of(context).size.width * 0.45, // Make the width responsive
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(9.0),
                              image: DecorationImage(
                                image: AssetImage('assets/images/icons/quizplay.png'), // Replace with your asset image path
                                fit: BoxFit.fill,
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
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 150),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      _showLanguageDialog(context);
                                      //  Get.toNamed('/levels');
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppTheme.corecolor,

                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(7),
                                      ),
                                      minimumSize: Size(100, 30), // Set the width and height
                                    ),
                                    child: Text(
                                      'PLAY',
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
                        ),

                        // Start Button
                        Container(
                          height: 200,
                          width: MediaQuery.of(context).size.width * 0.45, // Make the width responsive
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(9.0),
                            image: DecorationImage(
                              image: AssetImage('assets/images/icons/shoping.png'), // Replace with your asset image path
                              fit: BoxFit.fill,
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

                            children: [
                              Padding(
                                padding: const EdgeInsets.only( top: 150),
                                child: ElevatedButton(
                                  onPressed: () {
                                    Get.to(ShopHomePage());
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:  Colors.blueGrey,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(7),
                                    ),
                                    minimumSize: Size(100, 30),
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
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),


      ],
      ),
    );
  }



  final List<Book> books = [
    Book(
        imageUrl: 'assets/images/icons/samplebook.png',
        title: 'Book Title 1',
        month: 'JANUARY 2024'),
    Book(
        imageUrl: 'assets/images/icons/samplebook.png',
        title: 'Book Title 2',
        month: 'FEBRUARY 2024'),
    Book(
        imageUrl: 'assets/images/icons/samplebook.png',
        title: 'Book Title 3',
        month: 'MARCH 2024'),
    Book(
        imageUrl: 'assets/images/icons/samplebook.png',
        title: 'Book Title 1',
        month: 'APRIL 2024'),
    Book(
        imageUrl: 'assets/images/icons/samplebook.png',
        title: 'Book Title 2',
        month: 'MAY 2024'),
    Book(
        imageUrl: 'assets/images/icons/samplebook.png',
        title: 'Book Title 3',
        month: 'JUNE 2024'),
    Book(
        imageUrl: 'assets/images/icons/samplebook.png',
        title: 'Book Title 1',
        month: 'JULY 2024'),
    Book(
        imageUrl: 'assets/images/icons/samplebook.png',
        title: 'Book Title 2',
        month: 'AUGUST 2024'),


  ];
}









void _showLanguageDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return

      AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        backgroundColor: AppTheme.whitecolor,
        content: Container(
          padding: EdgeInsets.zero,
          height: Get.height * 0.15, // Dialog height is 15% of the screen height
          width: Get.width * 1,   // Dialog width is 90% of the screen width
          child: Column(
            mainAxisSize: MainAxisSize.min, // Dynamically adjust the size
            children: <Widget>[
              SizedBox(height: Get.height * 0.04,),
              Text(
                'Choose Your Language',
                style: TextStyle(
                  fontSize: AppTheme.mediumFontSize,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.grey,
                ),
              ),

              SizedBox(height: Get.height * 0.02,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      Get.back(); // Close the dialog
                      print('Tamil selected');
                      // Handle Tamil language selection
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.grey,
                      minimumSize: Size(Get.width * 0.27, 30), // Button width is 35% of screen width
                    ),
                    child: Text(
                      'Tamil',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.off(() => QuizchallengeScreen()); // Navigate to QuizchallengeScreen
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.corecolor,
                      minimumSize: Size(Get.width * 0.27, 30), // Button width is 35% of screen width
                    ),
                    child: Text(
                      'English',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ],
              ),
              Spacer(), // Adjust spacing dynamically
            ],
          ),
        ),
      );

    },
  );
}





class Book {
  final String imageUrl;
  final String title;
  final String month;

  Book({required this.imageUrl, required this.title, required this.month});
}








