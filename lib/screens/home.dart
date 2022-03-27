import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:imposterbubble/quiz/screens/home_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: size.width,
          height: size.height,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/back1.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset(
                      "assets/frog.gif",
                      height: 100,
                      width: 100,
                    ),
                    Text(
                      "Let's fight imposter syndrome\ntogether!!!",
                      style: GoogleFonts.comfortaa(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0
                          // fontStyle: FontStyle.italic,

                          ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Container(
                        height: 50,
                        width: 130,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                side: BorderSide(
                                  color: Colors.black,
                                  width: 1.0,
                                ),
                              ),
                            ),
                          ),
                          child: Text(
                            'Quiz',
                            style: GoogleFonts.comfortaa(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0
                                // fontStyle: FontStyle.italic,

                                ),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      "assets/moon.png",
                      height: 105,
                      width: 105,
                    ),
                    Container(
                      height: 50,
                      width: 170,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              side: BorderSide(
                                color: Colors.black,
                                width: 1.0,
                              ),
                            ),
                          ),
                        ),
                        child: Text(
                          'Affirmations',
                          style: GoogleFonts.comfortaa(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0
                              // fontStyle: FontStyle.italic,

                              ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Container(
                        height: 50,
                        width: 130,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                side: BorderSide(
                                  color: Colors.black,
                                  width: 1.0,
                                ),
                              ),
                            ),
                          ),
                          child: Text(
                            'About',
                            style: GoogleFonts.comfortaa(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0
                                // fontStyle: FontStyle.italic,

                                ),
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
                Image.asset(
                  "assets/tp.gif",
                  height: 200,
                  width: 200,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Container glassmorphismWindow(Size size) {
  //   return Container(
  //     width: size.width * 0.9,
  //     height: size.height * 0.9,
  //     decoration: BoxDecoration(
  //       color: Colors.white.withOpacity(0.6),
  //       borderRadius: BorderRadius.circular(20),
  //     ),
  //     child: Container(
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           SizedBox(
  //             height: 30,
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
}
