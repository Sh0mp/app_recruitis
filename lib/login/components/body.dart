import 'package:app_recruitis/login/components/body_form.dart';
import 'package:app_recruitis/login/components/body_image.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);
  static const IconData qr_code_scanner_rounded = IconData(0xf00cc, fontFamily: 'MaterialIcons');

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final view = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Column(
          children: [
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Image(
                      height: view > 380 ? size.width * 1.1 : size.width * 1.03,
                      width: size.width,
                      image: AssetImage(
                        "assets/images/logo.png",
                      ),
                    ),
                  ),
                  Container(
                    child: body_form(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
