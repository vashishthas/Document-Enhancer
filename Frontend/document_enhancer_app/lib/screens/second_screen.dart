import 'package:document_enhancer_app/utils/constant.dart';
import 'package:document_enhancer_app/utils/getImage.dart';
import 'package:document_enhancer_app/utils/routes.dart';
import 'package:flutter/material.dart';

class DialogScreen extends StatelessWidget {
  const DialogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: MyConstant.darkColor,
          child: Column(
            children: [
              Spacer(
                flex: 4,
              ),
              Center(
                child: Text(
                  "Choose Image From",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Spacer(
                flex: 2,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                      onTap: () async {
                        bool flag = await Utils.fromCamera();
                        if (flag) {
                          Navigator.pushNamed(context, MyRoutes.imageRoute);
                        }
                      },
                      child: CardItem(
                        text: "Camera",
                      )),
                  InkWell(
                      onTap: () async {
                        bool flag = await Utils.fromGallery();
                        if (flag) {
                          Navigator.pushNamed(context, MyRoutes.imageRoute);
                        }
                      },
                      child: CardItem(text: "Gallery")),
                  InkWell(
                      onTap: () async {
                        bool flag = await Utils.fromEdgeCamera();
                        if (flag) {
                          Navigator.pushNamed(context, MyRoutes.imageRoute);
                        }
                      },
                      child: CardItem(text: "Camera with Edge Detection"))
                ],
              ),
              Spacer(
                flex: 4,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  final String text;
  const CardItem({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Card(
        color: Colors.pink,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Container(
              width: double.infinity,
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              )),
        ),
      ),
    );
  }
}
