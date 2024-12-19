import 'package:aanma_nalam/View/shop/productcheckoutscreen.dart';
import 'package:aanma_nalam/constant/app_theme.dart';
import 'package:aanma_nalam/constant/topmenu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddNewAddressScreen extends StatefulWidget {
  const AddNewAddressScreen({super.key});

  @override
  State<AddNewAddressScreen> createState() => _AddNewAddressScreenState();
}

class _AddNewAddressScreenState extends State<AddNewAddressScreen> {
  final _formKey = GlobalKey<FormState>();

  String selectedAddressType = 'Home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Custom header remains fixed
          CustomHeaderContainer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
            child: Row(
              children: [
                BackButtonContainer(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "ADD NEW DELIVERY ADDRESS",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                      color: AppTheme.coretextcolor // Replace with AppTheme.coretextcolor
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15,),

          // Expanded widget for the scrollable content
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [

                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              'Select Country',
                              style: TextStyle(fontSize: 12, color: AppTheme.grey),
                            ),
                          ),
                          SizedBox(height: 8),
                          DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.zero,
                                borderSide: BorderSide(color: AppTheme.grey), // Default border color
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.zero,
                                borderSide: BorderSide(color: AppTheme.grey, width: 1.0), // Unfocused border color
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.zero,
                                borderSide: BorderSide(color:AppTheme.grey, width: 2.0), // Focused border color
                              ),
                              contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 13), // Adjust vertical padding
                              isDense: true, // Reduces the height
                            ),
                            value: 'India',
                            items: ['India', 'USA', 'UK', 'Canada'].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value,style: TextStyle(fontSize: 15, color: AppTheme.grey, fontWeight: FontWeight.w500),),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {},
                            dropdownColor: Colors.white,
                            icon: Image.asset(
                              'assets/images/icons/updownarrow.png', // Replace with your image asset path
                              width: 22, // Adjust image width as needed
                              height: 22, // Adjust image height as needed
                            ),
                          ),



                          SizedBox(height: 16),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              'Recipient Name*',
                              style: TextStyle(fontSize: 12,  color: AppTheme.grey),
                            ),
                          ),
                          SizedBox(height: 8),
                          _buildTextField(label: 'Recipient Name*', initialValue: 'Jessica'),
                          SizedBox(height: 16),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              'Recipient Mobile Number*',
                              style: TextStyle(fontSize: 12, color: AppTheme.grey),
                            ),
                          ),
                          SizedBox(height: 8),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color:AppTheme.grey, width: 1),
                              //borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 12),
                                  child: Row(
                                    children: [
                                      Text(
                                        "+91",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: AppTheme.grey,
                                        ),
                                      ),
                                      SizedBox(width: 8),
                                      Container(
                                        height: 30,
                                        width: 1,
                                        color: AppTheme.grey, // Vertical divider color
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: TextField(
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: AppTheme.grey, // Change this to your desired text color
                                      fontSize: 15.0, // Adjust this to your desired text size
                                    ),
                                    keyboardType: TextInputType.phone,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.symmetric(vertical: 14),
                                      //hintText: "Enter mobile number",
                                      hintStyle: TextStyle(color: AppTheme.grey),
                                    ),


                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 16),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              'Recipient Alternate Mobile Number (Optional)',
                              style: TextStyle(fontSize: 12,  color: AppTheme.grey),
                            ),
                          ),
                          SizedBox(height: 8),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color:AppTheme.grey, width: 1),
                              //borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 12),
                                  child: Row(
                                    children: [
                                      Text(
                                        "+91",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: AppTheme.grey,
                                        ),
                                      ),
                                      SizedBox(width: 8),
                                      Container(
                                        height: 30,
                                        width: 1,
                                        color: AppTheme.grey, // Vertical divider color
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: TextField(
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: AppTheme.grey, // Change this to your desired text color
                                      fontSize: 15.0, // Adjust this to your desired text size
                                    ),
                                    keyboardType: TextInputType.phone,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.symmetric(vertical: 14),
                                      //hintText: "Enter mobile number",
                                      hintStyle: TextStyle(color: AppTheme.grey),
                                    ),


                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 16),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              'Recipient Address*',
                              style: TextStyle(fontSize: 12,  color: AppTheme.grey),
                            ),
                          ),
                          SizedBox(height: 8),
                          _buildTextField(label: '', maxLines: 3),
                          SizedBox(height: 16),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              'Landmark (Optional)',
                              style: TextStyle(fontSize: 12,  color: AppTheme.grey),
                            ),
                          ),
                          SizedBox(height: 8),
                          _buildTextField(label: ''),
                          SizedBox(height: 16),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              'Pin Code*',
                              style: TextStyle(fontSize: 12,  color: AppTheme.grey),
                            ),
                          ),
                          SizedBox(height: 8),
                          _buildTextField(label: '', keyboardType: TextInputType.number),
                          SizedBox(height: 16),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              'City*',
                              style: TextStyle(fontSize: 12,  color: AppTheme.grey),
                            ),
                          ),
                          SizedBox(height: 8),
                          _buildTextField(label: ' ',),
                          SizedBox(height: 32),


                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              // Home Button
                              _buildAddressTypeButton('Home', selectedAddressType == 'Home'),
                              SizedBox(width: 10,),
                              // Office Button
                              _buildAddressTypeButton('Office', selectedAddressType == 'Office'),
                              SizedBox(width: 10,),
                              // Other Button
                              _buildAddressTypeButton('Other', selectedAddressType == 'Other'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Bottom row for Cancel/Save buttons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                  onPressed: () {
                    // Cancel action
                  },
                  child: Text(
                    'CANCEL',
                    style: TextStyle(
                      color: AppTheme.grey,
                      fontSize: Get.width * 0.04, // Responsive font size
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      vertical: Get.height * 0.015, // Responsive vertical padding
                      horizontal: Get.width * 0.1, // Optional horizontal padding for better UX
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(Get.width * 0.02), // Responsive radius
                    ),
                    side: BorderSide(color: Colors.grey),
                    minimumSize: Size(
                      Get.width * 0.45, // Responsive button width
                      Get.height * 0.06, // Responsive button height
                    ),
                  ),
                ),
               // SizedBox(width: Get.width * 0.04), // Responsive spacing
                ElevatedButton(
                  onPressed: () {
                    // Navigation to ProductCheckoutScreen
                    Get.to(ProductCheckoutScreen());
                  },
                  child: Text(
                    'SAVE',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: Get.width * 0.04, // Responsive font size
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.symmetric(
                      vertical: Get.height * 0.015, // Responsive vertical padding
                      horizontal: Get.width * 0.1, // Optional horizontal padding for better UX
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(Get.width * 0.02), // Responsive radius
                    ),
                    minimumSize: Size(
                      Get.width * 0.45, // Responsive button width
                      Get.height * 0.06, // Responsive button height
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddressTypeButton(String label, bool isSelected) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedAddressType = label;
          });
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? Colors.red : Colors.transparent,
            border: Border.all(color: isSelected ? Colors.red : Colors.grey),
           // borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : AppTheme.grey,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    String? label,
    String? initialValue,
    String? prefixText,
    int maxLines = 1,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextFormField(
      initialValue: initialValue,
      keyboardType: keyboardType,
      maxLines: maxLines,
      style: TextStyle(
        fontWeight: FontWeight.w500,
        color: AppTheme.grey, // Change this to your desired text color
        fontSize: 15.0, // Adjust this to your desired text size
      ),
      decoration: InputDecoration(
        hintText: label,
        hintStyle: TextStyle(
          color: AppTheme.grey, // Change this to your desired hint color
          fontSize: 15.0, // Adjust hint text size as needed
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(color: AppTheme.grey), // Default border color
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(color: AppTheme.grey, width: 1.0), // Border color when not focused
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(color: AppTheme.grey, width: 1.0), // Border color when focused
        ),
        prefixText: prefixText,
        isDense: true, // Makes the field more compact
        contentPadding: EdgeInsets.symmetric(vertical: 13, horizontal: 12), // Adjust padding as needed
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $label';
        }
        return null;
      },
    );
  }


}




