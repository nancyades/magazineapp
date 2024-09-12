import 'package:aanma_nalam/constant/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

class ReadingBooks extends StatefulWidget {
  const ReadingBooks({super.key});

  @override
  State<ReadingBooks> createState() => _ReadingBooksState();
}

class _ReadingBooksState extends State<ReadingBooks> {
  List<Map<String, String>> articles = [
    {
      'imageUrl': 'assets/images/articlesimages/image1.jpg',
      'title': 'மத்தேயுவின் வாக்குகளும் இயேசு ஏறொது அரசன் காலத்தில் பிறந்தார்',
      'description': 'கூறுவதால் ஏரோது இறந்த ஆண்டாகிய கி. மு. 4ஆம் ஆண்டில், அல்லது அதற்கு ஓரிரு ஆண்டுகளுக்கு முன்னர் இயேசு பிறந்தார் என்பது பொருந்தும் என்பது வரலாற்றாசிரியர் கருத்து',
    },
    {
      'imageUrl': 'assets/images/articlesimages/image2.jpg',
      'title': 'மத்தேயுவின் வாக்குகளும் இயேசு ஏறொது',
      'description': 'கூறுவதால் ஏரோது இறந்த ஆண்டாகிய கி. மு. 4ஆம் ஆண்டில், அல்லது அதற்கு ஓரிரு ஆண்டுகளுக்கு முன்னர் இயேசு பிறந்தார் என்பது பொருந்தும் என்பது வரலாற்றாசிரியர் கருத்து',
    },
    {
      'imageUrl': 'assets/images/articlesimages/image3.jpg',
      'title': 'மத்தேயுவின் வாக்குகளும் இயேசு ஏறொது',
      'description': 'சூரியனைவிட பிரகாசமாக ஒளிரும் நட்சத்திரம் ...',
    },
  ];

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
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
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
                      hintStyle: TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: AppTheme.whitecolor,
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 20.0),
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

          // First Article Card
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: articles.length,
              itemBuilder: (context, index) {
                return Articlecard(
                  index: index,
                  imageUrl: articles[index]['imageUrl']!,
                  title: articles[index]['title']!,
                  description: articles[index]['description']!,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Articlecard extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String description;
  final int index;

  const Articlecard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.index,
  });

  @override
  State<Articlecard> createState() => _ArticlecardState();
}

class _ArticlecardState extends State<Articlecard> {
  String shareLink = 'https://silver-sophie-49.tiiny.site';



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: AppTheme.articlebgcolor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            Padding(
              padding: const EdgeInsets.only(top: 30.0, left: 10.0, right: 10.0),
              child: ClipRRect(
                child: Image.asset(
                  widget.imageUrl,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Title and Description
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    widget.description,
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),

            // Share and Play Buttons
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 12.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      _shareContent();
                     // _showBottomSheet(context);
                    },
                    child: Icon(Icons.share, color: AppTheme.blackcolor),
                  ),
                  widget.index == 0
                      ? Icon(Icons.play_circle_fill, color: AppTheme.corecolor)
                      : GestureDetector(
                      onTap: () {
                        Get.toNamed('/pdffiles');
                      },
                      child: Icon(Icons.picture_as_pdf,
                          color: AppTheme.corecolor)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  // Handle sharing the content
  void _shareContent() {
    String platformMessage;
    Share.share(shareLink);

  }
}
