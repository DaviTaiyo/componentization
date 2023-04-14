import 'package:flutter/material.dart';

Future<String?> showDialogInput({
  required BuildContext context,
  required String title,
  required String body,
}) async {
  return showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return _CustomAlert(
          title: title,
          msg: body,
        );
      });
}

class _CustomAlert extends StatelessWidget {
  _CustomAlert({
    required this.title,
    required this.msg,
  });

  final String title;
  final String msg;
  TextEditingController _input = TextEditingController();

  Widget _buttons(context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 45,
                child: TextButton(
                  child: Text("Cancelar"),
                  onPressed: () {
                    _input.clear();
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
            VerticalDivider(width: 2),
            Expanded(
              child: SizedBox(
                height: 45,
                child: TextButton(
                  child: Text('Ok'),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ),
          ],
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
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(msg),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _input,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Digite aqui'),
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
