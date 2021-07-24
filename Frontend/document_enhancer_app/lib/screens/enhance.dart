import 'package:document_enhancer_app/utils/constant.dart';
import 'package:document_enhancer_app/utils/getImage.dart';
import 'package:document_enhancer_app/utils/routes.dart';
import 'package:flutter/material.dart';

class EnhanceRequest extends StatelessWidget {
  const EnhanceRequest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      child: Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.file(
                        Utils.imageFile,
                      ),
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
                        onPressed: () {},
                      ),
                      PageButton(
                          text: "Edit",
                          onPressed: () {
                            Navigator.pushNamed(context, MyRoutes.editRoute);
                          }),
                    ]),
                Spacer(
                  flex: 3,
                )
              ],
            ),
          ),
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
