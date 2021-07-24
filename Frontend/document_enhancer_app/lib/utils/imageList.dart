import 'package:flutter/material.dart';

class MyImages{
  static int maxIndex=-1;
  static int currentImageIndex=-1;
  static List<Widget> img=[];

  static addWidget(Widget widget){
    currentImageIndex+=1;
    // img.add(widget);
    img.insert(currentImageIndex, widget);
    // img[currentImageIndex]=widget;
    maxIndex=currentImageIndex;
  }
}