import 'package:flutter/material.dart';

Future<bool?> showConfirmDialog({
  required BuildContext context,
  required String title,
}) async {
  return showDialog<bool>(
    context: context,
    barrierDismissible: false,
    builder: (_) {
      return _CustomAlert(
        title: title,
      );
    },
  );
}

class _CustomAlert extends StatelessWidget {
  _CustomAlert({
    required this.title,
  });

  final String title;

  Widget _buttons(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: SizedBox(
            height: 45,
            child: TextButton(
              child: Text('Não'),
              onPressed: () => Navigator.pop(context, false),
            ),
          ),
        ),
        VerticalDivider(width: 2),
        Expanded(
          child: SizedBox(
            height: 45,
            child: TextButton(
              child: Text('Sim'),
              onPressed: () => Navigator.pop(context, true),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Theme.of(context).primaryColor,
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
              padding: const EdgeInsets.only(top: 10),
              child: IntrinsicHeight(child: _buttons(context)),
            ),
          ],
        ),
      ),
    );
  }
}
