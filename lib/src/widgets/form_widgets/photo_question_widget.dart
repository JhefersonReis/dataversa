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
        Text(widget.question.question, style: const TextStyle(fontWeight: FontWeight.bold)),
        ElevatedButton(
          onPressed: () => _navigateAndCapturePhoto(context),
          child: const Text('Take a photo'),
        ),
        Row(
          children: [
            for (final imagePath in widget.question.imagePaths)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.file(
                  File(imagePath!),
                  width: 100,
                  height: 100,
                ),
              ),
          ],
        )
      ],
    );
  }
}