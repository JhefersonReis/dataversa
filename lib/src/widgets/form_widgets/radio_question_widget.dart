import 'dart:developer';

import 'package:dataversa/src/controllers/form_controller.dart';
import 'package:flutter/material.dart';

class RadioQuestionWidget extends StatefulWidget {
  final FormQuestion question;

  const RadioQuestionWidget({super.key, required this.question});

  @override
  State<RadioQuestionWidget> createState() => _RadioQuestionWidgetState();
}

class _RadioQuestionWidgetState extends State<RadioQuestionWidget> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.question.question, style: const TextStyle(fontWeight: FontWeight.bold)),
        ...widget.question.answerOptions.map((answerOptions) {
          return RadioListTile(
            title: Text(answerOptions.answer),
            value: answerOptions.key,
            groupValue: widget.question.selectedRadioOption,
            onChanged: (String? value) {
              setState(() {
                selectedValue = value;
                widget.question.selectedRadioOption = value!;
              });
              log('Selected value: $value');
              log('Key: ${answerOptions.key}');
            },
          );
        }),
      ],
    );
  }
}
