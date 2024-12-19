import 'package:aanma_nalam/constant/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Header extends StatelessWidget {
  final String welcomeText;
  final String? userName; // Optional userName
  final String? level;
  final int? coins;

 Header({
    required this.welcomeText,
    this.userName, // Optional parameter
     this.level,
     this.coins,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                      welcomeText,
                      style: TextStyle(
                        fontSize: 13, // Example size, replace with AppTheme
                        fontWeight: FontWeight.w800,
                        color: AppTheme.coretextcolor // Replace with AppTheme.coretextcolor
                      ),
                    ),
                    if (userName != null) // Check if userName is provided
                      Text(
                        userName!,
                        style: TextStyle(
                          fontSize: 16, // Example size, replace with AppTheme
                          fontWeight: FontWeight.w800,
                          color: AppTheme.coretextcolor, // Replace with AppTheme.coretextcolor
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
          if (level != null)  Row(
            children: [

              Text(
                level.toString(),
                style: TextStyle(
                  fontSize: 14, // Replace with AppTheme.smallFontSize
                  fontWeight: FontWeight.w800,
                  color: AppTheme.coretextcolor, // Replace with AppTheme.coretextcolor
                ),
              ),
              SizedBox(width: 15.0),
              Image.asset(
                'assets/images/icons/Coins Icons.png', // Ensure correct path
                width: 27,
                height: 27,
                color: AppTheme.grey // Replace with AppTheme.coretextcolor
              ),
              SizedBox(width: 3),
              Container(
                margin: EdgeInsets.only(left: 2.0),
                padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
                decoration: BoxDecoration(
                  color: AppTheme.deliverygrey,
                  borderRadius: BorderRadius.circular(25.0),
                ),
                constraints: BoxConstraints(
                  minWidth: 16,
                  minHeight: 16,
                ),
                child: Text(
                  '$coins',
                  style: TextStyle(
                    color: AppTheme.corecolor,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(width: 15.0),
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/icons/Ellipse 39.png'),
                radius: 25,
              ),
            ],
          ),
        ],
      ),
    );
  }
}



class CustomHeaderContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width:double.infinity,
      height: 50,
      color: AppTheme.corecolor, // Replace with your theme color
    );
  }
}


class BackButtonContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.back();
      },
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: SizedBox(
            width: 15,
            height: 30,
            child: Image.asset(
              'assets/images/icons/Back icon.png', // Ensure correct path

              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}


class CustomeBackbutton extends StatelessWidget {
  const CustomeBackbutton({super.key});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: () {
        Get.back();
      },
      child: Image.asset(
        'assets/images/icons/Vector.png', // Ensure correct path
        width: 15,
        height: 35,
        fit: BoxFit.contain,
      ),
    );
  }
}



class InviteFriendsContainer extends StatelessWidget {
  final VoidCallback? onInvitePressed; // Callback for invite button

  InviteFriendsContainer({this.onInvitePressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.bgcontainer, // Replace with your background color
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Get.width * 0.04, // Dynamic horizontal padding
          vertical: Get.height * 0.01, // Dynamic vertical padding
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/images/icons/inviteimage.png', // Ensure correct asset path
                  width: Get.width * 0.06, // Dynamic width
                  height: Get.height * 0.03, // Dynamic height
                  fit: BoxFit.contain,
                  color: AppTheme.coretextcolor, // Replace with your text color
                ),
                SizedBox(width: Get.width * 0.02), // Dynamic spacing between image and text
                Text(
                  'Invite your friends to join the quiz!',
                  style: TextStyle(
                    fontSize: Get.width * 0.035, // Dynamic font size
                    fontWeight: FontWeight.w800,
                    color: AppTheme.coretextcolor, // Replace with your text color
                  ),
                ),
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.corecolor, // Replace with your button color
                foregroundColor: AppTheme.whitecolor,
                minimumSize: Size(Get.width * 0.15, Get.height * 0.04), // Dynamic button size
              ),
              onPressed: onInvitePressed ?? () {}, // Add functionality if needed
              child: Text(
                'Invite',
                style: TextStyle(
                  fontSize: Get.width * 0.035, // Dynamic font size
                  fontWeight: FontWeight.w500,
                  color: AppTheme.whitecolor, // Replace with your text color
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
