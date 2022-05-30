import 'package:flutter/material.dart';
import 'package:personal_expenses/add_transaction.dart';
import 'package:flutter/cupertino.dart';

import './add_transaction.dart';

void main() {
  runApp(MyApp());
  //IM HACKING YOU //AHHHHHHHHH
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      drawerScrimColor: Color.fromARGB(255, 113, 8, 92),
      body: Container(
        // scrollbarOrientation: ScrollbarOrientation.right,
        // thickness: 4,
        // radius: Radius.circular(10),
        // thicknessWhileDragging: 8,
        // isAlwaysShown: true,
        child: Column(
          children: <Widget>[
            Container(
              //elevation: 5,
              child: Container(
                padding: EdgeInsets.all(10),
                child: AddTransaction(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
