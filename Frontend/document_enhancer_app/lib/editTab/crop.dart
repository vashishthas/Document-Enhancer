import 'dart:io';

import 'package:document_enhancer_app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';

class Crop{
  static List<File> imageFiles = [];

  Future<File?> cropPredefinedImage(File imageFile) async {
      var imgFile=await ImageCropper.cropImage(
        sourcePath: imageFile.path,
        aspectRatioPresets: [
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.ratio4x3,
        ],
        androidUiSettings: androidUiSettingsLocked(),
        iosUiSettings: iosUiSettingsLocked(),
      );
      imageFiles.add(imgFile!);
      return imgFile;
  }

  IOSUiSettings iosUiSettingsLocked() => IOSUiSettings(
        aspectRatioLockEnabled: false,
        resetAspectRatioEnabled: false,
      );

  AndroidUiSettings androidUiSettingsLocked() => AndroidUiSettings(
        toolbarTitle: 'Crop Image',
        backgroundColor: MyConstant.darkColor,
        toolbarColor: Colors.grey,
        toolbarWidgetColor: Colors.white,
        initAspectRatio: CropAspectRatioPreset.original,
        lockAspectRatio: false,
      );
}