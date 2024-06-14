import 'dart:async';
import 'dart:developer';

import 'package:dataversa/src/controllers/form_controller.dart';
import 'package:dataversa/src/helpers/helpers.dart';
import 'package:dataversa/src/widgets/question_group.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:signals/signals_flutter.dart';

class FormWidget extends StatefulWidget {
  final FormStructure formStructure;
  final int responseId;

  const FormWidget({super.key, required this.formStructure, required this.responseId});

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final formController = GetIt.I.get<FormController>();
  final PageController _pageController = PageController();
  final _currentPage = signal(0);
  bool _isLoading = true;

  Helpers helpers = Helpers();

  @override
  void initState() {
    super.initState();
    _loadFormData();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
    _currentPage.dispose();
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

  void _saveForm() async {
    final completer = Completer<bool>();
    formController.saveAnswers(widget.formStructure, widget.responseId, completer);

    final result = await completer.future;
    if (result) {
      helpers.showToastMessage(message: 'Answers saved successfully!', isSuccess: true);
      if (mounted) {
        context.pop();
      }
    }
  }

  void _nextPage() {
    if (_currentPage.value < widget.formStructure.form.length - 1) {
      _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    }
  }

  bool get _isLastPage {
    return _currentPage.value == widget.formStructure.form.length - 1;
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('ID: ${widget.responseId} - '),
            Text(widget.formStructure.title),
          ],
        ),
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: widget.formStructure.form.length,
        onPageChanged: (index) {
          _currentPage.value = index;
        },
        itemBuilder: (context, index) {
          final group = widget.formStructure.form[index];
          return SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 80),
            child: GroupWidget(group: group),
          );
        },
      ),
      floatingActionButton: Watch(
        (context) => FloatingActionButton.extended(
          onPressed: _isLastPage ? _saveForm : _nextPage,
          tooltip: _isLastPage ? 'Salvar' : 'Próximo',
          label: Text(_isLastPage ? 'Salvar' : 'Próximo'),
          icon: Icon(_isLastPage ? Icons.save : Icons.arrow_forward),
        ),
      ),
    );
  }
}

class PageState extends InheritedWidget {
  final PageController pageController;
  final ValueNotifier<int> currentPage;

  const PageState({
    super.key,
    required this.pageController,
    required this.currentPage,
    required super.child,
  });

  static PageState of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<PageState>()!;
  }

  @override
  bool updateShouldNotify(PageState oldWidget) {
    return currentPage != oldWidget.currentPage;
  }

  void nextPage() {
    if (currentPage.value < pageController.positions.length - 1) {
      pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    }
  }

  bool isLastPage() {
    return currentPage.value == pageController.positions.length - 1;
  }
}
