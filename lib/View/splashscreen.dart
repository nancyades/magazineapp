/*
import 'dart:async';

import 'package:aanma_nalam/View/carouselintroscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreens extends StatefulWidget {
  const SplashScreens({super.key});

  @override
  State<SplashScreens> createState() => _SplashScreensState();
}

class _SplashScreensState extends State<SplashScreens> {

  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 2),
          () {
        Get.offAll(
              () => const CarouselIntroScreen(),

        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/logo1.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
*/










import 'package:aanma_nalam/View/carouselintroscreen.dart';
import 'package:aanma_nalam/constant/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math';

class SplashScreens extends StatefulWidget {
  @override
  _SplashScreensState createState() => _SplashScreensState();
}

class _SplashScreensState extends State<SplashScreens>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _showContent = false; // Variable to control content display

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1), // Duration of the reveal effect
    );

    // Set up the animation to grow the circle
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    // Start the animation
    _controller.forward();

    // After animation completes, display content
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _showContent = true;
        });
      }
    });


    Future.delayed(Duration(seconds: 2), () {
      Get.off(CarouselIntroScreen(), transition: Transition.cupertino, duration: Duration(seconds: 1));
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.whitecolor, // Splash screen background color
      body: Stack(
        children: [
          // Circular reveal animation
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return ClipPath(
                clipper: CircularRevealClipper(
                  fraction: _animation.value,
                ),
                child: Container(
                  color:AppTheme.corecolor, // The color to reveal
                ),
              );
            },
          ),

          // The splash content will only show after the animation completes
          if (_showContent)
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 35.0, right: 35.0),
                    child: Image.asset(
                      'assets/images/logo.png', // Ensure correct path
                    ),
                  ),
                  SizedBox(height: 20), // You can replace this with your logo or other content
                ],
              ),
            ),
        ],
      ),
    );
  }
}

// Custom Clipper for Circular Reveal Effect
class CircularRevealClipper extends CustomClipper<Path> {
  final double fraction;

  CircularRevealClipper({required this.fraction});

  @override
  Path getClip(Size size) {
    final path = Path();

    // Calculate the center of the screen
    final center = Offset(size.width / 2, size.height / 2);

    // Calculate the max radius (to cover the entire screen)
    final maxRadius = sqrt(size.width * size.width + size.height * size.height);

    // Draw the circle with the current fraction of the animation
    path.addOval(Rect.fromCircle(center: center, radius: maxRadius * fraction));

    return path;
  }

  @override
  bool shouldReclip(CircularRevealClipper oldClipper) {
    return oldClipper.fraction != fraction;
  }
}
