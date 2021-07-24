import 'package:document_enhancer_app/utils/constant.dart';
import 'package:document_enhancer_app/utils/imageList.dart';
import 'package:flutter/material.dart';

class FinalScreen extends StatelessWidget {
  const FinalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: MyConstant.darkColor,
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: MyImages.img[MyImages.maxIndex],
        )),
      ),
    );
  }
}
