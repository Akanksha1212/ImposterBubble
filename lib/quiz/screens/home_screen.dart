import 'package:imposterbubble/quiz/enums/questionnaire_type.dart';
import 'package:imposterbubble/quiz/models/questionnaire.dart';
import 'package:imposterbubble/quiz/screens/questionnaire_screen.dart';
import 'package:imposterbubble/quiz/services/questionnaire_service.dart';
import 'package:imposterbubble/quiz/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Questionnaire> questionnaires;
  late Future<bool> loadAllQuestionnairesFuture;

  @override
  void initState() {
    super.initState();

    loadAllQuestionnairesFuture = loadAllQuestionnaires();
  }

  Future<bool> loadAllQuestionnaires() async {
    final questionnaireService = QuestionnaireService();
    questionnaires = [];
    for (QuestionnaireType questionnaireType in QuestionnaireType.values) {
      final questionnaire =
          await questionnaireService.getQuestionnaire(questionnaireType);

      // if something went wrong, stop loading questionnaires
      if (questionnaire == null) {
        return false;
      }

      questionnaires.add(questionnaire);
    }

    return true;
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
            image: AssetImage('assets/back1.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: FutureBuilder(
          future: loadAllQuestionnairesFuture,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData && snapshot.data == true) {
              return Center(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.all(25),
                      child: Text(
                        'You know that you suffer from imposter syndrome but do you know which kind? This quiz is build around Valerie Young\'s work' +
                            'outlining the five types of imposter syndrome and will offer some suggestions on moving past the form you\'re dealing with. Which kind of imposter are you?',
                        //textAlign: TextAlign.left,
                        style: GoogleFonts.comfortaa(
                          textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 19,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    for (Questionnaire questionnaire in questionnaires)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 50,
                          width: 170,
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
                              'Let\'s find out',
                              style: GoogleFonts.comfortaa(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0
                                  // fontStyle: FontStyle.italic,

                                  ),
                            ),
                            onPressed: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => QuestionnaireScreen(
                                  questionnaire: questionnaire,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              );
            } else if (snapshot.hasError ||
                (snapshot.connectionState == ConnectionState.done &&
                    snapshot.data == false)) {
              return AlertDialog(
                title: Text('Ooops something went wrong!'),
                actions: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ElevatedButton(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Try Again",
                          style: GoogleFonts.abel(
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color(0xffc6ceff)),
                          shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: BorderSide(color: Color(0xffc6ceff))))),
                      onPressed: () => setState(() {
                        loadAllQuestionnairesFuture = loadAllQuestionnaires();
                      }),
                    ),
                  ),
                ],
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
