// ignore_for_file: deprecated_member_use

import 'package:dots_indicator/dots_indicator.dart';
import 'package:imposterbubble/quiz/models/answer.dart';
import 'package:imposterbubble/quiz/models/interpretation.dart';
import 'package:imposterbubble/quiz/models/question.dart';
import 'package:imposterbubble/quiz/models/questionnaire.dart';
import 'package:imposterbubble/quiz/screens/result_screen.dart';
import 'package:imposterbubble/quiz/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grouped_buttons/grouped_buttons.dart';

class QuestionnaireScreen extends StatefulWidget {
  final Questionnaire questionnaire;

  QuestionnaireScreen({required this.questionnaire});

  @override
  _QuestionnaireScreenState createState() => _QuestionnaireScreenState();
}

class _QuestionnaireScreenState extends State<QuestionnaireScreen> {
  List get questions => widget.questionnaire.questions;
  late int questionIndex;
  Question get currentQuestion => questions[questionIndex];
  int get numberOfQuestions => questions.length;
  late List<int> chosenAnswers;
  bool get userHasAnsweredCurrentQuestion =>
      chosenAnswers[questionIndex] != null;
  String get instructions => widget.questionnaire.instructions;

  String getResultInterpretation() {
    // calculate user's total score
    int result = 0;
    for (int index = 0; index < numberOfQuestions; index++) {
      Question question = questions[index];
      int answerIndex = chosenAnswers[index];
      Answer answer = question.answers[answerIndex];
      int score = answer.score;

      result += score;
    }

    // determine interpretation for result
    List<Interpretation> interpretations = widget.questionnaire.interpretations;
    for (Interpretation interpretation in interpretations) {
      if (result >= interpretation.score) {
        return interpretation.text;
      }
    }

    // if something went wrong, return the worst interpretation
    return interpretations.last.text;
  }

  @override
  void initState() {
    super.initState();

    questionIndex = 0;
    chosenAnswers = List.filled(numberOfQuestions, 0);
  }

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
            image: AssetImage('assets/back.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
                  child: Text(
                    instructions,
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.comfortaa(
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 16,
                        ),
                        Center(
                          child: DotsIndicator(
                            dotsCount: numberOfQuestions,
                            position: questionIndex.toDouble(),
                            decorator: DotsDecorator(
                              size: Size.square(15),
                              activeSize: Size(18, 18),
                              activeColor: Theme.of(context).primaryColor,
                              color: Theme.of(context).disabledColor,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 30.0, right: 8.0),
                          child: Text(
                            currentQuestion.text,
                            style: GoogleFonts.comfortaa(
                              textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        RadioButtonGroup(
                          activeColor: Theme.of(context).primaryColor,
                          labels: currentQuestion.answers
                              .map((answer) => answer.text)
                              .toList(),
                          onChange: (_, answerIndex) => setState(() {
                            chosenAnswers[questionIndex] = answerIndex;
                          }),
                          picked: !userHasAnsweredCurrentQuestion
                              ? ""
                              : currentQuestion
                                  .answers[chosenAnswers[questionIndex]].text,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Visibility(
                                visible: questionIndex != 0,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                    height: 40,
                                    width: 100,
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.white),
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            side: BorderSide(
                                              color: Colors.black,
                                              width: 1.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      child: Text(
                                        'Back',
                                        style: GoogleFonts.comfortaa(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 0
                                            // fontStyle: FontStyle.italic,

                                            ),
                                      ),
                                      onPressed: onBackButtonPressed,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  height: 40,
                                  width: 100,
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.white),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          side: BorderSide(
                                            color: Colors.black,
                                            width: 1.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    child: Text(
                                      'Next',
                                      style: GoogleFonts.comfortaa(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 0
                                          // fontStyle: FontStyle.italic,

                                          ),
                                    ),
                                    onPressed: userHasAnsweredCurrentQuestion
                                        ? onNextButtonPressed
                                        : null,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onNextButtonPressed() {
    if (questionIndex < numberOfQuestions - 1) {
      setState(() {
        questionIndex++;
      });
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(
            questionnaireName: widget.questionnaire.name,
            interpretation: getResultInterpretation(),
          ),
        ),
      );
    }
  }

  void onBackButtonPressed() {
    if (questionIndex > 0) {
      setState(() {
        questionIndex--;
      });
    }
  }
}
