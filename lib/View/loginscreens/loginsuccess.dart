import 'package:aanma_nalam/constant/app_theme.dart';
import 'package:aanma_nalam/constant/mainscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:confetti/confetti.dart';
import 'package:audioplayers/audioplayers.dart';

class LoginSuccess extends StatefulWidget {
  const LoginSuccess({super.key});

  @override
  State<LoginSuccess> createState() => _LoginSuccessState();
}

class _LoginSuccessState extends State<LoginSuccess> {
  // Confetti controller to control the confetti effect
  late ConfettiController _confettiController;

  // Audio player for the sound effect
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    // Initialize confetti controller with a longer duration to flow more particles
    _confettiController = ConfettiController(duration: const Duration(seconds: 15));

    // Play confetti and sound as soon as the screen loads
    _playCelebration();

  }

  // Play confetti and sound effect
  void _playCelebration() {
    _confettiController.play();
    _audioPlayer.play(AssetSource('audio/welcome-madagascar-184168.mp3')); // Play the sound from assets
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    _confettiController.dispose();
    // Dispose the audio player
    super.dispose();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Main content for Login Success screen
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: AppTheme.corecolor, // Red background at the top
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 100), // Spacing from the top
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: AppTheme.whitecolor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 35),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Get.back();
                                },
                                child: Image.asset(
                                  'assets/images/icons/Vector.png', // Ensure correct path
                                  width: 25,
                                  height: 25,
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/login_success.png', // Ensure correct path
                                  width: MediaQuery.of(context).size.width * 1, // Responsive width
                                ),
                                Text(
                                  'Yey! Login Successful',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: AppTheme.coretextcolor,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  'You will be moved to home screen right now.\nEnjoy the features!',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: AppTheme.mediumFontSize,
                                    color: AppTheme.seeallcolor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 350,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 50,
                                  vertical: 15,
                                ),
                              ),
                              onPressed: () {
                                Get.offNamed('/homescreen');
                              },
                              child: const Text(
                                'Let\'s Explore',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 70), // Adjust bottom spacing if needed
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Confetti Effect
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              confettiController: _confettiController,
              blastDirectionality: BlastDirectionality.explosive, // Confetti in all directions
              emissionFrequency: 0.05, // Emit more particles per second
              numberOfParticles: 40, // Increase the number of particles for a denser flow
              maxBlastForce: 100, // Stronger blast force
              minBlastForce: 20, // Minimum blast force
              gravity: 0.3, // Confetti will fall more slowly to create a floating effect
              shouldLoop: false, // Confetti will stop after 10 seconds
              colors: [Colors.red, Colors.green, Colors.blue, Colors.yellow, Colors.purple], // Confetti colors
              createParticlePath: drawStar, // Optional: Custom particle shape (e.g., stars)
            ),
          ),
        ],
      ),
    );
  }


  // Optional: Function to draw a custom star shape for confetti particles
  Path drawStar(Size size) {
    // Drawing a star path as the shape of confetti particles
    double start = size.width / 2;
    Path path = Path();
    path.moveTo(start, 0);
    for (int i = 0; i < 5; i++) {
      path.lineTo(start + size.width * 0.25 * (i.isOdd ? 1 : -1),
          size.height * (i.isOdd ? 1 : 0.4));
      path.lineTo(start + size.width * 0.25 * (i.isEven ? 1 : -1),
          size.height * (i.isEven ? 1 : 0.4));
    }
    path.close();
    return path;
  }
}
