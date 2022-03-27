import 'dart:convert';

import 'package:imposterbubble/quiz/enums/questionnaire_type.dart';
import 'package:imposterbubble/quiz/models/questionnaire.dart';
import 'package:flutter/services.dart' show rootBundle;

class QuestionnaireService {
  String? _getQuestionnaireAssetPath(QuestionnaireType questionnaireType) {
    switch (questionnaireType) {
      case QuestionnaireType.satisfaction:
        return 'assets/ques.json';
      default:
        return null;
    }
  }

  Future<Questionnaire> getQuestionnaire(
      QuestionnaireType questionnaireType) async {
    final assetPath = _getQuestionnaireAssetPath(questionnaireType);
    final jsonData = await rootBundle.loadString(assetPath!);
    final jsonDataDecoded = jsonDecode(jsonData);
    return Questionnaire.fromJson(jsonDataDecoded);
  }
}
