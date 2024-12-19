import 'package:aanma_nalam/View/quiz/chanllenge.dart';
import 'package:aanma_nalam/View/quiz/levels.dart';
import 'package:aanma_nalam/constant/topmenu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

import '../../constant/app_theme.dart';

class QuizchallengeScreen extends StatefulWidget {
  const QuizchallengeScreen({super.key});

  @override
  State<QuizchallengeScreen> createState() => _QuizchallengeScreenState();
}

class _QuizchallengeScreenState extends State<QuizchallengeScreen> {
  String shareLink = 'https://silver-sophie-49.tiiny.site';
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: Column(

        children: [
          // Play Quiz and Challenge Cards

          CustomHeaderContainer(),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [

                Header(
                  welcomeText: 'Welcome',
                  userName: 'Aravinth',
                  level: 'Level 0',
                  coins: 20,
                ),



                Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildCard(context, 'Play Quiz', 'Single Player','assets/images/icons/singleplayer.png', Icons.person, AppTheme.corecolor),
                      SizedBox(width: 16,),

                      _buildCard(context, 'Challenge', 'Multiplayer','assets/images/icons/multiplayer.png',  Icons.group, AppTheme.corecolor),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                // Invite Friends Section
                InviteFriendsContainer(
                  onInvitePressed: () {
                    _shareContent();
                  },
                ),

                SizedBox(height: 20),
                // Challenges Section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 3.0),
                  child: Text(
                    'Challenges',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: AppTheme.grey),
                  ),
                ),
               // SizedBox(height: 2),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(3, (index) => _buildChallengeCard()),
                  ),
                ),
              ],
            ),
          )


        ],
      ),
      floatingActionButton: SizedBox(
        height: 40, // Set desired height
        child: FloatingActionButton.extended(
          onPressed: () {
            _showLanguageDialog(context);
          },
          backgroundColor: AppTheme.corecolor, // Adjust color to match the image
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20), // Rounded corners
          ),
          icon: Icon(Icons.add, color: Colors.white),
          label: Text(
            'New Challenge',
            style: TextStyle(
              fontSize: 16, // Adjust font size as needed
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
      )


    );
  }

  Widget _buildCard(BuildContext context, String title, String subtitle, String images,IconData icon, Color color) {

    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: color, // Background color
          borderRadius: BorderRadius.circular(Get.width * 0.04), // Dynamic rounded corners
          boxShadow: [
            BoxShadow(
              color: Colors.black26, // Shadow color
              blurRadius: Get.width * 0.015, // Dynamic shadow blur
              offset: Offset(0, Get.height * 0.005), // Dynamic shadow position
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(Get.width * 0.04), // Dynamic padding
          child: Column(
            children: [
              Text(
                title.toUpperCase(),
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: Get.width * 0.04, // Dynamic font size
                  fontWeight: FontWeight.w800,
                  color: AppTheme.whitecolor,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: Get.height * 0.02), // Dynamic top padding
                child: Image.asset(
                  'assets/images/icons/imageicon.png', // Replace with your asset image path
                  width: Get.width * 0.13, // Dynamic width
                  height: Get.width * 0.13, // Dynamic height
                  fit: BoxFit.contain,
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.all(Get.width * 0.02), // Dynamic padding
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        images.toString(), // Replace with your asset image path
                        width: Get.width * 0.06, // Dynamic width
                        height: Get.width * 0.06, // Dynamic height
                      ),
                      SizedBox(width: Get.width * 0.015), // Dynamic spacing
                      Expanded(
                        child: Text(
                          subtitle,
                          style: TextStyle(
                            color: AppTheme.whitecolor,
                            fontSize: Get.width * 0.035, // Dynamic font size
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (subtitle == 'Single Player') {
                    Get.to(Levels());
                  } else {
                    Get.to(ChallengeScreen());
                  }
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(Get.width * 0.35, Get.height * 0.05), // Dynamic button size
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(Get.width * 0.05), // Dynamic border radius
                  ),
                ),
                child: Text(
                  'PLAY NOW',
                  style: TextStyle(
                    color: color,
                    fontWeight: FontWeight.bold,
                    fontSize: Get.width * 0.04, // Dynamic font size
                  ),
                ),
              ),
            ],
          ),
        ),
      )



      // Container(
      //   decoration: BoxDecoration(
      //     color: color, // Background color
      //     borderRadius: BorderRadius.circular(15), // Rounded corners
      //     boxShadow: [
      //       BoxShadow(
      //         color: Colors.black26, // Shadow color
      //         blurRadius: 5, // Shadow blur
      //         offset: Offset(0, 2), // Shadow position
      //       ),
      //     ],
      //   ),
      //   child: Padding(
      //     padding: EdgeInsets.all(16),
      //     child: Column(
      //       children: [
      //         Text(
      //           title.toUpperCase(),
      //           style: TextStyle(
      //             fontFamily: 'Roboto',
      //             fontSize: 15,
      //             fontWeight: FontWeight.w800,
      //             color: AppTheme.whitecolor,
      //           ),
      //         ),
      //         Padding(
      //           padding: const EdgeInsets.only(top: 8.0),
      //           child: Image.asset(
      //             'assets/images/icons/imageicon.png', // Replace with your asset image path
      //             width: 52,
      //             height: 52,
      //             fit: BoxFit.contain,
      //           ),
      //         ),
      //         Padding(
      //           padding: const EdgeInsets.all(8.0),
      //           child: Row(
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children: [
      //               Image.asset(
      //                 images.toString(), // Replace with your asset image path
      //                 width: 24,
      //                 height: 24,
      //               ),
      //               SizedBox(width: 5),
      //               Expanded(
      //                 child: Text(
      //                   subtitle,
      //                   style: TextStyle(color: AppTheme.whitecolor, fontSize: Get.width * 0.033),
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ),
      //         ElevatedButton(
      //           onPressed: () {
      //             if (subtitle == 'Single Player') {
      //               Get.to(Levels());
      //             } else {
      //               Get.to(ChallengeScreen());
      //             }
      //           },
      //           style: ElevatedButton.styleFrom(
      //             minimumSize: Size(132, 32),
      //             backgroundColor: Colors.white,
      //             shape: RoundedRectangleBorder(
      //               borderRadius: BorderRadius.circular(20),
      //             ),
      //           ),
      //           child: Text('PLAY NOW', style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 16)),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );

  }

  Widget _buildChallengeCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Stack(
        children: [
          // The main card container
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Container(
              width: 120,
              height: 165,

              child: Row(
                children: [
                  Container(
                    width: 120,
                    height: 140,
                    child: Card(
                      color: AppTheme.playquizcontainer,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 10,),
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
                          CircleAvatar(
                            backgroundColor: Colors.transparent,
                            backgroundImage: AssetImage('assets/images/Membership Avator/avator1.png'),
                            radius: 30,
                          ),
                          SizedBox(height: 8),
                      Container(
                        width: 65,
                        height: 18,
                        decoration: BoxDecoration(
                          color: AppTheme.whitecolor,
                          borderRadius: BorderRadius.circular(3), // Adjust this value for more or less curve
                        ),
                        child: Center(
                          child: Text(
                            'Serena',
                            style: TextStyle(
                              color: AppTheme.grey,
                              fontSize: 13,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                        ),
                      ),

                      Container(
                            width: 45,
                            height: 15,
                        decoration: BoxDecoration(
                          color: AppTheme.corecolor,
                          borderRadius: BorderRadius.circular(3), // Adjust this value for more or less curve
                        ),

                            child: Center(
                              child: Text(
                                  'LEV 10',
                                style: TextStyle(
                                  color:  AppTheme.whitecolor,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Positioned button
          Positioned(
            bottom: 5, // Moved the button down below the container
            left: 26,
            right: 19,
            child: GestureDetector(
              onTap: () {
                // Add your onPressed functionality here
              },
              child: Container(
                decoration: BoxDecoration(
                  color: AppTheme.whitecolor,
                  border: Border.all(
                    color: AppTheme.grey, // Border color
                    width: 0.2, // Border width
                  ),
                  borderRadius: BorderRadius.circular(7),
                ),
                width: 100, // Set the width
                height: 26, // Set the height
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(left: 2.0, right: 2.0),
                  child: Text(
                    'Accept & Play',
                    style: TextStyle(
                      color: AppTheme.grey,
                      fontSize: 10,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
            ),
          )

        ],
      ),
    );
  }



  void _showLanguageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          backgroundColor: AppTheme.whitecolor,
          content: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.18,
              width: MediaQuery.of(context).size.width * 1,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(height: 10),
                  Text(
                    'Create a Challenge'.toUpperCase(),
                    style: TextStyle(fontSize: AppTheme.mediumFontSize, fontWeight: FontWeight.bold, color: AppTheme.grey),
                  ),
                  SizedBox(height: 20),
//
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      'Get ready to drive into the Scripture and see who knows\nthe Bible Best',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 9,
                        fontWeight: FontWeight.w800,
                        color: AppTheme.coretextcolor,
                      ),
                    ),
                  ),

                  SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();

                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppTheme.grey,
                          //padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                          minimumSize: Size(120, 33),
                        ),

                        child: Text(
                          'Cancel',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Get.off(ChallengeScreen());

                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:AppTheme.corecolor,
                          minimumSize: Size(120, 33),
                        ),
                        child: Text(
                          'Create',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }


  void _shareContent() {
    String platformMessage;
    Share.share(shareLink);

  }
}







