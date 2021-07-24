import 'dart:io';

import 'package:edge_detection/edge_detection.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class Utils{

  static File imageFile=File('abc');
  
  static Future<bool> fromGallery() async{
    final source=ImageSource.gallery;
    final pickedFile= await ImagePicker().pickImage(source: source);

    if(pickedFile==null)
    return false;
    
    imageFile=File(pickedFile.path);
    return true;
  }

  static Future<bool> fromCamera() async{
    final source=ImageSource.camera;
    final pickedFile= await ImagePicker().pickImage(source: source);

    if(pickedFile==null)
    return false;
    
    imageFile=File(pickedFile.path);
    return true;
  }


  static Future<bool> fromEdgeCamera() async{
    String? imagePath;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      imagePath = (await EdgeDetection.detectEdge);
      print("$imagePath");
    } on PlatformException {
      imagePath = 'Failed to get cropped image path.';
      return false;
    }
    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    
    // if (!mounted) 
    //   return false;
    imageFile=File(imagePath!);
    return true;
  }
}