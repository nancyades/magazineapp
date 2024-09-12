import 'package:aanma_nalam/constant/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookList extends StatefulWidget {
  const BookList({super.key});

  @override
  State<BookList> createState() => _BookListState();
}

class _BookListState extends State<BookList> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.onsecondary,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: AppTheme.whitecolor,),
          onPressed: () {

            Get.back();
          },
        ),
        title: Text('Choose to Play',style: TextStyle(
            fontFamily: 'Poppins',
            letterSpacing: 0.9,
            decoration: TextDecoration.none,
            fontSize: AppTheme.highMediumFontSize,
            color: AppTheme.whitecolor,
            fontWeight: FontWeight.w900),),
        centerTitle: false,
      ),
      body: Container(
        decoration: const BoxDecoration(
            color: AppTheme.onsecondary
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: books.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
                    child: Container(
                      height: 70,
                      decoration: BoxDecoration(
                        color: AppTheme.playquizcontainer,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        leading: Image.asset(
                          'assets/images/icons/solar_book-broken.png',
                          width: 30,
                          height: 30,
                        ),
                        title: Text(
                            books[index],
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: AppTheme.mediumFontSize,
                                color: AppTheme.blackcolor,
                                fontWeight: FontWeight.w900)
                        ),
                        trailing: GestureDetector(
                          onTap: (){
                            Get.toNamed('/levels');

                          },
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppTheme.quizbg,
                            ),
                            child: Icon(Icons.arrow_forward_ios,color: AppTheme.whitecolor,size: 15,),
                          ),
                        ),


                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),

      ),


    );
  }


  List<String> books = [
    // Old Testament
    "Genesis", "Exodus", "Leviticus", "Numbers", "Deuteronomy", // Pentateuch
    "Joshua", "Judges", "Ruth", "1 Samuel", "2 Samuel", "1 Kings", "2 Kings", // Historical Books
    "1 Chronicles", "2 Chronicles", "Ezra", "Nehemiah", "Esther", // Historical Books
    "Job", "Psalms", "Proverbs", "Ecclesiastes", "Song of Solomon", // Wisdom Books
    "Isaiah", "Jeremiah", "Lamentations", "Ezekiel", "Daniel", // Major Prophets
    "Hosea", "Joel", "Amos", "Obadiah", "Jonah", "Micah", "Nahum", "Habakkuk", "Zephaniah", "Haggai", "Zechariah", "Malachi", // Minor Prophets

    // New Testament
    "Matthew", "Mark", "Luke", "John", // Gospels
    "Acts", // Historical Book
    "Romans", "1 Corinthians", "2 Corinthians", "Galatians", "Ephesians", "Philippians", "Colossians", "1 Thessalonians", "2 Thessalonians", "1 Timothy", "2 Timothy", "Titus", "Philemon", "Hebrews", // Epistles
    "James", "1 Peter", "2 Peter", "1 John", "2 John", "3 John", "Jude", // General Epistles
    "Revelation" // Prophecy
  ];

}
