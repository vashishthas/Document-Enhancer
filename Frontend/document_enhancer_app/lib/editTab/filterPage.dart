import 'package:document_enhancer_app/utils/constant.dart';
import 'package:document_enhancer_app/utils/filters.dart';
import 'package:document_enhancer_app/utils/imageList.dart';
import 'package:document_enhancer_app/utils/routes.dart';
import 'package:flutter/material.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({Key? key}) : super(key: key);

  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  final GlobalKey _globalKey = GlobalKey();
  var filtered;
  @override
  Widget build(BuildContext context) {
    List<ColorFilter> filters = [
      // MyFilters.noFilter,
      MyFilters.greyscale,
      MyFilters.sepia
    ];
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(Icons.check),
              onPressed: () {
                MyImages.addWidget(filtered);
                // ToImage.convertWidgetToImage(_globalKey.currentContext!);
                // MyImages.currentImageIndex += 1;
                // MyImages.maxIndex = MyImages.currentImageIndex;
                // MyImages.img[MyImages.currentImageIndex] = filtered;
                // MyImages.img.add(filtered);
                Navigator.pushNamed(context, MyRoutes.editRoute);
              })
        ],
      ),
      body: RepaintBoundary(
        key: _globalKey,
        child: Container(
            color: MyConstant.darkColor,
            child: PageView.builder(
                itemCount: filters.length,
                itemBuilder: (context, index) {
                  filtered = ColorFiltered(
                      colorFilter: filters[index],
                      child: MyImages.img[MyImages.maxIndex]);
                  return filtered;
                })
            // ClipRRect(child: Image.file(Utils.imageFile)),
            ),
      ),
    );
  }
}
