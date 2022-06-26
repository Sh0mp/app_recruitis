import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';
import '../homepage/components/body.dart';
import '../homepage/components/bottom_widget.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: buildAppBar(),
      body: const Body(),
      bottomNavigationBar: BottomWidget(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Color.fromRGBO(0, 181, 202, 1),
      elevation: 0,
      leading: Builder(
        builder: (context) => IconButton(
          icon: SvgPicture.asset("assets/icons/menu.svg"),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
      ),
    );
  }
}
