import 'dart:io';
import 'dart:math';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:path_provider/path_provider.dart';

class Affirmations extends StatefulWidget {
  @override
  _AffirmationsState createState() => _AffirmationsState();
}

class _AffirmationsState extends State<Affirmations> {
  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _text = 'Press the button and start speaking';
  double _confidence = 1.0;
  var list = [
    'I am beautiful',
    'I believe in myself',
    'I don\'t care what others say',
    'I am capable of doing everything',
    'I am successful',
    'I am amazing',
  ];
  var quote = "";
  void NewQuote() {
    final _random = new Random();
    var element = list[_random.nextInt(list.length)];
    setState(() {
      quote = element;
    });
  }

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AvatarGlow(
        animate: _isListening,
        glowColor: Color(0xff87dcb2),
        endRadius: 75.0,
        duration: const Duration(milliseconds: 8000),
        repeatPauseDuration: const Duration(milliseconds: 100),
        repeat: true,
        child: FloatingActionButton(
          onPressed: _listen,
          child: Icon(_isListening ? Icons.mic : Icons.mic_none),
          backgroundColor: Color(0xff87dcb2),
        ),
      ),
      body: SafeArea(
        child: Container(
          width: size.width,
          height: size.height,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/room.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(35.0),
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(quote,
                                style: GoogleFonts.comfortaa(
                                    color: Colors.black,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0
                                    // fontStyle: FontStyle.italic,

                                    ),
                                maxLines: 6),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            child: Icon(
                              Icons.shuffle,
                              size: 30,
                            ),
                            onTap: NewQuote,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      _text,
                      style: GoogleFonts.comfortaa(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0
                          // fontStyle: FontStyle.italic,

                          ),
                    ),
                    Container(
                      child: quote == _text
                          ? Image.asset("assets/frogg.gif")
                          : Image.asset("assets/wrong.gif"),
                    ),
                    Container(
                      width: 300,
                      color: Colors.amber[100],
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Center(
                          child: Text(
                            quote == _text
                                ? "Awesome!"
                                : "You're not saying it correctly. Try again",
                            style: GoogleFonts.comfortaa(
                                color: Colors.green,
                                fontSize: 25,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0
                                // fontStyle: FontStyle.italic,

                                ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 160,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) => setState(() {
            _text = val.recognizedWords;
            if (val.hasConfidenceRating && val.confidence > 0) {
              _confidence = val.confidence;
            }
          }),
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }
}
