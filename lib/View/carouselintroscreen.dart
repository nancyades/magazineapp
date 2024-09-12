import 'package:aanma_nalam/View/loginscreens/loginscreen.dart';
import 'package:aanma_nalam/constant/app_theme.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarouselIntroScreen extends StatefulWidget {
  const CarouselIntroScreen({super.key});

  @override
  State<CarouselIntroScreen> createState() => _CarouselIntroScreenState();
}

class _CarouselIntroScreenState extends State<CarouselIntroScreen> {
  int _currentIndex = 0;
  final CarouselController _controller = CarouselController();

  // Updated carousel items to include title and description
  List<Map<String, dynamic>> carouselItems = [
    {
      'imagePath': "assets/images/Read.png",
      'title': "Read",
      'description': "Explore the Bible’s depths and grow deeper by studying the Word of God."
    },
    {
      'imagePath': "assets/images/Play.png",
      'title': "Play",
      'description': "Engage in spiritual and fun games to boost your knowledge and have fun."
    },
    {
      'imagePath': "assets/images/Shop-02.png",
      'title': "Learn",
      'description': "Discover more spiritual insights and lessons to help you in your journey."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: AppTheme.whitecolor,
        ),
        child: Stack(children: [
          Positioned(
            top: 50,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    child: GestureDetector(
                      onTap: () {
                        Get.to(LoginScreen(), transition: Transition.fadeIn, duration: Duration(milliseconds:800));
                       // Get.toNamed('/loginscreen');
                      },
                      child: Container(
                        height: AppTheme.skipbutheight,
                        width: AppTheme.smallbutwidth,
                        margin: const EdgeInsets.only(top: 2),
                        decoration: const BoxDecoration(
                          color: Colors.white30,
                          borderRadius: BorderRadius.all(
                            Radius.circular(9),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Skip',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: AppTheme.verySmallFontSize,
                              color: AppTheme.coretextcolor,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(),
              CarouselSlider(
                items: carouselItems.map((item) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 300,
                          width: 600,
                          child: Image.asset(item['imagePath']),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        item['title'],
                        style: TextStyle(
                          color: AppTheme.blackcolor,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          item['description'],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppTheme.seeallcolor,
                            fontSize: AppTheme.smallFontSize,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  );
                }).toList(),
                carouselController: _controller,
                options: CarouselOptions(
                  height: 500,
                  autoPlay: true,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  aspectRatio: 17 / 9,
                  enableInfiniteScroll: false,
                  viewportFraction: 0.9,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(carouselItems.length, (index) {
                    return GestureDetector(
                      onTap: () {
                        _controller.animateToPage(index);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 6.0),
                        child: Container(
                          width: 10.0,
                          height: 10.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: (index == _currentIndex
                                ? Theme.of(context).brightness == Brightness.dark
                                    ? Color(0xffD9D9D9)
                                    : const Color(0xffFF4747)
                                : Theme.of(context).brightness == Brightness.dark
                                    ? Colors.white.withOpacity(0.4)
                                    : const Color(0xffD9D9D9).withOpacity(0.4)),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
