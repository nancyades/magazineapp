import 'package:aanma_nalam/Controllers/quizcontroller.dart';
import 'package:aanma_nalam/View/quiz/matchscreen.dart';
import 'package:aanma_nalam/constant/app_theme.dart';
import 'package:aanma_nalam/constant/topmenu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';





class Changllengescoreboard extends StatefulWidget {
  const Changllengescoreboard({super.key});

  @override
  State<Changllengescoreboard> createState() => _ChangllengescoreboardState();
}

class _ChangllengescoreboardState extends State<Changllengescoreboard> {
  final QuizController quizController = Get.put(QuizController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(

        children: [
          CustomHeaderContainer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    BackButtonContainer(),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Score Board",
                            style: TextStyle(
                                fontSize: 16, // Example size, replace with AppTheme
                                fontWeight: FontWeight.bold,
                                color: AppTheme.grey // Replace with AppTheme.coretextcolor
                            ),
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),


          SizedBox(height: 45,),
          // Top Section: Player avatars and score
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PlayerInfo(name: "Serena", level: "LEV 10"),
                Column(
                  children: [
                    Text(
                      "0:02",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.blackcolor),
                    ),
                    Text(
                      "Score",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.corecolor),
                    ),
                  ],
                ),

                PlayerInfo(name: "Serena", level: "LEV 10"),
              ],
            ),
          ),
          SizedBox(height: 50),
          // Opponent Turn Text
          Text(
            "Opponent Turn",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: AppTheme.grey),
          ),
          SizedBox(height: 16),
          // Results with icons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Left Result Column
              Expanded(
                flex: 4,
                child: ResultColumn(
                  title: "Serena Complete level 1",
                  color: AppTheme.greentextcolor,
                ),
              ),
              // Circle Avatar in the Center
              Expanded(
                flex: 1,
                child: CircleAvatar(
                  radius: Get.width * 0.07, // Dynamic radius based on screen width
                  backgroundColor: AppTheme.grey,
                  child: Text(
                    "1",
                    style: TextStyle(
                      fontSize: Get.width * 0.045, // Dynamic font size
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              // Right Result Column
              Expanded(
                flex: 4,
                child: ResultColumn(
                  title: "Serena Complete level 1",
                  color: AppTheme.corecolor,
                ),
              ),
            ],
          ),

          Spacer(),
          // Button for next turn
          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: ElevatedButton(
              onPressed: () {
                quizController.accept.value = false;
                Get.to(MatchScreen());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.grey,
                padding: const EdgeInsets.symmetric(horizontal: 110, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              child: Text(
                "You Turn",
                style: TextStyle(color: Colors.white, fontSize: 16,fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ],
      ),
    );
  }
}



class PlayerInfo extends StatelessWidget {
  final String name;
  final String level;

  const PlayerInfo({required this.name, required this.level});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage('assets/images/Membership Avator/avator1.png'),
          radius: 30, // Radius of the CircleAvatar
        ),
       /* Container(
          width: 60, // Diameter of the border (radius + padding)
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.black, // Border color
              width: 0.4, // Border width
            ),
          ),
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage('assets/images/Membership Avator/avator1.png'),
            radius: 30, // Radius of the CircleAvatar
          ),
        ),*/
        SizedBox(height: 8),
        Text(
          name,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppTheme.coretextcolor),
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
                'LEV 10',
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
    );
  }
}

class ResultColumn extends StatelessWidget {
  final String title;
  final Color color;

  const ResultColumn({required this.title, required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Get.width * 0.08), // 8% of screen width
      child: Column(
        children: [
          // Title Text
          Text(
            title,
            style: TextStyle(
              color: color,
              fontSize: Get.width * 0.02, // Dynamic font size based on screen width
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: Get.height * 0.01), // 1% of screen height
          // Icons Row
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(3, (index) {
              bool isCorrect = index % 2 == 0; // Alternate between correct and incorrect
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: Get.width * 0.01), // 1% of screen width
                child: Icon(
                  isCorrect ? Icons.check_circle : Icons.cancel,
                  color: isCorrect ? Colors.green : Colors.red,
                  size: Get.width * 0.06, // Dynamic size for icons
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}

