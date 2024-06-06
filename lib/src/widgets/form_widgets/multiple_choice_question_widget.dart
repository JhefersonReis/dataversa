import 'package:dataversa/src/controllers/form_controller.dart';
import 'package:flutter/material.dart';

class MultipleChoiceQuestionWidget extends StatefulWidget {
  final FormQuestion question;

  const MultipleChoiceQuestionWidget({super.key, required this.question});

  @override
  State<MultipleChoiceQuestionWidget> createState() => _MultipleChoiceQuestionWidgetState();
}

class _MultipleChoiceQuestionWidgetState extends State<MultipleChoiceQuestionWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.question.question, style: const TextStyle(fontWeight: FontWeight.bold)),
        ...widget.question.subQuestions.map((subQuestion) {
          return CheckboxListTile(
            title: Text(subQuestion.question),
            value: subQuestion.isSelected,
            onChanged: (bool? value) {
              setState(() {
                subQuestion.isSelected = value ?? false;
              });
            },
          );
        }),
      ],
    );
  }
}
