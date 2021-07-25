import 'dart:io';

import 'package:document_enhancer_app/utils/constant.dart';
import 'package:document_enhancer_app/utils/imageList.dart';
import 'package:document_enhancer_app/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';

class Edit extends StatefulWidget {
  Edit({Key? key}) : super(key: key);

  @override
  _EditState createState() => _EditState();
}

class _EditState extends State<Edit> {
  int tabIndex = 2;
  List<String> tabs = [
    // MyRoutes.filterRoute,
    // MyRoutes.filterRoute,
    // MyRoutes.filterRoute,
    // MyRoutes.sliderRoute,
    // MyRoutes.filterRoute
    // SliderEdit()
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          // backgroundColor: Colors.transparent,
          title: Text("Edit"),
          actions: [
            InkWell(
                onTap: () {
                  setState(() {
                    if (MyImages.currentImageIndex > 0) {
                      MyImages.currentImageIndex -= 1;
                    }
                  });
                },
                child: Icon(
                  Icons.undo_sharp,
                  color: MyImages.currentImageIndex == 0
                      ? Colors.white.withAlpha(100)
                      : Colors.black,
                )),
            SizedBox(width: 10),
            InkWell(
                onTap: () {
                  setState(() {
                    if (MyImages.currentImageIndex < MyImages.maxIndex) {
                      MyImages.currentImageIndex += 1;
                    }
                  });
                },
                child: Icon(
                  Icons.redo_sharp,
                  color: MyImages.currentImageIndex == MyImages.maxIndex
                      ? Colors.white.withAlpha(100)
                      : Colors.black,
                )),
            SizedBox(width: 10),
            Padding(
              padding: const EdgeInsets.only(right: 18.0),
              child: InkWell(
                  onTap: () {
                    MyImages.maxIndex = MyImages.currentImageIndex;
                    Navigator.pushNamed(context, MyRoutes.finalRoute);
                  },
                  child: Icon(Icons.check)),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          // backgroundColor: Colors.black,
          elevation: 0,
          iconSize: 36,
          backgroundColor: Colors.black.withOpacity(0.5),
          currentIndex: tabIndex,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedLabelStyle: TextStyle(color: Colors.red),
          selectedFontSize: 0,
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.red,
          onTap: (index) {
            tabIndex = index;
            MyImages.maxIndex = MyImages.currentImageIndex;
            if (tabIndex == 3) {
              Navigator.pushNamed(context, MyRoutes.sliderRoute);
            } else if (tabIndex == 4) {
              Navigator.pushNamed(context, MyRoutes.filterRoute);
            }
            // Utils.imageFile != await cropPredefinedImage(Utils.imageFile);
            // setState(() {
            //   // tabIndex = index;
            //   cropPredefinedImage(Utils.imageFile);
            //   // Navigator.pushNamed(context, tabs[tabIndex]);
            // });
          },
          items: [
            BottomNavigationBarItem(
                label: "Crop",
                icon: Icon(Icons.crop),
                activeIcon: Icon(
                  Icons.crop,
                  color: Colors.red,
                )),
            BottomNavigationBarItem(
                label: "Rotate",
                icon: Icon(Icons.rotate_left),
                activeIcon: Icon(
                  Icons.rotate_left,
                  color: Colors.red,
                )),
            BottomNavigationBarItem(
                label: "Home",
                icon: Icon(Icons.home),
                activeIcon: Icon(
                  Icons.home,
                  color: MyConstant.darkColor,
                )),
            BottomNavigationBarItem(
                label: "Filter",
                icon: Icon(Icons.filter),
                activeIcon: Icon(
                  Icons.filter,
                  color: Colors.red,
                )),
            BottomNavigationBarItem(
                label: "Adjust",
                icon: Icon(Icons.adjust),
                activeIcon: Icon(
                  Icons.adjust_rounded,
                  color: Colors.red,
                ))
          ],
        ),
        body: Container(
            color: MyConstant.darkColor,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: MyImages.img[MyImages.currentImageIndex]),
                ),
              ),
            )),
      ),
    );
  }

  static List<File> imageFiles = [];

  Future<File?> cropPredefinedImage(File imageFile) async {
    var imgFile = await ImageCropper.cropImage(
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
