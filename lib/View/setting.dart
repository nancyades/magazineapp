import 'package:aanma_nalam/constant/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  bool _isSwitched = false;
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
          SizedBox(
            height: 20,
          ),
          // Custom Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // "Choose Level" Text
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Image.asset(
                        'assets/images/icons/Vector.png', // Ensure correct path
                        width: 15,
                        height: 15,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'More',
                      style: TextStyle(
                        fontSize: AppTheme.mediumFontSize,
                        fontWeight: FontWeight.w800,
                        color: AppTheme.seeallcolor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
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
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView( // Allows the settings options to scroll
                  child: Column(
                    children: [
                      SettingsOption(
                        icon: Icons.volume_up,
                        title: 'Sound Effect',
                        trailing: Transform.scale(
                          scale: 0.8, // Reduce the size of the switch
                          child: Switch(
                            value: _isSwitched,
                            onChanged: (value) {
                              setState(() {
                                _isSwitched = value;
                              });
                            },
                            activeColor: Colors.red, // Active state color (thumb)
                            activeTrackColor: Colors.grey.shade400, // Active track color
                            inactiveThumbColor: Colors.red, // Inactive state color (thumb)
                            inactiveTrackColor: Colors.grey.shade400, // Inactive track color
                            splashRadius: 0.0, // Disable the ripple effect when tapped
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap, // Reduces the overall clickable area
                          ),
                        ),
                      ),
                      // More settings options
                      SettingsOption(
                        icon: Icons.person,
                        title: 'My Profile',
                        trailing: InkWell(
                          onTap: () {
                            Get.toNamed('/myprofile');
                          },
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: AppTheme.corecolor,
                            size: 18,
                          ),
                        ),
                      ),
                      // Other SettingsOptions...
                      SettingsOption(
                        icon: Icons.help,
                        title: 'Help',
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: AppTheme.corecolor,
                          size: 18,
                        ),
                      ),
                      SettingsOption(
                        icon: Icons.feedback,
                        title: 'Feedback',
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: AppTheme.corecolor,
                          size: 18,
                        ),
                      ),
                      SettingsOption(
                        icon: Icons.star,
                        title: 'Rate Us',
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: AppTheme.corecolor,
                          size: 18,
                        ),
                      ),
                      SettingsOption(
                        icon: Icons.share,
                        title: 'Share Us',
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: AppTheme.corecolor,
                          size: 18,
                        ),
                      ),
                      SettingsOption(
                        icon: Icons.notifications,
                        title: 'Notification',
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: AppTheme.corecolor,
                          size: 18,
                        ),
                      ),
                      SizedBox(height: 20), // Extra space for buttons
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                Get.toNamed('/homescreen');
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppTheme.coretextcolor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 30.0, vertical: 15.0),
                              ),
                              child: Text(
                                'Log out',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: AppTheme.smallFontSize,
                                  color: AppTheme.whitecolor,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                Get.toNamed('/');
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppTheme.corecolor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 30.0, vertical: 15.0),
                              ),
                              child: Text(
                                'Delete Account',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: AppTheme.smallFontSize,
                                  color: AppTheme.whitecolor,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SettingsOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget trailing;

  SettingsOption({required this.icon, required this.title, required this.trailing});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Container(
        height: 65,
        decoration: BoxDecoration(
          color: AppTheme.whitecolor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: ListTile(
            leading: Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppTheme.newplayquizcontainer,
              ),
              child: Icon(
                icon,
                color: AppTheme.newquizbg,
              ),
            ),
            title: Text(
              title,
              style: TextStyle(color: AppTheme.coretextcolor),
            ),
            trailing: trailing,
          ),
        ),
      ),
    );
  }
}
