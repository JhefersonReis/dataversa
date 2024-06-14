import 'package:dataversa/src/controllers/form_controller.dart';
import 'package:dataversa/src/widgets/title_widget.dart';
import 'package:flutter/material.dart';

class TextQuestionWidget extends StatefulWidget {
  final FormQuestion question;

  const TextQuestionWidget({super.key, required this.question});

  @override
  State<TextQuestionWidget> createState() => _TextQuestionWidgetState();
}

class _TextQuestionWidgetState extends State<TextQuestionWidget> {
  String? _errorText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleWidget(question: widget.question),
        TextField(
          controller: widget.question.textController,
          keyboardType: widget.question.type == 'N' ? TextInputType.number : TextInputType.text,
          decoration: InputDecoration(
            hintText: 'Digite sua resposta aqui... ',
            errorText: _errorText,
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
          style: const TextStyle(
            fontSize: 16,
          ),
          onChanged: (value) {
            widget.question.textController?.text = value;
            setState(() {
              _errorText = null;
            });
          },
        ),
      ],
    );
  }
}
