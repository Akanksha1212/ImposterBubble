import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:imposterbubble/screens/read.dart';
import 'package:imposterbubble/screens/videos.dart';
import 'package:url_launcher/url_launcher.dart';

class Resources extends StatefulWidget {
  const Resources({Key? key}) : super(key: key);

  @override
  State<Resources> createState() => _ResourcesState();
}

class _ResourcesState extends State<Resources> {
  void _launchURL() async {
    if (!await launch(
        "https://www.sciencetheearth.com/uploads/2/4/6/5/24658156/2011_sakulku_the_impostor_phenomenon.pdf"))
      throw 'Could not launch ';
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      width: size.width,
      height: size.height,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/back2.jpeg'),
          fit: BoxFit.cover,
        ),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/plant.gif",
                height: 300,
                width: 300,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 50,
                      width: 210,
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
                          'Videos',
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
                                  builder: (context) => Videos()));
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 30, 15, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 50,
                      width: 210,
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
                            'Self help books',
                            style: GoogleFonts.comfortaa(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0
                                // fontStyle: FontStyle.italic,

                                ),
                          ),
                          onPressed: _launchURL),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 30, 15, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 50,
                      width: 210,
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
                          'Community',
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
              // Image.network(
              //     "https://cdn.resume.io/assets/specials/are_you_suffering_from_impostor_syndrome-3b5e9e831e4a12623e3facec6a770054e065be37677f00f0235bec972fb78d68.png")
            ],
          ),
        ),
      ),
    ));
  }
}
