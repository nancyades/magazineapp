import 'package:aanma_nalam/constant/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  bool isNameEditable = false;
  bool isPhoneNumberEditable = false;
  bool isCountryEditable = false;

  final TextEditingController _nameController = TextEditingController(text: 'Serena');
  final TextEditingController _phoneNumberController = TextEditingController(text: '9943251300');
  final TextEditingController _countryController = TextEditingController(text: 'India');

  String _selectedGender = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 280,
              color: AppTheme.corecolor,
              child: Stack(
                children: [
                  Positioned(
                    top: 120,
                    left: 60,
                    child: Container(
                      width: 320,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: 320,
                            height: 30,
                            decoration: BoxDecoration(
                              color: AppTheme.coretextcolor,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15.0),
                                topRight: Radius.circular(15.0),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Your Player ID 66b3295df3ba6',
                                  style: TextStyle(
                                    color: AppTheme.whitecolor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Player ID Text

                          Padding(
                            padding: const EdgeInsets.only(top: 15.0, bottom: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Available Coins',
                                  style: TextStyle(
                                    color: Colors.redAccent,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  children: [
                                    SizedBox(width: 4),
                                    Text(
                                      '25',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(width: 4),
                                    Icon(
                                      Icons.monetization_on,
                                      color: Colors.amber,
                                      size: 20,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,

                            children: [

                              Container(
                                width: 150,
                                height: 25,
                                decoration: BoxDecoration(
                                  color: AppTheme.coretextcolor,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 20.0),
                                    child: Text(
                                      'Serena',
                                      style: TextStyle(
                                        color: AppTheme.whitecolor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          'assets/images/icons/Shopping icon.png', // Replace with your asset image path
                                          width: 25,
                                          height: 25,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 4.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.grey[200],
                                              borderRadius: BorderRadius.circular(10.0),
                                            ),
                                            constraints: BoxConstraints(
                                              minWidth: 16,
                                              minHeight: 16,
                                            ),
                                            child: Center(
                                              child: Padding(
                                                padding: const EdgeInsets.all(2.0),
                                                child: Text(
                                                  '05',
                                                  style: TextStyle(
                                                    color: Colors.red,
                                                    fontSize: 11,
                                                    fontWeight: FontWeight.w800,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),


                            ],
                          )
                        ],
                      ),
                    ),
                  ),

                  Positioned(
                    top: 120,
                    left: 20,
                    child:  CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/images/icons/Ellipse 39.png'), // Replace with your image path
                    ),
                  ),

                  Positioned(
                    top: 160,
                    left: 110,
                    child: CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.edit,
                        color: Colors.purple[900],
                        size: 12,
                      ),
                    ),
                  ),

                  Column(
                    children: [
                      SizedBox(height: 50,),
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
                                    color: AppTheme.whitecolor,
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  'My Profile',
                                  style: TextStyle(
                                    fontSize: AppTheme.mediumFontSize,
                                    fontWeight: FontWeight.w800,
                                    color: AppTheme.whitecolor,
                                  ),
                                ),
                              ],
                            ),

                           ],
                        ),
                      ),

                    ],
                  ),
                ],
              ),
            ),

            SingleChildScrollView(
              padding: EdgeInsets.all(5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Name Field
                  _buildEditableTextField(
                    'Name',
                    _nameController,
                    isNameEditable,
                        () {
                      setState(() {
                        isNameEditable = !isNameEditable;
                      });
                    },
                  ),
                  SizedBox(height: 10),
                  // Phone Number Field
                  _buildEditableTextField(
                    'Phone Number',
                    _phoneNumberController,
                    isPhoneNumberEditable,
                        () {
                      setState(() {
                        isPhoneNumberEditable = !isPhoneNumberEditable;
                      });
                    },
                  ),
                  SizedBox(height: 10),
                  // Country Field
                  _buildEditableTextField(
                    'Country',
                    _countryController,
                    isCountryEditable,
                        () {
                      setState(() {
                        isCountryEditable = !isCountryEditable;
                      });
                    },
                  ),
                ],
              ),
            ),
            // Gender Selection
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildRadioButton('Male', _selectedGender),
                SizedBox(width: 20),
                _buildRadioButton('Female', _selectedGender),
              ],
            ),
            SizedBox(height: 20),
            // Save Button
            SizedBox(
              width: 150,
              child: ElevatedButton(
                onPressed: () {
                  Get.toNamed('/setting');
                },
                style: ElevatedButton.styleFrom(
                  //padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  backgroundColor: AppTheme.corecolor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),

                ),
                child: Text('Save',style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: AppTheme.mediumFontSize,
                    color: AppTheme.whitecolor,
                    fontWeight: FontWeight.w900),),
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget _buildRadioButton(String label, String groupValue) {
    return Row(
      children: [
        RadioTheme(
          data: RadioThemeData(

            fillColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.selected)) {
                  return AppTheme.corecolor;// Selected color
                }
                return Colors.grey; // Unselected color
              },
            ),
          ),
          child: Radio<String>(
            value: label,
            groupValue: groupValue,
            onChanged: (value) {
              setState(() {
                _selectedGender = value!;
              });
            },
          ),
        ),
        Text(
          label,
        style: TextStyle(
        fontFamily: 'Poppins',
    fontSize: AppTheme.mediumFontSize,
    color: AppTheme.coretextcolor,
    fontWeight: FontWeight.w900),
        ),
      ],
    );
  }


  Widget _buildEditableTextField(
      String label,
      TextEditingController controller,
      bool isEditable,
      VoidCallback onEditTap,
      ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0,),
      child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8),
            child: Text(label,style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: AppTheme.smallFontSize,
                color: AppTheme.coretextcolor,
                fontWeight: FontWeight.w900),),
          ),
          TextField(
            controller: controller,
            readOnly: !isEditable,
            style: TextStyle(color: AppTheme.coretextcolor),
            decoration: InputDecoration(
              //labelText: label,
              labelStyle: TextStyle(color: AppTheme.coretextcolor),
              suffixIcon: IconButton(
                icon: Icon( Icons.edit, color: AppTheme.coretextcolor),
                onPressed: onEditTap,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppTheme.coretextcolor),
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppTheme.coretextcolor),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        ],
      ),
    );
  }

}





