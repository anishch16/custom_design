import 'package:flutter/material.dart';

class SSnackbarUtil {
  SSnackbarUtil._();

  static void showSnackbar(BuildContext context, String message, SnackbarType type) {
    Color color = Colors.grey.shade300;
    switch (type) {
      case SnackbarType.info:
        color = Colors.grey.shade300;
        break;
      case SnackbarType.warning:
        color = Colors.red.shade300;
        break;
      case SnackbarType.error:
        color = Colors.red.shade300;
        break;
      case SnackbarType.success:
        color = Colors.green.shade300;
        break;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          maxLines: 4,
          style: TextStyle(
            color: Colors.black, // Adjust color as needed
          ),
        ),
        backgroundColor: color,
        duration: Duration(seconds: 2),
      ),
    );
  }
}

enum SnackbarType { info, warning, error, success }
