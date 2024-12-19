import 'package:aanma_nalam/Controllers/quizcontroller.dart';
import 'package:aanma_nalam/View/booklist/epubfile.dart';
import 'package:aanma_nalam/View/booklist/magazine.dart';
import 'package:aanma_nalam/View/booklist/pdffile.dart';
import 'package:aanma_nalam/View/booklist/readingmagazine.dart';
import 'package:aanma_nalam/View/booklist/videofile.dart';
import 'package:aanma_nalam/View/carouselintroscreen.dart';
import 'package:aanma_nalam/View/leaderboard.dart';
import 'package:aanma_nalam/View/loginscreens/loginscreen.dart';
import 'package:aanma_nalam/View/loginscreens/loginsuccess.dart';
import 'package:aanma_nalam/View/more/myprofile.dart';
import 'package:aanma_nalam/View/notification.dart';
import 'package:aanma_nalam/View/quiz/booklist.dart';
import 'package:aanma_nalam/View/quiz/levels.dart';
import 'package:aanma_nalam/View/quiz/playquiz.dart';
import 'package:aanma_nalam/View/quiz/scoreboardscreen.dart';
import 'package:aanma_nalam/View/setting.dart';
import 'package:aanma_nalam/View/signupscreens/confirmemailscreen.dart';
import 'package:aanma_nalam/View/signupscreens/createaccountscreen.dart';
import 'package:aanma_nalam/View/signupscreens/signupscreen.dart';
import 'package:aanma_nalam/View/splashscreen.dart';
import 'package:aanma_nalam/constant/app_theme.dart';
import 'package:aanma_nalam/constant/mainscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() {
  Get.put(QuizController());
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Poppins',
         // colorScheme: ColorScheme.fromSeed(seedColor: AppTheme.whitecolor),
          useMaterial3: true,
        ),
      initialRoute: '/',
      getPages: [
      /*  GetPage(
          name: '/',
          page: () => SplashScreens(),
          transition: Transition.circularReveal, // Use Circular Reveal Transition
          transitionDuration: Duration(seconds: 2), // Set custom duration for the transition
        ),*/

        GetPage(name: '/', page: () => SplashScreens()),
        GetPage(name: '/carouselintroscreen', page: () => CarouselIntroScreen()),
        GetPage(name: '/loginscreen', page: () => LoginScreen()),
        GetPage(name: '/loginsuccess', page: () => LoginSuccess()),
        GetPage(name: '/createaccountscreen', page: () => CreateAccountScreen()),
        GetPage(name: '/signupscreen', page: () => SignUpScreen()),
        GetPage(name: '/confirmemailscreen', page: () => ConfirmEmailScreen()),





        GetPage(name: '/homescreen', page: () => MainScreen()),
        GetPage(name: '/leaderboard', page: () => LeaderBoard()),
        GetPage(name: '/setting', page: () => Setting()),
        GetPage(name: '/myprofile', page: () => MyProfile()),
        GetPage(name: '/booklist', page: () => BookList()),
        GetPage(name: '/levels', page: () => Levels()),
        GetPage(name: '/playquiz', page: () => PlayQuiz()),
        GetPage(name: '/scoreboard', page: () => Scoreboard()),
        GetPage(name: '/magazine', page: () => Magazine()),
        GetPage(name: '/readingbooks', page: () => ReadingBooks()),
        GetPage(name: '/pdffiles', page: () => PDFFiles()),
        GetPage(name: '/epubfile', page: () => EpubFile()),
        GetPage(name: '/videofile', page: () => VideoFile()),
        GetPage(name: '/notificationscreen', page: () => NotificationScreen()),















      ],
    );
  }
}






