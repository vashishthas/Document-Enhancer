import 'package:document_enhancer_app/utils/constant.dart';
import 'package:flutter/material.dart';

class First extends StatelessWidget {
  const First({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyConstant.darkColor,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            "Enhancer",
            style: TextStyle(color: Colors.white, fontSize: 25),
          )),
      body: Center(
        child: ClipOval(
          // clipBehavior: Clip.antiAlias,
          child: Container(
            color: Colors.white12,
            child: Icon(
              Icons.add,
              size: 120,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
