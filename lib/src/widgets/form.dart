import 'package:dataversa/src/controllers/form_controller.dart';
import 'package:dataversa/src/widgets/question_group.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class FormWidget extends StatefulWidget {
  final FormStructure formStructure;
  final int responseId;

  const FormWidget({super.key, required this.formStructure, required this.responseId});

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final formController = GetIt.I.get<FormController>();
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadFormData();
  }

  Future<void> _loadFormData() async {
    await formController.loadFormData(
      widget.responseId,
      widget.formStructure.form.expand((group) => group.questions).toList(),
    );
    setState(() {
      _isLoading = false;
    });
  }

  // @override
  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.formStructure.title),
      ),
      body: ListView.builder(
        itemCount: widget.formStructure.form.length,
        itemBuilder: (context, index) {
          final group = widget.formStructure.form[index];
          return GroupWidget(group: group);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          // Save the form
          await formController.saveAnswers(widget.formStructure, widget.responseId);
          // ScaffoldMessenger.of(context).showSnackBar(
          //   const SnackBar(
          //     content: Text('Answers saved successfully!'),
          //   ),
          // );
        },
        tooltip: 'Salvar',
        label: const Text('Salvar'),
        icon: const Icon(Icons.save),
      ),
    );
  }
}
