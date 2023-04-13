import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Smokers Tabacaria'),
      ),
      body: Column(
        children: [
          Center(
            child: TextButton(
              child: Text('Show Dialog'),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
