import 'package:document_enhancer_app/utils/constant.dart';
import 'package:document_enhancer_app/utils/filter_generator.dart';
import 'package:document_enhancer_app/utils/imageList.dart';
import 'package:document_enhancer_app/utils/routes.dart';
import 'package:flutter/material.dart';

class SliderEdit extends StatefulWidget {
  SliderEdit({Key? key}) : super(key: key);
  // double _currentSliderValue=0;

  @override
  _SliderEditState createState() => _SliderEditState();
}

class _SliderEditState extends State<SliderEdit> {
  double _currentSliderValue1 = 0;
  double _currentSliderValue2 = 0;
  double _currentSliderValue3 = 0;
  var colorFiltered;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Adjustments"),
        actions: [
          InkWell(
              onTap: () {
                // MyImages.currentImageIndex += 1;
                // MyImages.maxIndex = MyImages.currentImageIndex;
                // MyImages.img[MyImages.currentImageIndex] = colorFiltered;

                MyImages.addWidget(colorFiltered);
                Navigator.pushNamed(context, MyRoutes.editRoute);
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: Icon(Icons.check),
              ))
        ],
      ),
      body: Container(
        color: MyConstant.darkColor,
        child: Column(
          children: [
            Center(
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: imageFilter(
                      hue: _currentSliderValue1,
                      brightness: _currentSliderValue2,
                      saturation: _currentSliderValue3,
                      child: Container(
                          child: MyImages.img[MyImages.currentImageIndex]
                          // MyImages.img[MyImages.currentImageIndex]
                          // Image.file(Utils.imageFile),
                          ))
                  // ColorFiltered(
                  //     colorFilter: ColorFilter.matrix(
                  //         ColorFilterGenerator.brightnessAdjustMatrix(
                  //             value: _currentSliderValue1)),
                  //     child: Image.file(Utils.imageFile))

                  ),
            ),
            Text(
              "Hue",
              style: TextStyle(color: Colors.white),
            ),
            Slider(
                min: -1,
                max: 1,
                value: _currentSliderValue1,
                onChanged: (newVal) {
                  setState(() {
                    _currentSliderValue1 = newVal;
                  });
                }),
            Text("Brightness", style: TextStyle(color: Colors.white)),
            Slider(
                min: -1,
                max: 1,
                value: _currentSliderValue2,
                onChanged: (newVal) {
                  setState(() {
                    _currentSliderValue2 = newVal;
                  });
                }),
            Text("Saturation", style: TextStyle(color: Colors.white)),
            Slider(
                min: -1,
                max: 1,
                value: _currentSliderValue3,
                onChanged: (newVal) {
                  setState(() {
                    _currentSliderValue3 = newVal;
                  });
                })
          ],
        ),
      ),
    );
  }

  Widget imageFilter({brightness, saturation, hue, child}) {
    colorFiltered = ColorFiltered(
        colorFilter:
            ColorFilter.matrix(ColorFilterGenerator.brightnessAdjustMatrix(
          value: brightness,
        )),
        child: ColorFiltered(
            colorFilter:
                ColorFilter.matrix(ColorFilterGenerator.saturationAdjustMatrix(
              value: saturation,
            )),
            child: ColorFiltered(
              colorFilter:
                  ColorFilter.matrix(ColorFilterGenerator.hueAdjustMatrix(
                value: hue,
              )),
              child: child,
            )));
    return colorFiltered;
  }
}
