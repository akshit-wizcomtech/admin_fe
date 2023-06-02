import 'package:flutter/material.dart';

Future<Map?> alertDialogBox({
  required BuildContext context,
  Widget? title,
  Widget? content,
  List<Widget>? Function({required BuildContext context, Map? data})? actions,
}) async {
  return await showDialog<Map?>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: title,
        content: content,
        actions: actions!(context: context),
      );
    },
  );
}
