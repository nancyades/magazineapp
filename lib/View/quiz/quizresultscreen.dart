import 'package:aanma_nalam/Controllers/quizcontroller.dart';
import 'package:aanma_nalam/View/quiz/changllengescoreboard.dart';
import 'package:aanma_nalam/constant/app_theme.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:get/get.dart';

class QuizScoreScreen extends StatefulWidget {
  const QuizScoreScreen({super.key});

  @override
  State<QuizScoreScreen> createState() => _QuizScoreScreenState();
}

class _QuizScoreScreenState extends State<QuizScoreScreen> {
  final QuizController quizController = Get.find<QuizController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Animated background with bubbles, stars, and diamonds
          AnimatedBackground(),
          // Quiz result content
          Column(
            children: [
              SizedBox(height: 75,),
              Text(
                'Quiz Result',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 23,
                    color: AppTheme.whitecolor,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 35,),
              // Emoji Image
              Image.network(
                quizController.score.value >= 25 ?
                'https://emojipedia-us.s3.amazonaws.com/source/skype/289/pensive-face_1f614.png' :  'https://emojipedia-us.s3.amazonaws.com/source/skype/289/pensive-face_1f614.png',

                height: 150,
                width: 150,
              ),
              SizedBox(height: 30),


              Text(
                quizController.score.value >= 25 ?
                "Completed!": "Better luck next time!",
                style: TextStyle(
                  fontFamily: 'Kottaone',
                  fontSize: 26,
                  color: AppTheme.whitecolor,
                ),
              ),
              SizedBox(height: 40),
              // Earned Coins Section
              _buildEarnedCoins(),
              SizedBox(height: 50),
              // Level and Time Taken Section
              _buildLevelAndTimeTaken(),
              SizedBox(height: 50),
              // Back Button
              _buildBackButton(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildEarnedCoins() {
    return Column(
      children: [
        Container(
          width: 250,
          height: 33,
          decoration: BoxDecoration(
            color: Colors.yellow[700],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              'EARNED COINS',
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 20,
                  color: AppTheme.whitecolor,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 140,
              height: 50,
              decoration: BoxDecoration(
                color: AppTheme.whitecolor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15.0),
                  bottomRight: Radius.circular(15.0),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0, left: 8),
                    child: Text(
                        quizController.score.value.toString(),
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: AppTheme.extralargeFontSize,
                          color: AppTheme.coretextcolor,
                          fontWeight: FontWeight.w800,
                        )
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      "assets/images/icons/threegoldcoins.png",
                      fit: BoxFit.contain,

                    ),
                  ),

                ],
              ),
            ),

          ],
        ),
      ],
    );
  }

  Widget _buildLevelAndTimeTaken() {
    return Column(
      children: [
        Container(
          width: 170,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.yellow[700],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0),
              topRight: Radius.circular(15.0),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'LEVEL 1',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.whitecolor,
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 240,
          height: 80,
          decoration: BoxDecoration(
            color: AppTheme.whitecolor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Text(
                'TIME TAKEN',
                style: TextStyle(
                  fontSize: 14,
                  color: AppTheme.corecolor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                quizController.timeTaken.value,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.grey,
                ),
              ),
            ],
          ),
        ),


      ],
    );
  }

  Widget _buildBackButton() {
    return quizController.accept.value == true ?

    ElevatedButton(
      onPressed: () {
        Get.to(Changllengescoreboard());
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: AppTheme.grey,

        padding: EdgeInsets.symmetric(horizontal: 65, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),

      ),
      child: Text(
        'Opponent Turn',
        style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),
      ),
    )

     : ElevatedButton(
      onPressed: () {
        Get.offNamed("/levels");
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey[700],
        padding: EdgeInsets.symmetric(horizontal: 65, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        'Back',
        style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),
      ),
    );
  }
}

// Animated background with floating bubbles, diamonds, and stars
class AnimatedBackground extends StatefulWidget {
  @override
  _AnimatedBackgroundState createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<AnimatedShape> _shapes;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
    )..repeat();

    // Generate shapes (bubbles, diamonds, and stars)
    _shapes = List.generate(10, (index) => AnimatedShape());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/icons/backgrounddecrotaion.png'), // Replace with your image path
              fit: BoxFit.cover, // Adjust how the image fits the container
            ),
          ),
          child: Stack(
            children: _shapes.map((shape) {
              return Positioned(
                left: shape.xPosition * MediaQuery.of(context).size.width,
                top: (shape.yPosition - _controller.value) *
                    MediaQuery.of(context).size.height,
                child: Opacity(
                  opacity: shape.opacity,
                  child: CustomPaint(
                    painter: ShapePainter(shape),
                    child: Container(
                      width: shape.size,
                      height: shape.size,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        );

      },
    );
  }
}

// Class to generate random shapes
class AnimatedShape {
  late double xPosition;
  late double yPosition;
  late double size;
  late double opacity;
  late ShapeType shapeType;

  AnimatedShape() {
    final random = Random();
    xPosition = random.nextDouble();
    yPosition = random.nextDouble();
    size = random.nextDouble() * 40 + 20;
    opacity = random.nextDouble();
    shapeType = ShapeType.values[random.nextInt(ShapeType.values.length)];
  }
}

enum ShapeType { bubble, diamond, star }

// Custom Painter for different shapes
class ShapePainter extends CustomPainter {
  final AnimatedShape shape;
  ShapePainter(this.shape);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(shape.opacity)
      ..style = PaintingStyle.fill;

    switch (shape.shapeType) {
      case ShapeType.bubble:
        canvas.drawCircle(Offset(size.width / 2, size.height / 2), size.width / 2, paint);
        break;
      case ShapeType.diamond:
        final path = Path()
          ..moveTo(size.width / 2, 0)
          ..lineTo(size.width, size.height / 2)
          ..lineTo(size.width / 2, size.height)
          ..lineTo(0, size.height / 2)
          ..close();
        canvas.drawPath(path, paint);
        break;
      case ShapeType.star:
        final path = Path();
        final numberOfPoints = 5;
        final radius = size.width / 2;
        final angle = 2 * pi / numberOfPoints;
        for (int i = 0; i < numberOfPoints; i++) {
          final x = radius + radius * cos(i * angle);
          final y = radius + radius * sin(i * angle);
          if (i == 0) {
            path.moveTo(x, y);
          } else {
            path.lineTo(x, y);
          }
        }
        path.close();
        canvas.drawPath(path, paint);
        break;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
