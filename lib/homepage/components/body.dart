import 'package:app_recruitis/homepage/components/productsWidget.dart';
import "package:flutter/material.dart";
import 'HeaderWidget.dart';
import 'Title_with_moreBtn.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
          HeaderWidget(size: size),
          TitleWithMoreBtn(
            title: "Doporučené",
            press: () {},
          ),
          productsWidget(),
        ],
      ),
    );
  }
}
