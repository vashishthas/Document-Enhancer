import 'package:document_enhancer_app/utils/constant.dart';
import 'package:document_enhancer_app/utils/routes.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyConstant.darkColor,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            "Document Enhancer",
            style: TextStyle(color: Colors.white),
          )),
      body: Center(
        child: InkWell(
          splashColor: Colors.transparent,
          onTap: () {
            Navigator.pushNamed(context, MyRoutes.chooseRoute);
          },
          child: ClipOval(
            child: Container(
              color: Colors.white12,
              child: Icon(
                Icons.add,
                size: 120,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
