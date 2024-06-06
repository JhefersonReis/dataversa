import 'package:dataversa/src/controllers/form_controller.dart';
import 'package:dataversa/src/widgets/question.dart';
import 'package:flutter/material.dart';

class GroupWidget extends StatelessWidget {
  final FormGroup group;

  const GroupWidget({super.key, required this.group});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(group.name, style: const TextStyle(fontWeight: FontWeight.bold)),
        ...group.questions.map((question) {
          return QuestionWidget(question: question);
        }),
      ],
    );
  }
}
