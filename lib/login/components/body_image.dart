import 'package:flutter/material.dart';

class body_image extends StatelessWidget {
  const body_image({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image(
        width: size.width,
        image: AssetImage("assets/images/logo.png"),
      ),
    );
  }
}
