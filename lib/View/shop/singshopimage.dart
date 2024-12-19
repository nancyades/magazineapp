import 'package:aanma_nalam/View/shop/addnewaddressscreen.dart';
import 'package:aanma_nalam/constant/app_theme.dart';
import 'package:aanma_nalam/constant/topmenu.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SingleShopeImage extends StatefulWidget {
  const SingleShopeImage({super.key});

  @override
  State<SingleShopeImage> createState() => _SingleShopeImageState();
}

class _SingleShopeImageState extends State<SingleShopeImage> {
  int _current = 0;

  final List<String> imageList = [
    'assets/images/Frame.png',
    'assets/images/Frame.png',
    'assets/images/Frame.png',
    'assets/images/Frame.png',
    'assets/images/Frame.png',
    'assets/images/Frame.png',
  ];

  final List<Product> products = [
    Product(
      imageUrl: 'assets/images/icons/Rectangle 180.png',
      // Replace with actual image URL
      name: 'White T-shirt',
      type: 'Unisex T-shirt',
      price: 159,
      isFavorite: false,
      isshopcard: false,
    ),
    Product(
      imageUrl: 'assets/images/icons/Rectangle 180.png',
      // Replace with actual image URL
      name: 'Coffe Cup',
      type: 'Unisex T-shirt',
      price: 159,
      isFavorite: false,
      isshopcard: false,
    ),
    Product(
      imageUrl: 'assets/images/icons/Rectangle 180.png',
      // Replace with actual image URL
      name: 'White T-shirt',
      type: 'Unisex T-shirt',
      price: 159,isFavorite: false,
      isshopcard: false,
    ),
  ];
  bool _isClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomHeaderContainer(),


              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          CarouselSlider(
                            options: CarouselOptions(
                              height: MediaQuery.of(context).size.width * 1, // Set height based on aspect ratio
                              autoPlay: false,
                              enlargeCenterPage: true,
                              enableInfiniteScroll: true,
                              viewportFraction: 1.0, // Full-width images
                              onPageChanged: (index, reason) {
                                setState(() {
                                  _current = index;
                                });
                              },
                            ),
                            items: imageList
                                .map((item) => Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(item),
                                  fit: BoxFit.cover, // Maintain image aspect ratio
                                ),
                              ),
                            ))
                                .toList(),
                          )
                          ,

                          Positioned(
                            top: 25,
                            left: 10,
                            child: GestureDetector(
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
                                  child: Image.asset(
                                    'assets/images/icons/Back icon.png',
                                    // Ensure correct path
                                    width: 20,
                                    height: 20,
                                  ),
                                ),
                              ),
                            ),
                            //favorite_border favorite
                          ),
                          // Cart Icon on the top right
                          Positioned(
                            top: 25, // Adjust according to your app's UI
                            right: 10,
                            child: Stack(
                              children: [
                                GestureDetector(
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
                                        width: 20,
                                        height: 20,
                                        child: Image.asset(
                                          'assets/images/icons/Bag icon.png',
                                          // Ensure correct path

                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            top: 18,
                            right: 5,
                            child: Container(
                              padding: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              constraints: BoxConstraints(
                                minWidth: 16,
                                minHeight: 16,
                              ),
                              child: Text(
                                '0', // Cart item count
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: imageList.asMap().entries.map((entry) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                top: 3.0,
                              ),
                              child: GestureDetector(
                                onTap: () => setState(() {
                                  _current = entry.key;
                                }),
                                child: Container(
                                  width: 6,
                                  height: 6,
                                  margin: EdgeInsets.symmetric(
                                      vertical: 0.0, horizontal: 2.0),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: _current == entry.key
                                        ? AppTheme.corecolor // Active dot color
                                        : AppTheme.dotcolor, // Inactive dot color
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 16.0,),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Personalised Frame 150x300',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 2),
                                      decoration: BoxDecoration(
                                        color: AppTheme.greencolor,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            '4.9',
                                            style: TextStyle(color: Colors.white),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 8.0),
                                            child: Icon(Icons.star,
                                                color: Colors.white, size: 16),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      'Rating & 16 Reviews',
                                      style: TextStyle(
                                          fontSize: 13,
                                          // Example size, replace with AppTheme
                                          fontWeight: FontWeight.w800,
                                          color: AppTheme
                                              .coretextcolor // Replace with AppTheme.coretextcolor
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/icons/shopshare.png',
                                      // Ensure correct path
                                      width: 29,
                                      height: 29,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Image.asset(
                                      'assets/images/icons/shopwarning.png',
                                      // Ensure correct path
                                      width: 29,
                                      height: 29,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      '₹',
                                      style: TextStyle(
                                          color: AppTheme.coretextcolor,
                                          fontFamily: 'Roboto',
                                          fontSize: 35,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 7.0),
                                      child: Text(
                                        '159',
                                        style: TextStyle(
                                            fontFamily: 'Roboto',
                                            // Specify the font family
                                            fontSize: 35,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              "₹259",
                                              style: TextStyle(
                                                color: AppTheme.coretextcolor,
                                                fontFamily: 'Roboto',
                                                // Specify the font family
                                                fontSize: 13,
                                               // decoration: TextDecoration.lineThrough,
                                              ),
                                            ),

                                            Padding(
                                              padding: const EdgeInsets.only(left: 8.0),
                                              child: Container(
                                                width: 47,
                                                height: 17,
                                                decoration: BoxDecoration(
                                                  color: AppTheme.greencolor.withOpacity(0.2),
                                                  borderRadius: BorderRadius.circular(4),

                                                ),

                                                child: Center(
                                                  child: Text(
                                                    '36% off',
                                                    style: TextStyle(
                                                      color: AppTheme.greentextcolor,
                                                      fontSize: 11,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  'Inclusive of all taxes',
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 13,
                                                    fontFamily: 'Poppins',
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 2.0),
                                                  child: Image.asset(
                                                    'assets/images/icons/exlamation.png', // Ensure this path is correct
                                                    width: 15,
                                                    height: 15,
                                                  ),
                                                ),
                                              ],
                                            ),


                                          ],
                                        ),





                                      ],
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 5.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      // Add your onTap functionality here
                                    },
                                    child: Text(
                                      'View Offers',
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline,
                                        decorationColor: Colors.red,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 15),
                           /* SizedBox(
                              height: 47,
                              child: Center(
                                child: TextField(
                                  textAlign: TextAlign.center, // Centers the input text
                                  decoration: InputDecoration(
                                    hintText: 'Type caption text here',
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                    ),
                                    border: OutlineInputBorder(),
                                    contentPadding: EdgeInsets.only(top: 6), // Centers the hint text vertically
                                  ),
                                ),
                              ),
                            ),*/

                            Row(
                              children: [
                                Expanded(
                                  flex: 3, // Adjust the flex ratio based on your design
                                  child: Container(
                                    height: 45,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(8),
                                        bottomLeft: Radius.circular(8),
                                      ),
                                      border: Border.all(color: Colors.grey.shade300),
                                    ),
                                    padding: EdgeInsets.all(10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Image.asset(
                                              'assets/images/icons/LOCATION ICON.png',
                                              width: 20,
                                              height: 20,
                                            ),
                                            SizedBox(width: 5),
                                            Text(
                                              '600068, Mathur',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontFamily: 'Poppins',
                                                color: Colors.grey.shade800,
                                              ),
                                              overflow: TextOverflow.ellipsis, // Handle long text gracefully
                                            ),
                                          ],
                                        ),
                                        Image.asset(
                                          'assets/images/icons/cancel.png',
                                          width: 25,
                                          height: 25,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1, // Adjust the flex ratio
                                  child: Container(
                                    height: 45,
                                    decoration: BoxDecoration(
                                      color: Colors.pink,
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(8),
                                        bottomRight: Radius.circular(8),
                                      ),
                                    ),
                                    child: TextButton(
                                      onPressed: () {},
                                      child: FittedBox(
                                        fit: BoxFit.scaleDown, // Ensure text scales within the button
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 20),
                                          child: Text(
                                            'Check',
                                            style: TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )

                              ],
                            ),
                            // Continuing from your existing code
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 30),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Delivery status
                                  Padding(
                                    padding: const EdgeInsets.only(left: 12.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          'assets/images/icons/subway_tick.png',
                                          // Ensure correct path
                                          width: 15,
                                          height: 15,
                                        ),
                                        SizedBox(width: 8),
                                        Text(
                                          "Yes, We have delivery at 600068",
                                          style: TextStyle(
                                              color: AppTheme.blackcolor,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 25),
                                  // Offers and Coupons Section
                                  Container(
                                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        top: BorderSide(color: Colors.grey),
                                        bottom: BorderSide(color: Colors.grey),
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Get this for as low as',
                                              style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                 color: AppTheme.grey,
                                                  fontSize: 14,
                                                 // fontWeight: FontWeight.w600
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 8.0),
                                              child: Text(
                                                '₹ 429',
                                                style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    color: AppTheme.greencolor,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold
                                                ),
                                              ),
                                            ),
                                            Spacer(),
                                            Image.asset(
                                              'assets/images/icons/updownarrow.png',
                                              // Ensure correct path
                                              width: 25,
                                              height: 25,
                                            ),
                                          ],
                                        ),
                                        Text(
                                          'with this offer',
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              color: AppTheme.grey,
                                              fontSize: 14,
                                              //fontWeight: FontWeight.w600
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // All Offers and Coupons Button
                                  Container(
                                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(color: Colors.grey),
                                      ),
                                    ),
                                    child: ListTile(
                                      contentPadding: EdgeInsets.zero,
                                      title: Text(
                                        'All Offers & Coupons',
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            color: AppTheme.grey,
                                            fontSize: 14,
                                           // fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      trailing: Icon( color: AppTheme.grey,Icons.arrow_forward_ios, size: 20),
                                      onTap: () {
                                        // Handle tap for offers
                                      },
                                    ),
                                  ),
                                  SizedBox(height: 25),
                                  // Three Offers/Services Row
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: _buildServiceCard("100% Purchase Protection",
                                            "Assured Quality\nSecure Payments",
                                            "assets/images/icons/Purchase Icon.png",

                                            icon: Icons.shield),
                                      ),
                                      SizedBox(width: 10,),
                                      Expanded(
                                        child: _buildServiceCard("Serving\nExcellence",
                                            "20M Happy Customers\n100% Satisfaction",
                                            "assets/images/icons/Serving Excellence.png",
                                            icon: Icons.star),
                                      ),
                                      SizedBox(width: 10,),
                                      Expanded(
                                        child: _buildServiceCard("Timely\nDelivery",
                                            "Different Time Slots Available",
                                            "assets/images/icons/Time Delivery.png",
                                            icon: Icons.access_time),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20),

                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Product Description:",
                                        style: TextStyle(
                                          color: AppTheme.producttextcolor,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Padding(
                                        padding: const  EdgeInsets.only(left: 10.0),
                                        child: Text(
                                          "Product Details:",
                                          style: TextStyle(
                                              color: AppTheme.producttextcolor,
                                              fontSize: 16, fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      SizedBox(height: 10),

                                      _buildBulletPoint(
                                          "Personalized Impression Frame"),
                                      SizedBox(height: 4,),

                                      _buildBulletPoint(
                                          "Material - Acrylic and Wood"),
                                      SizedBox(height: 4,),
                                      _buildBulletPoint(
                                          "Color - Transparent & Golden"),
                                      SizedBox(height: 4,),

                                      _buildBulletPoint(
                                          "Finish - Shiny"),
                                      SizedBox(height: 4,),

                                      _buildBulletPoint(
                                          "Dimension - 12 x 12 inches"),
                                      SizedBox(height: 4,),

                                      _buildBulletPoint(
                                          "Personalize - Yes"),
                                      SizedBox(height: 4,),
                                      _buildBulletPoint(
                                          "It's a beautiful elegant frame made with Transparent & Golden Acrylic."),
                                      SizedBox(height: 4,),

                                      _buildBulletPoint(
                                          "Wooden stand provided to make it stand on any plain surface."),
                                      SizedBox(height: 4,),

                                      _buildBulletPoint(
                                          "For Personalization, required text names, date, and 3 images or keep it blank for impression during special events."),
                                      SizedBox(height: 20),



                                      // Delivery Information
                                      Padding(
                                        padding: const  EdgeInsets.only(left: 10.0),
                                        child: Text(
                                          "Delivery Information:",
                                          style: TextStyle(
                                              color: AppTheme.producttextcolor,
                                              fontSize: 16, fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      _buildBulletPoint(
                                          "This product is shipped using the services of our courier partners; the delivery date is an estimate."),
                                      SizedBox(height: 4,),
                                      _buildBulletPoint(
                                          "Soon after the order has been dispatched, you will receive a tracking number to help trace your gift."),
                                      SizedBox(height: 4,),
                                      _buildBulletPoint(
                                          "Your article may be delivered before or after the chosen date of delivery."),
                                      SizedBox(height: 4,),
                                      _buildBulletPoint(
                                          "Our courier partners do not call before delivering an order, so we recommend that you provide an address at which someone will be present to receive the package."),
                                      SizedBox(height: 4,),
                                      _buildBulletPoint(
                                          "All courier orders are carefully packed and shipped from our warehouse."),
                                      SizedBox(height: 4,),
                                      _buildBulletPoint(
                                          "The delivery cannot be redirected to any other address."),
                                      SizedBox(height: 20),

                                      // Care Instructions
                                      Padding(
                                        padding: const  EdgeInsets.only(left: 10.0),
                                        child: Text(
                                          "Care Instructions :",
                                          style: TextStyle(
                                              color: AppTheme.producttextcolor,
                                              fontSize: 16, fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      _buildBulletPoint("Handle with care."),
                                      SizedBox(height: 1,),
                                      _buildBulletPoint(
                                          "Wipe clean with a soft dry cloth."),
                                      SizedBox(height: 20),

                                      // Country of Origin
                                      Padding(
                                        padding: const EdgeInsets.only(left: 10.0),
                                        child: Container(
                                          width: double.infinity,
                                          height: 50,
                                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                                          decoration: BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(color: Colors.grey),
                                            ),
                                          ),
                                          child: Text(
                                            "Country of Origin: India",
                                            style: TextStyle(
                                                color: AppTheme.producttextcolor,
                                                fontSize: 16, fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 6),


                                      // Ask Us Button
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Have doubts regarding this product?",
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              // Implement Ask Us button functionality
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.pinkAccent,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(5.0),
                                              ),
                                            ),
                                            child: Text(
                                              "ASK US",
                                              style:
                                              TextStyle(color: AppTheme.whitecolor, fontSize: 12),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 10),

                                      // Write a Review Button
                                      Row(
                                        children: [
                                          Text(
                                            "No one has rated this before. Be the first \none to",
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 10),
                                      Center(
                                        child: ElevatedButton(
                                          onPressed: () {
                                            // Implement Write a Review functionality
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.pinkAccent,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(5.0),
                                            ),
                                          ),
                                          child: Text(
                                            "WRITE A REVIEW",
                                            style: TextStyle(color: AppTheme.whitecolor, fontSize: 12),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 20),

                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '*This product will be shipped using our courier partners',
                                            style: TextStyle(
                                              fontSize: 12.0,
                                              color:
                                              Color(0xFF7D8186), // Light grey color
                                            ),
                                          ),
                                          SizedBox(height: 8.0),
                                          // Adds spacing between the two lines
                                          Text(
                                            '**Products will be shipped within 2 days of order placement',
                                            style: TextStyle(
                                              fontSize: 12.0,
                                              color:
                                              Color(0xFF7D8186), // Light grey color
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 10),

                                      // Recently Viewed Products
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Recently Viewed Products",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(height: 25),
                                          // Recently Viewed Products List
                                          SizedBox(
                                            height: 220,

                                            // Set the height for the product card container
                                            child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              itemCount: products.length,
                                              itemBuilder: (context, index) {
                                                return _buildProductCard(products[index]);
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 35),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(height: 10),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            ],
          ),

          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end, // Pushes widgets to the bottom
              children: [
                Container(
                  color: Colors.pink[50],
                  padding: EdgeInsets.all(8),
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      '09:30:47 hours left for today\'s delivery',
                      style: TextStyle(color: Colors.pink, fontSize: 13, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            Get.to(AddNewAddressScreen());
          },
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 16),
            backgroundColor: AppTheme.greentextcolor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text(
            'ADD TO CART',
            style: TextStyle(fontSize: 13, color: Colors.white,fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget _buildServiceCard(String title, String subtitle, String images, {IconData? icon}) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.3, // Adjust width as a percentage of screen width
      height: MediaQuery.of(context).size.height * 0.2, // Adjust height as a percentage of screen height
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02), // Dynamic padding
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey.shade200, // Background color for transparency
        image: DecorationImage(
          image: AssetImage(images), // Path to your image
          fit: BoxFit.cover, // Adjust the image to cover the container
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(flex: 1), // Add spacing dynamically
          Text(
            title,
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.03, // Dynamic font size
              fontWeight: FontWeight.bold,
              color: AppTheme.blackcolor,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01), // Dynamic vertical spacing
          Text(
            subtitle,
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.02, // Dynamic font size
              fontWeight: FontWeight.bold,
              color: AppTheme.blackcolor,
            ),
            textAlign: TextAlign.center,
          ),
         SizedBox(
           height: 8,
         )
         // Spacer(flex: 1), // Add more spacing dynamically
        ],
      ),
    );

  }


  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("• ",
          style: TextStyle(fontSize: 12, color: AppTheme.grey)),
          Expanded(
            child: Text(text,
                style: TextStyle(fontSize: 12, color: AppTheme.grey)),
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard(Product product) {
    return Container(


      width: 150, // Width of each card
     margin: EdgeInsets.only(right: 16), // Space between cards
      decoration: BoxDecoration(
        color: AppTheme.shopcardbackground,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        children: [

          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: GestureDetector(
                  onTap: () {
                    Get.to(SingleShopeImage());
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    child:
                    Image.asset(
                      product.imageUrl,
                      height: 140,
                      width: 140,
                      fit: BoxFit.fill,
                    ),

                  ),
                ),
              ),

              Positioned(
                top: 8,
                right: 8,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      product.isFavorite = !product.isFavorite;
                    });
                  },
                  child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: SizedBox(
                        width: 8,
                        height: 8,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Image.asset(
                            product.isFavorite
                                ? 'assets/images/paymentimage/FILL HEART.png' // Image for clicked state
                                : 'assets/images/paymentimage/heart.png', // Image for unclicked state
                            color:product.isFavorite ?AppTheme.corecolor  : AppTheme.coretextcolor,
                            fit: BoxFit.contain,
                          ),
                        ),
                      )

                     /* Icon(
                          product.isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: Colors.red)*/
                  ),
                ),
                //favorite_border favorite
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Product Name
                    Text(
                      product.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    //SizedBox(height: 4),
                    // Product Type
                    Text(
                      product.type,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 10,
                      ),
                    ),
                    //SizedBox(height: 4),
                    // Product Price
                    Text(
                      'Rs.${product.price}/-',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0, top: 15),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      product.isshopcard = !product.isshopcard;
                    });
                  },
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color:  product.isshopcard ? AppTheme.shopcardbackground : AppTheme.corecolor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Image.asset(
                        product.isshopcard ? 'assets/images/icons/ph_shopping-cart-fill.png' :'assets/images/icons/ph_shopping-cart-fill-white.png',
                        width: product.isshopcard ? 25 : 18, // Adjust the width to reduce the size
                        height: product.isshopcard ? 25 : 18, // Adjust the height to reduce the size
                      ),
                    ),
                  ),

                 /* Padding(
                    padding: const EdgeInsets.only(right: 8.0, top: 25),
                    child: Image.asset(
                      _isClicked ? 'assets/images/icons/ph_shopping-cart-fill.png' :'assets/images/icons/ph_shopping-cart-fill-white.png',
                      // Ensure correct path
                      width: 26,
                      height: 26,

                    ),
                  ),*/
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Product Model
class Product {
  final String imageUrl;
  final String name;
  final String type;
  final int price;
   bool isFavorite = false;
  bool isshopcard = false;

  Product({
    required this.imageUrl,
    required this.name,
    required this.type,
    required this.price,
     required this.isFavorite,
    required this.isshopcard
  });
}






