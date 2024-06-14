import 'dart:developer';

import 'package:dataversa/src/controllers/form_controller.dart';
import 'package:dataversa/src/widgets/title_widget.dart';
import 'package:flutter/material.dart';

class RadioQuestionWidget extends StatefulWidget {
  final FormQuestion question;

  const RadioQuestionWidget({super.key, required this.question});

  @override
  State<RadioQuestionWidget> createState() => _RadioQuestionWidgetState();
}

class _RadioQuestionWidgetState extends State<RadioQuestionWidget> {
  String? selectedValue;
  TextEditingController? otherController;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.question.selectedRadioOption;
    if (widget.question.other == 'Y') {
      otherController = TextEditingController(text: widget.question.otherValue);
    }
  }

  @override
  void dispose() {
    super.dispose();
    if (widget.question.other == 'Y') {
      otherController?.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleWidget(question: widget.question),
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
        if (widget.question.other == 'Y')
          RadioListTile(
            title: Row(
              children: [
                const Text('Outro: '),
                Expanded(
                  child: TextField(
                    controller: otherController,
                    enabled: selectedValue == 'other',
                    onChanged: (value) {
                      widget.question.otherValue = value;
                    },
                    decoration: InputDecoration(
                      hintText: 'Digite sua resposta aqui...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            value: 'other',
            groupValue: selectedValue,
            onChanged: (String? value) {
              setState(() {
                selectedValue = value;
                widget.question.selectedRadioOption = value!;
              });
              log('Selected value: $value');
            },
          ),
      ],
    );
  }
}
