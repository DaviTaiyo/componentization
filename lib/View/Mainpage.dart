import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smokerstabacaria/Widgets/AlertConfirm_Widget.dart';
import 'package:smokerstabacaria/Widgets/AlertError_Widget.dart';
import 'package:smokerstabacaria/Widgets/AlertInputBox_Widget.dart';
import 'package:smokerstabacaria/Widgets/AlertCustom_Widget.dart';
import 'package:smokerstabacaria/Widgets/button_widget.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController dialogResponse = TextEditingController();
    String Error = 'ERROR NAME';

    return Scaffold(
      appBar: AppBar(
        title: Text('Componentization'),
      ),
      body: Column(
        children: [
          Center(
            child: TextButton(
              child: Text('Confirm Alert'),
              onPressed: () {
                showConfirmDialog(context: context, title: 'Are you sure?');
              },
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: TextButton(
              child: Text('Alert Error'),
              onPressed: () {
                showErrorDialog(
                    context: context,
                    title: 'Error!!',
                    msg: 'Error in this Alert');
              },
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: TextButton(
              child: Text('Input Alert'),
              onPressed: () {
                showDialogInput(
                  context: context,
                  title: 'Teste',
                  body: 'motivo',
                );
              },
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: TextButton(
              child: Text('Custom Alert'),
              onPressed: () {
                showCustomDialog(
                  context: context,
                  title: 'Custom Alert',
                  body: 'This is a Custom Alert',
                  color: Colors.white,
                  textColor: Colors.black,
                  cancel: 'cancel',
                  confirm: 'confirm',
                  child: Image(image: AssetImage('images/Alert.png')),
                );
              },
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: ButtonWidget(
              color: Colors.green,
              text: 'Button',
              onPressed: () {
                print('Funcionou');
              },
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: ButtonWidget(
              color: Colors.blue,
              text: 'Button Out',
              width: 150,
              isOutline: true,
              onPressed: () {
                print('também Funcionou');
              },
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: ButtonWidget(
              color: Colors.green,
              text: 'Button disabled',
              isDisabled: true,
              width: 200,
              onPressed: () {},
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: ButtonWidget(
              color: Colors.green,
              text: 'Button',
              isLoading: true,
              isOutline: true,
              onPressed: () {
                print('Funcionou');
              },
            ),
          )
        ],
      ),
    );
  }
}
