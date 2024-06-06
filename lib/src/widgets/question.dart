import 'package:dataversa/src/controllers/form_controller.dart';
import 'package:dataversa/src/widgets/form_widgets/photo_question_widget.dart';
import 'package:flutter/material.dart';

import 'form_widgets/multiple_choice_question_widget.dart';
import 'form_widgets/radio_question_widget.dart';
import 'form_widgets/text_question_widget.dart';

class QuestionWidget extends StatelessWidget {
  final FormQuestion question;

  const QuestionWidget({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    switch (question.type) {
      case 'M': // Multiple choice
        return MultipleChoiceQuestionWidget(question: question);
      case 'T' || 'S' || 'N': // Text question
        return TextQuestionWidget(question: question);
      case 'L': // Radio button question
        return RadioQuestionWidget(question: question);
      case '|': // Photo question
        return PhotoQuestionWidget(question: question);
      default:
        return const Text('Unknown question type');
    }
  }
}
