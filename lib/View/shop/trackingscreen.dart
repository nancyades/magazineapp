import 'package:aanma_nalam/constant/app_theme.dart';
import 'package:aanma_nalam/constant/topmenu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class TrackOrderScreen extends StatefulWidget {
  const TrackOrderScreen({super.key});

  @override
  State<TrackOrderScreen> createState() => _TrackOrderScreenState();
}

class _TrackOrderScreenState extends State<TrackOrderScreen> {
  int currentStep = 0; // To track the current progress of the timeline

  final List<TimelineStep> steps = [
    TimelineStep(
        title: "Order Processing",
        subtitle: "Order placed on 10th May\nOrder Shipped from office",
        image: "assets/images/paymentimage/orderpage.png"),
    TimelineStep(
        title: "In Transit",
        subtitle: "Your gift is on the way to your\nloved ones",
        image: "assets/images/paymentimage/inprocess.png"),
    TimelineStep(
        title: "Delivered",
        subtitle: "Your gift will be delivered on 14th May\nwithin 10am to 5pm",
        image: "assets/images/paymentimage/Delivered icon.png"),
  ];

  void nextStep() {
    // Update to the next step
    if (currentStep < steps.length - 1) {
      setState(() {
        currentStep++;
      });
    }
  }

  void previousStep() {
    // Go back to the previous step
    if (currentStep > 0) {
      setState(() {
        currentStep--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomHeaderContainer(),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
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
                            "Track Order",
                            style: TextStyle(
                              fontFamily: "Poppins",
                                fontSize: 19,
                                // Example size, replace with AppTheme
                                fontWeight: FontWeight.bold,
                                color: AppTheme
                                    .coretextcolor // Replace with AppTheme.coretextcolor
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 1),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    //color: AppTheme.containerbg,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildOrderDetailRow('Total Order', '01'),
                      _buildOrderDetailRow('Order ID', '47ADB54702'),
                      _buildOrderDetailRow('Paid', '3150'),
                      _buildOrderDetailRow(
                          'Delivery Time', 'Within 10am to 5pm'),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    children: [
                      Text(
                        'Expected Delivery - 14th May, 2023',
                        style: TextStyle(
                          color: AppTheme.delivery,
                          fontSize: 17,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Column(
                    children: [
                      ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemCount: steps.length,
                        itemBuilder: (context, index) {
                          return TimelineTile(
                            title: steps[index].title,
                            subtitle: steps[index].subtitle,
                            showCar: index == currentStep,
                            // Show car only on the current step
                            isActive: index <= currentStep,
                            isLast: index == steps.length - 1,
                            image: steps[index].image,
                          );
                        },
                      ),
                     /* Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: previousStep,
                            child: Text("Previous"),
                          ),
                          ElevatedButton(
                            onPressed: nextStep,
                            child: Text("Next"),
                          ),
                        ],
                      ),*/
                    ],
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderDetailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0,),
      child:
      Row(
       // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 130,

            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontFamily: "Roboto",fontWeight: FontWeight.w700,fontSize: 14, color: AppTheme.grey),
                  ),
                ],
              ),
            ),
          ),

          Row(
            children: [
              Text(
                ':',
                style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 15,
                    color: AppTheme.grey,
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  value,
                  style: TextStyle(fontFamily: "Roboto",fontWeight: FontWeight.w700, fontSize: 15, color: AppTheme.grey),
                ),


              ],
            ),
          )
        ],
      ),






    );
  }
}

class TimelineTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isActive;
  final bool isLast;
  final bool showCar;
  final String image;

  TimelineTile(
      {required this.title,
      required this.subtitle,
      this.isActive = false,
      this.isLast = false,
      this.showCar = false,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      // Allows the Positioned widget to go outside the Stack
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Column(
                children: [
                  // Increased the size of the circle container
                  Container(
                    width: 25, // Set the width of the circle
                    height: 25, // Set the height of the circle
                    decoration: BoxDecoration(
                      color: isActive ? AppTheme.corecolor : Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: isActive ? AppTheme.corecolor : AppTheme.grey, // Set the color of the border
                        width: 2.5, // Set the thickness of the border
                      ),
                    ),
                  ),

                  if (!isLast)
                    Container(
                      height: 100, // Adjust height for the connecting line
                      width: 3,
                      color: isActive ? Colors.red : Colors.grey,
                    ),
                ],
              ),
            ),
            SizedBox(width: 16),
            Expanded(

              child: Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.delivery,
                            //isActive ? AppTheme.blackcolor : Colors.grey,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 3.0),
                          child: Container(
                            width: image == "assets/images/paymentimage/orderpage.png"? 25: 45,
                            height: 30,
                             // color: Colors.red,
                            child: Image.asset(
                              image,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 13,
                        color: AppTheme.delivery,
                        //isActive ? Colors.black : Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        if (showCar)
          Positioned(
            top: isLast ? -4 : 48, // Adjusts car position based on step
            left: isLast ? 7 : 7, // Aligns the car with the circle
            child: Image.asset(
              'assets/images/paymentimage/trackingpayment.png',
              width: 30, // Adjust width to scale with the larger circle
              height: 30, // Adjust height to scale with the larger circle
              fit: BoxFit.contain,
            ),
          ),
      ],
    );
  }
}

class TimelineStep {
  final String title;
  final String subtitle;
  final String image;

  TimelineStep(
      {required this.title, required this.subtitle, required this.image});
}
