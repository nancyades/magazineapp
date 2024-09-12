import 'package:aanma_nalam/View/homescreen.dart';
import 'package:aanma_nalam/constant/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Magazine extends StatefulWidget {
  const Magazine({super.key});

  @override
  State<Magazine> createState() => _MagazineState();
}

class _MagazineState extends State<Magazine> {
  String? selectedYear;
  String? selectedMonth;

  final List<int> years = [2024, 2023, 2022, 2021, 2020, 2019];
  final Map<int, List<Book>> booksByYear = {
    2024: [
      Book(imageUrl: 'assets/images/Books-Wrapper/final/2024/jan.jpg', title: 'Book Title 1', month: 'January'),
      Book(imageUrl: 'assets/images/Books-Wrapper/final/2024/feb.jpg', title: 'Book Title 2', month: 'February'),
      Book(imageUrl: 'assets/images/Books-Wrapper/final/2024/march.jpg', title: 'Book Title 3', month: 'March'),
      Book(imageUrl: 'assets/images/Books-Wrapper/final/2024/april.jpg', title: 'Book Title 4', month: 'April'),
      Book(imageUrl: 'assets/images/Books-Wrapper/final/2024/may.jpg', title: 'Book Title 5', month: 'May'),
      Book(imageUrl: 'assets/images/Books-Wrapper/final/2024/june.jpg', title: 'Book Title 6', month: 'June'),
      Book(imageUrl: 'assets/images/Books-Wrapper/final/2024/july.jpg', title: 'Book Title 7', month: 'July'),
      Book(imageUrl: 'assets/images/Books-Wrapper/final/2024/aug.jpg', title: 'Book Title 8', month: 'August'),
      Book(imageUrl: 'assets/images/Books-Wrapper/final/2024/aug.jpg', title: 'Book Title 9', month: 'September'),
      // Add more months as necessary
    ],
    2023: [
      Book(imageUrl: 'assets/images/Books-Wrapper/final/2023/jan.jpg', title: 'Book Title 1', month: 'January'),
      Book(imageUrl: 'assets/images/Books-Wrapper/final/2023/feb.jpg', title: 'Book Title 2', month: 'February'),
      Book(imageUrl: 'assets/images/Books-Wrapper/final/2023/march.jpg', title: 'Book Title 3', month: 'March'),
      Book(imageUrl: 'assets/images/Books-Wrapper/final/2023/april.jpg', title: 'Book Title 4', month: 'April'),
      Book(imageUrl: 'assets/images/Books-Wrapper/final/2023/may.jpg', title: 'Book Title 5', month: 'May'),
      Book(imageUrl: 'assets/images/Books-Wrapper/final/2023/june.jpg', title: 'Book Title 6', month: 'June'),
      Book(imageUrl: 'assets/images/Books-Wrapper/final/2023/july.jpg', title: 'Book Title 7', month: 'July'),
      Book(imageUrl: 'assets/images/Books-Wrapper/final/2023/aug.jpg', title: 'Book Title 8', month: 'August'),
      Book(imageUrl: 'assets/images/Books-Wrapper/final/2023/aug.jpg', title: 'Book Title 9', month: 'September'),
      // Add more months as necessary
    ],
    // Add more years as necessary
  };

  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: Get.width,
            height: 50,
            color: AppTheme.corecolor,
          ),
          Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Image.asset(
                        'assets/images/icons/Vector.png',
                        width: 15,
                        height: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      filled: true,
                      fillColor: AppTheme.whitecolor,
                      contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(color: Colors.grey, width: 2.0),
                      ),
                      suffixIcon: Icon(Icons.search, color: Colors.grey),
                    ),
                  ),
                ),
              ),
            ],
          ),


          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownButton<String>(
                  value: selectedYear,
                  items: years.map((int year) {
                    return DropdownMenuItem<String>(
                      value: year.toString(),
                      child: Text(year.toString()),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedYear = newValue;
                    });
                  },
                  hint: Text(
                    'Year',
                    style: TextStyle(color: AppTheme.blackcolor, fontSize: 14.0),
                  ),
                  underline: SizedBox(),
                  icon: Icon(Icons.arrow_drop_down, color: AppTheme.corecolor),
                  style: TextStyle(
                    color: AppTheme.blackcolor,
                    fontSize: 14.0,
                  ),
                  dropdownColor: Colors.white,
                ),
                DropdownButton<String>(
                  value: selectedMonth,
                  items: [
                    'January',
                    'February',
                    'March',
                    'April',
                    'May',
                    'June',
                    'July',
                    'August',
                    'September',
                    'October',
                    'November',
                    'December'
                  ].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedMonth = newValue;
                    });
                  },
                  hint: Text(
                    'Month',
                    style: TextStyle(color: AppTheme.blackcolor, fontSize: 14.0),
                  ),
                  underline: SizedBox(),
                  icon: Icon(Icons.arrow_drop_down, color: AppTheme.corecolor),
                  style: TextStyle(
                    color: AppTheme.blackcolor,
                    fontSize: 14.0,
                  ),
                  dropdownColor: Colors.white,
                ),
              ],
            ),
          ),
      Expanded(
        child: Container(

          decoration: BoxDecoration(
            color: AppTheme.yearbgcolor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0),
              topRight: Radius.circular(15.0),
            ),
          ),

          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: years.length,
            itemBuilder: (context, yearIndex) {
              final int year = years[yearIndex];
              final List<Book>? books = booksByYear[year];

              if (books == null || books.isEmpty) return SizedBox.shrink();

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        year.toString(),
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppTheme.whitecolor,
                        borderRadius: BorderRadius.circular(15.0), // Apply the same radius to all corners
                      ),

                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: GridView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: books.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 0.7,
                          ),
                          itemBuilder: (context, monthIndex) {
                            final Book book = books[monthIndex];
                            return GestureDetector(
                              onTap: () {
                                /*setState(() {
                                  _selectedIndex = monthIndex;
                                });*/

                                Get.toNamed('/readingbooks');
                              },
                              child: Container(
                                width: 120,
                                decoration: BoxDecoration(
                                  color: AppTheme.bookcolor,
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                    color: _selectedIndex == monthIndex
                                        ? Colors.red
                                        : AppTheme.coretextcolor,
                                    width: 1,
                                  ),
                                  boxShadow: [
                                    _selectedIndex == monthIndex
                                        ? BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      spreadRadius: 1,
                                      blurRadius: 3,
                                      offset: Offset(0, 3),
                                    )
                                        : BoxShadow(
                                      color: Colors.transparent,
                                    )
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 6.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center, // Center content vertically
                                    children: [
                                      Flexible(
                                        child: Container(
                                          width: 89,
                                          height: 150, // Keep the height of the Card unchanged
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            image: DecorationImage(
                                              image: AssetImage(books[monthIndex].imageUrl),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(bottom: 4.0, top: 2),
                                        child: Text(
                                          books[monthIndex].month,
                                          style: TextStyle(
                                            color: AppTheme.blackcolor,
                                            fontSize: AppTheme.verySmallFontSize,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      )

      ],
      ),
    );
  }
}

class Book {
  final String imageUrl;
  final String title;
  final String month;

  Book({required this.imageUrl, required this.title, required this.month});
}
