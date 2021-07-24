import 'package:document_enhancer_app/screens/edit_screen.dart';
import 'package:document_enhancer_app/screens/enhance.dart';
import 'package:document_enhancer_app/screens/first_screen.dart';
import 'package:document_enhancer_app/screens/second_screen.dart';
import 'package:document_enhancer_app/utils/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {
          MyRoutes.imageRoute: (context) => EnhanceRequest(),
          MyRoutes.chooseRoute: (context) => DialogScreen(),
          MyRoutes.editRoute: (context) => Edit(),
        },
        debugShowCheckedModeBanner: false,
        title: 'Document Enhancer',
        theme: ThemeData(
          primarySwatch: Colors.grey,
          // textTheme: TextTheme(headline1: TextStyle(color: Colors.white))
        ),
        home: FirstScreen());
  }
}
