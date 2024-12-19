import 'package:aanma_nalam/Controllers/quizcontroller.dart';
import 'package:aanma_nalam/View/quiz/matchscreen.dart';
import 'package:aanma_nalam/constant/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/topmenu.dart';

class ChallengeScreen extends StatefulWidget {
  const ChallengeScreen({super.key});

  @override
  State<ChallengeScreen> createState() => _ChallengeScreenState();
}

class _ChallengeScreenState extends State<ChallengeScreen> {
  final QuizController quizController = Get.put(QuizController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomHeaderContainer(),
          Header(
            welcomeText: 'Challenge',
            level: 'Level 0',
            coins: 20,
          ),

          InviteFriendsContainer(
            onInvitePressed: () {
              // Add your invite logic here
            },
          ),

          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(top: 15),
              itemCount: 8, // Number of challenge cards
              itemBuilder: (context, index) {
                return _buildChallengeCard();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChallengeCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.whitecolor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: ListTile(
          leading:  Container(
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
          ),


            /* CircleAvatar(
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage('assets/images/Membership Avator/avator1.png'),
            radius: 30,
          ),*/
          title: Text(
            'Serena',
            style: TextStyle(
              fontSize: 15, // Example size, replace with AppTheme
              fontWeight: FontWeight.w800,
              color: AppTheme.grey, // Replace with AppTheme.coretextcolor
            ),
          ),
          subtitle: Text('Level: 56', style: TextStyle(
            fontSize: 13, // Example size, replace with AppTheme
            color: AppTheme.grey, // Replace with AppTheme.coretextcolor
          ),),
          trailing: GestureDetector(
            onTap: () {
              quizController.accept.value = true;
              Get.to(MatchScreen());
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
              decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Text(
                'Accept & Play',
                style: TextStyle(
                  color:AppTheme.whitecolor,
                  fontSize: 13, // Adjust as needed
                ),
              ),
            ),
          )

        ),
      ),
    )
    ;
  }
}




