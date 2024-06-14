import 'package:dataversa/src/controllers/form_controller.dart';
import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  final FormQuestion question;

  const TitleWidget({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Text(
            question.question,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          if (question.mandatory)
            const Text(
              ' Obrigatório*',
              style: TextStyle(
                color: Colors.red,
                fontSize: 12,
              ),
            ),
        ],
      ),
    );
  }
}
