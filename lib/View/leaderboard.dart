import 'package:aanma_nalam/constant/app_theme.dart';
import 'package:aanma_nalam/constant/customnavbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LeaderBoard extends StatefulWidget {
  const LeaderBoard({super.key});

  @override
  State<LeaderBoard> createState() => _LeaderBoardState();
}

class _LeaderBoardState extends State<LeaderBoard> {
  final List<Map<String, dynamic>> leaderboard = [
    {"rank": 1, "name": "Serena", "score": 650, "image": "assets/images/Membership Avator/avator1.png"},
    {"rank": 2, "name": "Ramya", "score": 450, "image": "assets/images/Membership Avator/avator2.png"},
    {"rank": 3, "name": "Jenifer", "score": 350, "image": "assets/images/Membership Avator/avator3.png"},
    {"rank": 4, "name": "Monica", "score": 318, "image": "assets/images/Membership Avator/avator1.png"},
    {"rank": 5, "name": "John David", "score": 318, "image": "assets/images/Membership Avator/avator2.png"},
    {"rank": 1, "name": "Serena", "score": 650, "image": "assets/images/Membership Avator/avator1.png"},
    {"rank": 2, "name": "Ramya", "score": 450, "image": "assets/images/Membership Avator/avator2.png"},
    {"rank": 3, "name": "Jenifer", "score": 350, "image": "assets/images/Membership Avator/avator3.png"},
    {"rank": 4, "name": "Monica", "score": 318, "image": "assets/images/Membership Avator/avator1.png"},
    {"rank": 5, "name": "John David", "score": 318, "image": "assets/images/Membership Avator/avator2.png"},
    // Add more items as needed
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 350,
            color: AppTheme.corecolor,
            child: Column(
              children: [
                SizedBox(height: 50,),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Text(
                    'TOP 50 RANKING',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        letterSpacing: 0.9,
                        decoration: TextDecoration.none,
                        fontSize: AppTheme.mediumFontSize,
                        color: AppTheme.whitecolor,
                        fontWeight: FontWeight.w900),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Text(
                    'Keep playing to climb the leaderboard and showcase your Bible Knowledge!',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: AppTheme.verySmallFontSize,
                        color: AppTheme.whitecolor,
                        fontWeight: FontWeight.w100),
                    textAlign: TextAlign.center,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      width: 600,
                      height: 140,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // Second place
                          buildUserCard('Serena', '650', 'assets/images/Membership Avator/avator2.png', 2, Colors.grey, "assets/images/icons/Award2.png"),
                          // First place
                          buildUserCard('Serena', '650', 'assets/images/Membership Avator/avator1.png', 1, Colors.yellow, "assets/images/icons/Award1.png"),
                          // Third place
                          buildUserCard('Serena', '650', 'assets/images/Membership Avator/avator3.png', 3, Colors.pink, "assets/images/icons/Award3.png"),
                        ],
                      ),
                    ),
                  ),
                ),


               /* Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: Get.width,
                    height: Get.height * 0.22,
                    decoration: BoxDecoration(
                      color: AppTheme.ranklist,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 18.0,),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          // Second Place
                          Padding(
                            padding: const EdgeInsets.only(top: 40.0),
                            child: buildRankedUser(
                              image: 'assets/images/icons/rank3.png',
                              name: 'Ramya',
                              score: 450,
                              rank: 2,
                              grade:'assets/images/icons/Award2.png',
                            ),
                          ),
                          // First Place
                          buildRankedUser(
                            image: 'assets/images/icons/rank1.png',
                            name: 'Serena',
                            score: 650,
                            rank: 1,
                            grade:'assets/images/icons/Award1.png',
                            isFirst: true,
                          ),
                          // Third Place
                          Padding(
                            padding: const EdgeInsets.only(top: 40.0),
                            child: buildRankedUser(
                              image: 'assets/images/icons/rank3.png',
                              name: 'Jenifer',
                              score: 350,
                              rank: 3,
                              grade:'assets/images/icons/Award3.png',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),*/
              ],
            ),
          ),



          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: leaderboard.length,
              itemBuilder: (context, index) {
                final item = leaderboard[index];
                return LeaderboardTile(
                  index: index,
                  rank: item['rank'],
                  name: item['name'],
                  score: item['score'],
                  image: item['image'],
                );
              },
            ),
          ),
        ],
      ),


    );
  }

  Widget buildRankedUser({
    required String image,
    required String name,
    required int score,
    required int rank,
    required String grade,
    bool isFirst = false,
  }) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.topCenter, // Align the image to the top center of the stack
          clipBehavior: Clip.none, // Allows the image to overflow outside the stack
          children: [
            // Circular Avatar (acts as a placeholder or background)
            CircleAvatar(
              radius: isFirst ? 50 : 30,
              backgroundColor: Colors.white,
            ),

            // Positioned Image (this image overflows the CircleAvatar)
            Positioned(
              top: isFirst ? -75 : -75, // Adjusts how much the image overflows above the CircleAvatar
              left: isFirst ? -85 : -72,
              child: Image.asset(
                image,
                height: isFirst ? 280 : 200, // Adjust the size of the image
              ),
            ),

            // Positioned Medal (centered at the bottom of the image)
            Positioned(
              top: isFirst ? 0 : -40,
              child: Column(
                children: [
                  Image.asset(
                    grade,
                    height: 200,
                  ),
                ],
              ),
            ),
          ],
        ),

        const SizedBox(height: 15),
        Text(
          name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          score.toString(),
          style: const TextStyle(
            color: Colors.yellow,
            fontSize: 18,
          ),
        ),
      ],
    );
  }

  Widget buildUserCard(String name, String score, String avatar, int rank, Color medalColor, String award) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            rank == 1 ? Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  color: AppTheme.awardbgcolor,
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ): Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: AppTheme.awardbgcolor,
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            Positioned(
                child:  Column(
                  children: [
                    rank == 1 ? Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 35,
                        backgroundImage: AssetImage(avatar),
                      ),
                    ):  Padding(
                      padding: const EdgeInsets.only(top: 25.0),
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 25,
                        backgroundImage: AssetImage(avatar),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 25.0),
                          child: Container(
                            width: 55,
                            height: 15,
                            color: AppTheme.whitecolor,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 3.0, right: 3.0),
                              child: Center(
                                child: Text(
                                  name,
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w200,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Container(
                            width: 50,
                            height: 15,
                            color: AppTheme.corecolor,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 3.0, right: 3.0),
                              child: Center(
                                child: Text(
                                  score,
                                  style: TextStyle(
                                    color:  AppTheme.whitecolor,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w200,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),



                  ],
                ),),

            Positioned(
              top: rank == 1 ? 40 : -10, // Adjusts how much the image overflows above the CircleAvatar
              right: rank == 1 ? 20 : -37,
              child: Image.asset(
                award,
                height: rank == 1 ? 100 : 200, // Adjust the size of the image
              ),
            ),


          ],
        ),



      ],
    );
  }

}




class LeaderboardTile extends StatelessWidget {
  final int rank;
  final String name;
  final int score;
  final String image;
   int index;

  LeaderboardTile({
    required this.rank,
    required this.name,
    required this.score,
    required this.image,
    required this.index
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.newplayquizcontainer,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppTheme.whitecolor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '${index += 4}',
                  style: TextStyle(
                    color: AppTheme.seeallcolor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Stack(
                alignment: Alignment.topCenter,
                clipBehavior: Clip.none,

                children: [
                  CircleAvatar(
                    radius: 25, // The size of the CircleAvatar
                    backgroundColor: Colors.transparent, // Transparent background if needed
                  ),
                  Positioned(
                    top: 2,
                    child: Image.asset(
                      image, // Replace with your image path
                      height: 50, // Increase the height to make the image overflow
                    ),
                  ),
                ],
              ),

              SizedBox(width: 16),
              Expanded(
                child: Text(
                  '$name',
                  style: TextStyle(
                    color: AppTheme.seeallcolor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                '$score',
                style: TextStyle(
                  color: Colors.orangeAccent,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
















