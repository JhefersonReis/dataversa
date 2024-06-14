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
    if (question.title == 'GEOLOCALIZACAO' || question.title == 'USUARIO') {
      return const SizedBox.shrink();
    }
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 242, 240, 240),
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(12.0),
      margin: const EdgeInsets.only(bottom: 12.0),
      child: () {
        switch (question.type) {
          case 'T' || 'S' || 'N':
            return TextQuestionWidget(question: question);
          case 'L':
            return RadioQuestionWidget(question: question);
          case 'M':
            return MultipleChoiceQuestionWidget(question: question);
          case '|':
            return PhotoQuestionWidget(question: question);
          default:
            return const SizedBox.shrink();
        }
      }(),
    );
  }
}
