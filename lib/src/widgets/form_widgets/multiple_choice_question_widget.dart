import 'package:dataversa/src/controllers/form_controller.dart';
import 'package:dataversa/src/widgets/title_widget.dart';
import 'package:flutter/material.dart';

class MultipleChoiceQuestionWidget extends StatefulWidget {
  final FormQuestion question;

  const MultipleChoiceQuestionWidget({super.key, required this.question});

  @override
  State<MultipleChoiceQuestionWidget> createState() => _MultipleChoiceQuestionWidgetState();
}

class _MultipleChoiceQuestionWidgetState extends State<MultipleChoiceQuestionWidget> {
  TextEditingController? otherController;

  @override
  void initState() {
    super.initState();
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
        if (widget.question.other == 'Y')
          CheckboxListTile(
            title: Row(
              children: [
                const Text('Outro: '),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: TextField(
                      controller: otherController,
                      onChanged: (String value) {
                        setState(() {
                          widget.question.otherValue = value;
                          otherController?.text = value;
                        });
                      },
                      enabled: widget.question.otherValue != null,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Digite sua resposta aqui... ',
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            value: widget.question.otherValue != null,
            onChanged: (bool? value) {
              setState(() {
                if (value == true) {
                  widget.question.otherValue = otherController?.text;
                } else {
                  widget.question.otherValue = null;
                  otherController?.clear();
                }
              });
            },
          ),
      ],
    );
  }
}
