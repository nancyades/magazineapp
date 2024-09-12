import 'package:aanma_nalam/constant/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EpubFile extends StatefulWidget {
  const EpubFile({super.key});

  @override
  State<EpubFile> createState() => _EpubFileState();
}

class _EpubFileState extends State<EpubFile> {
  final List<String> pages = [
    'assets/images/bookpages/epub1.png',
    'assets/images/bookpages/epub2.png',
    'assets/images/bookpages/epub2.png',
    'assets/images/bookpages/epub2.png',
    'assets/images/bookpages/epub2.png',

  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppTheme.onsecondary,
      appBar: AppBar(
        backgroundColor: AppTheme.onsecondary,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: AppTheme.whitecolor,),
          onPressed: () {

            Get.back();
          },
        ),
        centerTitle: false,
      ),
      body: Container(
        height: Get.height,
        decoration: BoxDecoration(
          color:  AppTheme.currentreadingbg,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                      "May 2024 Issue",
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          letterSpacing: 0.9,
                          decoration: TextDecoration.none,
                          fontSize: AppTheme.highMediumFontSize,
                          color: AppTheme.whitecolor,
                          fontWeight: FontWeight.w900)
                  ),
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(pages.length, (index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 8.0),
                            child: Text(
                              'page ${index + 1}',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              pages[index], // Load the image dynamically
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(height: 20),
                        ],
                      );
                    }),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
