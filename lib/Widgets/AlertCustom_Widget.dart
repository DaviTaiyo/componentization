import 'package:flutter/material.dart';

//custom Dialog
Future<bool?> showCustomDialog(
    {required BuildContext context,
    required String title,
    required String body,
    required Color color,
    required String cancel,
    required String confirm,
    final Widget? child,
    final Color? textColor,
    String? cancelText,
    String? confirmText,
    bool needConfirm = true}) async {
  return showDialog<bool>(
    context: context,
    barrierDismissible: false,
    builder: (_) {
      return _CustomAlert(
        color: color,
        textColor: textColor,
        child: child,
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
      this.textColor,
      this.child,
      this.cancelText,
      this.confirmText});
  final Color? textColor;
  final Color color;
  final String title;
  final String msg;
  final String cancel;
  final String confirm;
  final bool needConfirm;
  final String? cancelText;
  final String? confirmText;
  final Widget? child;

  Widget _buttons(context) {
    if (needConfirm) {
      return Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 45,
              child: TextButton(
                child: Text(
                  cancelText ?? cancel,
                  style: TextStyle(color: textColor),
                ),
                onPressed: () => Navigator.pop(context, false),
              ),
            ),
          ),
          VerticalDivider(width: 2),
          Expanded(
            child: SizedBox(
              height: 45,
              child: TextButton(
                child: Text(
                  confirmText ?? confirm,
                  style: TextStyle(color: textColor),
                ),
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
                child: Text(
                  'Ok',
                  style: TextStyle(color: textColor),
                ),
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
                    style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                        color: textColor),
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
                    child: Text(
                      msg,
                      style: TextStyle(color: textColor),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Material(
                  color: Colors.transparent,
                  child: child,
                ),
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
