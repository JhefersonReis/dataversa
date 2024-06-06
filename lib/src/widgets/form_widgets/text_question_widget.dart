import 'package:dataversa/src/controllers/form_controller.dart';
import 'package:flutter/material.dart';

class TextQuestionWidget extends StatefulWidget {
  final FormQuestion question;

  const TextQuestionWidget({super.key, required this.question});

  @override
  State<TextQuestionWidget> createState() => _TextQuestionWidgetState();
}

class _TextQuestionWidgetState extends State<TextQuestionWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.question.question,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        TextField(
          controller: widget.question.textController,
          keyboardType: widget.question.type == 'N' ? TextInputType.number : TextInputType.text,
          decoration: const InputDecoration(
            hintText: 'Enter your answer here',
          ),
          style: const TextStyle(
            fontSize: 16,
          ),
          onChanged: (value) {
            widget.question.textController?.text = value;
          },
        ),
      ],
    );
  }
}
