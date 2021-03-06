import 'dart:io';
import 'dart:typed_data';

import 'package:document_enhancer_app/utils/constant.dart';
import 'package:document_enhancer_app/utils/imageList.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
// import 'package:gallery_saver/gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;

import 'package:flutter/services.dart';
import 'dart:ui' as ui;

class FinalScreen extends StatefulWidget {
  const FinalScreen({Key? key}) : super(key: key);

  @override
  _FinalScreenState createState() => _FinalScreenState();
}

class _FinalScreenState extends State<FinalScreen> {
  GlobalKey globalKey = GlobalKey();
  final pdf = pw.Document();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: MyConstant.darkColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Spacer(
                flex: 2,
              ),
              Text(
                "Final Image",
                style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Spacer(flex: 3),
              Center(
                  child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: RepaintBoundary(
                    key: globalKey, child: MyImages.img[MyImages.maxIndex]),
              )),
              Spacer(flex: 3),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () async {
                        // createPdf();
                        // convertWidgetToImage();
                        bool flag = await savePdf();
                        if (flag) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Pdf saved successfully'),
                            ),
                          );
                        }
                      },
                      child: Text("Save Image")),
                  ElevatedButton(
                      onPressed: () async {
                        // createPdf();
                        // convertWidgetToImage();
                        convertWidgetToImage(false);
                        // if (flag) {
                        //   ScaffoldMessenger.of(context).showSnackBar(
                        //     const SnackBar(
                        //       content: Text('Pdf saved successfully'),
                        //     ),
                        //   );
                        // }
                      },
                      child: Text("Create Pdf")),
                ],
              ),
              Spacer(
                flex: 2,
              )
            ],
          ),
        ),
      ),
    );
  }

  void convertWidgetToImage(bool toPdf) async {
    RenderRepaintBoundary? repaintBoundary =
        globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary?;
    ui.Image boxImage = await repaintBoundary!.toImage(pixelRatio: 1);
    ByteData? byteData =
        await boxImage.toByteData(format: ui.ImageByteFormat.png);
    Uint8List uint8list = byteData!.buffer.asUint8List();
    Image.memory(uint8list);
    if (toPdf) {
      createPdf(uint8list);
    } else {
      // saveImageToGallery(uint8list);
    }
    // createPdf(Image.memory(uint8list));

    // return uint8list;
  }

  void createPdf(Uint8List uint8list) {
    final image = pw.MemoryImage(uint8list);
    //     // pw.MemoryImage(uint8list);
    //       pw.MemoryImage(
    //     img.readAsBytesSync(),
    // );
    pdf.addPage(pw.Page(build: (pw.Context context) {
      return pw.Center(
        child: pw.Image(image),
      ); // Center
    }));
  }

  Future<bool> savePdf() async {
    convertWidgetToImage(true);
    try {
      final dir = await getExternalStorageDirectory();
      final file = File("${dir!.path}/finalDoc.pdf");
      await file.writeAsBytes(await pdf.save());
      print("@@createdd!!");
      print(dir.path);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  // void saveImageToGallery(Uint8List uint8list) {
  //   String store = 'flutterEnhanced.jpg';
  //   File(store).writeAsBytes(uint8list);
  //   GallerySaver.saveImage(store);
  // }
}
