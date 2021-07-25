import 'package:document_enhancer_app/utils/apiRequest.dart';
import 'package:document_enhancer_app/utils/constant.dart';
import 'package:document_enhancer_app/utils/getImage.dart';
import 'package:document_enhancer_app/utils/imageList.dart';
import 'package:document_enhancer_app/utils/routes.dart';
import 'package:flutter/material.dart';

class EnhanceRequest extends StatefulWidget {
  const EnhanceRequest({Key? key}) : super(key: key);

  @override
  _EnhanceRequestState createState() => _EnhanceRequestState();
}

class _EnhanceRequestState extends State<EnhanceRequest> {
  bool isEnhanced = false;
  bool isLoading = false;
  Image displayImage = Image.file(
    Utils.imageFile,
  );
  Image enhancedImage = Image.file(Utils.imageFile);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              color: MyConstant.darkColor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Spacer(
                      flex: 3,
                    ),
                    Text(
                      "Enhancer",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 31,
                          color: Colors.white),
                    ),
                    Spacer(
                      flex: 2,
                    ),
                    isLoading
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                child: Center(
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: displayImage
                                  // Image.file(
                                  //   Utils.imageFile,
                                  // ),
                                  ),
                            )),
                          ),
                    Spacer(
                      flex: 2,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          PageButton(
                            text: "Enhance",
                            onPressed: () async {
                              setState(() {
                                isLoading = true;
                              });
                              enhancedImage = await ApiRequest()
                                  .sendRequest(Utils.imageFile);
                              //User cant resend the enhanced image
                              setState(() {
                                displayImage = enhancedImage;
                                isLoading = false;
                                isEnhanced = true;
                              });
                            },
                          ),
                          PageButton(
                              text: "Edit",
                              onPressed: () {
                                MyImages.addWidget(enhancedImage);
                                Navigator.pushNamed(
                                    context, MyRoutes.editRoute);
                              }),
                        ]),
                    Spacer(
                      flex: 3,
                    )
                  ],
                ),
              ),
            ),
            isEnhanced
                ? Padding(
                    padding: const EdgeInsets.only(right: 20.0,top: 10),
                    child: Row(children: [
                      Spacer(),
                      InkWell(
                          onTap: () {
                            setState(() {
                              displayImage = Image.file(
                                Utils.imageFile,
                              );
                            });
                          },
                          child: Icon(
                            Icons.undo,
                            color: Colors.white,
                            size: 30,
                          )),
                      SizedBox(width: 10),
                      InkWell(
                          onTap: () {
                            setState(() {
                              displayImage = enhancedImage;
                            });
                          },
                          child:
                              Icon(Icons.redo, color: Colors.white, size: 30))
                    ]),
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}

class PageButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  const PageButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        // margin: EdgeInsets.symmetric(vertical: 10),
        // padding: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7), color: Colors.white),
        height: 50,
        width: 130,
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
          ),
        ),
      ),
    );
  }
}
