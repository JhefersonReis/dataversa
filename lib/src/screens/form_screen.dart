import 'package:dataversa/src/controllers/form_controller.dart';
import 'package:dataversa/src/widgets/form.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class FormScreen extends StatefulWidget {
  final int responseId;
  final int surveyId;

  const FormScreen({super.key, required this.responseId, required this.surveyId});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final formController = GetIt.I.get<FormController>();
  Future<FormStructure>? formStructure;

  @override
  void initState() {
    super.initState();
    formStructure = formController.getSurveyForm(widget.surveyId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<FormStructure>(
        future: formStructure,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator.adaptive());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData || snapshot.data == null) {
            return const Text('No data available');
          }

          return FormWidget(formStructure: snapshot.data!, responseId: widget.responseId);
        },
      ),
    );
  }
}
