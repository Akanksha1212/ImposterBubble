import 'package:imposterbubble/quiz/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  final String questionnaireName;
  final String interpretation;

  ResultScreen({required this.questionnaireName, required this.interpretation});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffc6ceff),
      body: Container(
        width: size.width,
        height: size.height,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/out.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Container(
                  width: constraints.maxWidth * 0.85,
                  height: constraints.maxHeight * 0.8,
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 40.0, bottom: 20),
                          child: Text(
                            ' Your Result: ',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.zillaSlabHighlight(
                              textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        Image.asset(
                          "assets/frogg.gif",
                          height: 120,
                          width: 120,
                        ),
                        Text(
                          interpretation,
                          style: GoogleFonts.comfortaa(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0
                              // fontStyle: FontStyle.italic,

                              ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Text(
                            "For this type, success is rarely satisfying because they believe they could’ve done even better. But that’s neither productive nor healthy. Owning and celebrating achievements is essential if you want to avoid burnout, find contentment, and cultivate self-confidence.Learn to take your mistakes in stride, viewing them as a natural part of the process. In addition, push yourself to act before you’re ready. Force yourself to start the project you’ve been planning for months. Truth is, there will never be the “perfect time” and your work will never be 100% flawless. The sooner you’re able to accept that, the better off you’ll be.",
                            style: GoogleFonts.montserrat(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0
                                // fontStyle: FontStyle.italic,

                                ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              height: 50,
                              width: 190,
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
                                  'Go back home',
                                  style: GoogleFonts.comfortaa(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 0
                                      // fontStyle: FontStyle.italic,

                                      ),
                                ),
                                onPressed: () => Navigator.of(context).pop(),
                              ),
                            ),
                          ),
                        ),
                      ],
                      //
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
