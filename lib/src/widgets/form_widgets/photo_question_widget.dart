import 'dart:developer';

import 'package:dataversa/src/controllers/form_controller.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import '../camera.dart';

class PhotoQuestionWidget extends StatefulWidget {
  final FormQuestion question;

  const PhotoQuestionWidget({super.key, required this.question});

  @override
  State<PhotoQuestionWidget> createState() => _PhotoQuestionWidgetState();
}

class _PhotoQuestionWidgetState extends State<PhotoQuestionWidget> {
  Future<void> _navigateAndCapturePhoto(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CameraScreen()),
    );

    if (result != null && result is String) {
      setState(() {
        widget.question.imagePaths.add(result);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              widget.question.question,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            if (widget.question.mandatory)
              const Text(
                ' Obrigatório*',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 12,
                ),
              ),
          ],
        ),
        ElevatedButton(
          onPressed: () => _navigateAndCapturePhoto(context),
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 40),
          ),
          child: const Text('Tirar foto'),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for (final imagePath in widget.question.imagePaths)
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Deletar a seguinte foto?'),
                          content: Image.file(
                            File(imagePath),
                            width: 320,
                            height: 320,
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Cancelar'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                setState(() {
                                  widget.question.imagePaths.remove(imagePath);
                                });
                              },
                              child: const Text('Deletar'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.file(
                      File(imagePath!),
                      width: 100,
                      height: 100,
                    ),
                  ),
                ),
            ],
          ),
        )
      ],
    );
  }
}
