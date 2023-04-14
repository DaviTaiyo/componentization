import 'package:flutter/material.dart';

//custom Alert
Future<bool?> showCustomDialog(
    {required BuildContext context,
    required String title,
    required String body,
    required String cancel,
    required String confirm,
    String? cancelText,
    String? confirmText,
    bool needConfirm = true}) async {
  return showDialog<bool>(
    context: context,
    barrierDismissible: false,
    builder: (_) {
      return _CustomAlert(
        color: Theme.of(context).primaryColor,
        title: title,
        msg: body,
        needConfirm: needConfirm,
        cancel: cancel,
        confirm: confirm,
        cancelText: cancelText ?? cancel,
        confirmText: confirmText ?? confirm,
      );
    },
  );
}

class _CustomAlert extends StatelessWidget {
  _CustomAlert(
      {required this.title,
      required this.msg,
      required this.needConfirm,
      required this.cancel,
      required this.confirm,
      required this.color,
      this.cancelText,
      this.confirmText});

  final Color color;
  final String title;
  final String msg;
  final String cancel;
  final String confirm;
  final bool needConfirm;
  final String? cancelText;
  final String? confirmText;

  Widget _buttons(context) {
    if (needConfirm) {
      return Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 45,
              child: TextButton(
                child: Text(cancelText ?? cancel),
                onPressed: () => Navigator.pop(context, false),
              ),
            ),
          ),
          VerticalDivider(width: 2),
          Expanded(
            child: SizedBox(
              height: 45,
              child: TextButton(
                child: Text(confirmText ?? confirm),
                onPressed: () => Navigator.pop(context, true),
              ),
            ),
          ),
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: SizedBox(
              height: 45,
              child: TextButton(
                child: Text('OK'),
                onPressed: () => Navigator.pop(context, true),
              ),
            ),
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: color,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10, top: 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(msg),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: IntrinsicHeight(child: _buttons(context)),
            ),
          ],
        ),
      ),
    );
  }
}
