import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smokerstabacaria/Widgets/AlertConfirm_Widget.dart';
import 'package:smokerstabacaria/Widgets/AlertError_Widget.dart';
import 'package:smokerstabacaria/Widgets/AlertInputBox_Widget.dart';
import 'package:smokerstabacaria/Widgets/AlertCustom_Widget.dart';

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
          )
        ],
      ),
    );
  }
}
