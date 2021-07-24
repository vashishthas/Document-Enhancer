import 'package:document_enhancer_app/utils/constant.dart';
import 'package:document_enhancer_app/utils/getImage.dart';
import 'package:flutter/material.dart';

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
            Visibility(
              // visible: MyImages.currentImageIndex == 0 ? false : true,
              child: InkWell(
                  onTap: () {
                    setState(() {
                      // MyImages.currentImageIndex -= 1;
                    });
                  },
                  child: Icon(
                    Icons.undo_sharp,
                    // color: Colors.white,
                  )),
            ),
            SizedBox(width: 10),
            Visibility(
              // visible: MyImages.currentImageIndex == MyImages.maxIndex
              //     ? false
              //     : true,
              child: InkWell(
                  onTap: () {
                    setState(() {
                      // MyImages.currentImageIndex += 1;
                    });
                  },
                  child: Icon(
                    Icons.redo_sharp,
                    // color: Colors.white
                  )),
            ),
            SizedBox(width: 10),
            Padding(
              padding: const EdgeInsets.only(right: 18.0),
              child: Icon(Icons.check),
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
            setState(() {
              tabIndex = index;
              Navigator.pushNamed(context, tabs[tabIndex]);
            });
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
        // Container(
        //     child: Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        // Text("Rotate"),
        // Text("Crop"),
        // Text("Filter"),
        // Text("Adjust")
        //     ],
        //   ),
        // )),
        body: Container(
            color: MyConstant.darkColor,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.file(
                      Utils.imageFile,
                    ),
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
