import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smokerstabacaria/Core/Enums/Button_size.dart';
import 'package:smokerstabacaria/Widgets/AlertConfirm_Widget.dart';
import 'package:smokerstabacaria/Widgets/AlertError_Widget.dart';
import 'package:smokerstabacaria/Widgets/AlertInputBox_Widget.dart';
import 'package:smokerstabacaria/Widgets/AlertCustom_Widget.dart';
import 'package:smokerstabacaria/Widgets/button_widget.dart';
import 'package:smokerstabacaria/mock/mock.dart';

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
              iconL: Icons.play_arrow,
              text: ' PLAY',
              onPressed: () {
                print('Funcionou');
              },
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: ButtonWidget(
              text: 'Verificação ',
              iconR: Icons.check,
              isOutline: true,
              onPressed: () {
                print('também Funcionou');
              },
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: ButtonWidget(
              isDisabled: true,
              iconR: Icons.check,
              width: ButtonSize.small,
              onPressed: () {},
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: ButtonWidget(
              text: 'Button',
              isLoading: true,
              isOutline: true,
              width: ButtonSize.medium,
              onPressed: () {
                print('Funcionou');
              },
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: ButtonWidget(
              text: 'Notifications ',
              badget: true,
              badgetData: valueNotice.value,
              isOutline: true,
              width: ButtonSize.large,
              onPressed: () {
                print('teste size');
              },
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: ButtonWidget(
              text: 'Mensagens ',
              badget: true,
              isOutline: true,
              width: ButtonSize.medium,
              onPressed: () {
                print('teste size');
              },
            ),
          ),
        ],
      ),
    );
  }
}
