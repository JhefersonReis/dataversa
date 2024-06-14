import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

void unfocus(BuildContext context) => FocusScope.of(context).unfocus();

extension UnFocusExtension on BuildContext {
  void unfocus() => FocusScope.of(this).unfocus();
}

class Helpers {
  void showToastMessage({
    required String message,
    String description = '',
    bool isError = false,
    bool isSuccess = false,
    int? duration,
  }) {
    toastification.show(
      title: Text(message),
      description: description.isNotEmpty ? Text(description) : null,
      style: ToastificationStyle.fillColored,
      alignment: Alignment.topCenter,
      dismissDirection: DismissDirection.vertical,
      type: isError
          ? ToastificationType.error
          : isSuccess
              ? ToastificationType.success
              : ToastificationType.info,
      autoCloseDuration: Duration(seconds: duration ?? 3),
      showProgressBar: false,
      animationDuration: const Duration(milliseconds: 350),
      closeOnClick: true,
    );
  }

  void showErrorMessage(String message) {
    final errorMessage = message.replaceAll('Exception:', '');

    showToastMessage(message: errorMessage, isError: true);
  }
}
