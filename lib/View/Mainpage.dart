import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smokerstabacaria/Widgets/AlertInputBox_Widget.dart';
import 'package:smokerstabacaria/Widgets/Alertbox_Widget.dart';
import 'package:smokerstabacaria/Widgets/button_widget.dart';

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
                    color: Colors.black,
                    context: context,
                    cancel: 'Cancel',
                    confirm: 'confirm',
                    title: 'Error',
                    body: '${Error}',
                    needConfirm: false,
                  );
                }),
          ),
          SizedBox(height: 10),
          Center(
            child: TextButton(
                child: Text('Show Dialog Confirm'),
                onPressed: () {
                  showCustomDialog(
                    color: Colors.black,
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
                    color: Colors.black,
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
                showDialogInput(
                  context: context,
                  title: 'Teste',
                  body: 'motivo',
                  cancel: 'cancel',
                  confirm: 'confirm',
                  color: Colors.black,
                );
              },
            ),
          ),
          ButtonWidget(
            color: Color.fromARGB(255, 64, 255, 0),
            text: 'teste',
            onPressed: () {
              print('funcionou');
            },
          )
        ],
      ),
    );
  }
}
