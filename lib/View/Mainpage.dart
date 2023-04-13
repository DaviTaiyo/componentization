import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smokerstabacaria/Widgets/Alertbox_Widget.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController dialogResponse = TextEditingController();
    String Error = 'ERROR NAME';

    return Scaffold(
      appBar: AppBar(
        title: Text('Smokers Tabacaria'),
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          Text('Nome'),
          Center(
            child: TextButton(
                child: Text('Show Dialog ERROR'),
                onPressed: () {
                  showCustomDialog(
                    context: context,
                    cancel: 'Cancel',
                    confirm: 'confirm',
                    title: 'Error',
                    body: '${Error}',
                    needConfirm: false,
                  );
                }),
          ),
          SizedBox(height: 20),
          Center(
            child: TextButton(
                child: Text('Show Dialog Confirm'),
                onPressed: () {
                  showCustomDialog(
                    context: context,
                    cancel: 'Cancelar',
                    confirm: 'Confirmar',
                    title: 'are you sure ?',
                    body: 'are you sure you want to confirm?',
                    needConfirm: true,
                  );
                }),
          ),
          SizedBox(height: 10),
          Center(
            child: TextButton(
                child: Text('Teste aleatorio'),
                onPressed: () {
                  showCustomDialog(
                    context: context,
                    cancel: 'erro aleatorio',
                    confirm: 'confirmar aleatorio',
                    title: 'titulo aleatorio',
                    body: 'body aleatorio',
                    needConfirm: true,
                  );
                }),
          ),
          SizedBox(height: 10),
          Center(
            child: TextButton(
              child: Text('dialog'),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => CustomAlertDialogWithInput(
                    title: 'what description do you want?',
                    hintText: 'description',
                    cancelText: 'Cancel',
                    confirmText: 'Confirm',
                    textEditingController: dialogResponse,
                  ),
                ).then((value) {
                  if (value != null && value.isNotEmpty) {}
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
