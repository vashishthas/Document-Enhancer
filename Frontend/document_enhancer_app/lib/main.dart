import 'package:document_enhancer_app/utils/constant.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Document Enhancer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Container(
        color: MyConstant.darkColor,
        child: Center(
          child: Text("Document Enhancer"),
        ),
      ),
    );
  }
}
