import 'package:flutter/material.dart';

Future<String?> showInputDialog(
    {required BuildContext context,
    required Color color,
    required String title,
    required String hintText}) async {
  return showDialog<String?>(
    context: context,
    barrierDismissible: false,
    builder: (_) {
      return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: StatefulBuilder(builder: (context, setState) {
          TextEditingController controller = TextEditingController();
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
                              fontSize: 19, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: IntrinsicHeight(
                        child: Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 45,
                            child: TextButton(
                              child: Text('Fechar'),
                              onPressed: () => Navigator.pop(context, ""),
                            ),
                          ),
                        ),
                        VerticalDivider(),
                        Expanded(
                          child: SizedBox(
                            height: 45,
                            child: TextButton(
                              child: Text('Ok'),
                              onPressed: () {
                                if (controller.text == "") {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          backgroundColor: Colors.blue,
                                          content: Text("Preencha a $hintText",
                                              style: TextStyle(
                                                  fontWeight:
                                                      FontWeight.bold))));
                                  return;
                                }

                                Navigator.pop(context, controller.text);
                              },
                            ),
                          ),
                        ),
                      ],
                    )),
                  ),
                ],
              ),
            ),
          );
        }),
      );
    },
  );
}

//custom Dialog
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
      this.cancelText,
      this.confirmText});

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
          color: Colors.black,
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


class CustomAlertDialogWithInput extends StatelessWidget {
  final String title;
  final String hintText;
  final String cancelText;
  final String confirmText;
  final TextEditingController textEditingController;

  const CustomAlertDialogWithInput({
    Key? key,
    required this.title,
    required this.hintText,
    required this.cancelText,
    required this.confirmText,
    required this.textEditingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: TextFormField(
        controller: textEditingController,
        decoration: InputDecoration(hintText: hintText),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(cancelText),
        ),
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(textEditingController.text),
          child: Text(confirmText),
        ),
      ],
    );
  }
}