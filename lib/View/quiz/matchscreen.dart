import 'package:aanma_nalam/Controllers/quizcontroller.dart';
import 'package:aanma_nalam/View/quiz/quizscreen.dart';
import 'package:aanma_nalam/constant/app_theme.dart';
import 'package:aanma_nalam/constant/topmenu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MatchScreen extends StatefulWidget {

   MatchScreen({super.key, });

  @override
  State<MatchScreen> createState() => _MatchScreenState();
}

class _MatchScreenState extends State<MatchScreen> {

  @override
  void initState() {
    super.initState();
    Get.find<QuizController>().resetQuiz();

    Future.delayed(Duration(seconds: 2), () {
      Get.off(QuizScreen(), transition: Transition.cupertino, duration: Duration(seconds: 1));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Column(
        children: [
          CustomHeaderContainer(),
          SizedBox(height: 350,),
          // Player avatars and lightning icon
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // First player
              Column(
                children: [
                  /*Container(
                    width: 80, // Diameter of the border (radius + padding)
                    height: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.black, // Border color
                        width: 0.7, // Border width
                      ),
                    ),
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage('assets/images/Membership Avator/avator1.png'),
                      radius: 40, // Radius of the CircleAvatar
                    ),
                  ),*/
                  CircleAvatar(
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage('assets/images/Membership Avator/avator2.png'),
                    radius: 40, // Radius of the CircleAvatar
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Serena',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.grey
                    ),
                  ),
                  Container(
                    width: 58,
                    height: 18,
                    decoration: BoxDecoration(
                      color: AppTheme.corecolor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(4.0), // Adjust radius for curve
                        bottomRight: Radius.circular(4.0),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 3.0, right: 3.0),
                      child: Center(
                        child: Text(
                          'IEV 10',
                          style: TextStyle(
                            color: AppTheme.whitecolor,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(width: 40),
              // Lightning icon
              Image.asset(
                'assets/images/icons/lighting.png', // Replace with the path to your lightning icon
                width: 50,
                height: 50,
              ),
              SizedBox(width: 40),
              // Second player (same as first)
              Column(
                children: [

                  CircleAvatar(
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage('assets/images/Membership Avator/avator2.png'),
                    radius: 40, // Radius of the CircleAvatar
                  ),
                /*  Container(
                    width: 80, // Diameter of the border (radius + padding)
                    height: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.black, // Border color
                        width: 0.7, // Border width
                      ),
                    ),
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage('assets/images/Membership Avator/avator2.png'),
                      radius: 40, // Radius of the CircleAvatar
                    ),
                  ),*/
                  SizedBox(height: 8),
                  Text(
                    'Serena',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                        color: AppTheme.grey
                    ),
                  ),
                  Container(
                    width: 58,
                    height: 18,
                    decoration: BoxDecoration(
                      color: AppTheme.corecolor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(4.0), // Adjust radius for curve
                        bottomRight: Radius.circular(4.0),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 3.0, right: 3.0),
                      child: Center(
                        child: Text(
                          'IEV 10',
                          style: TextStyle(
                            color: AppTheme.whitecolor,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ],
          ),
          SizedBox(height: 35),
          // Round indicator
          Text(
            'ROUND 1',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: AppTheme.corecolor,
            ),
          ),
        ],
      ),
    );
  }
}









