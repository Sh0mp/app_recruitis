import 'package:flutter/material.dart';

import 'constants.dart';

class productsWidget extends StatelessWidget {
  const productsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: const [
          CardsCards(
            image: 'assets/images/image_1.jpg',
            title: 'Xxxx',
            text: 'Xxxx',
            price: 200,
          ),
          CardsCards(
            image: 'assets/images/image_1.jpg',
            title: 'Xxxx',
            text: 'Xxxx',
            price: 200,
          ),
          CardsCards(
            image: 'assets/images/image_1.jpg',
            title: 'Xxxx',
            text: 'Xxxx',
            price: 200,
          ),
          CardsCards(
            image: 'assets/images/image_1.jpg',
            title: 'Xxxx',
            text: 'Xxxx',
            price: 200,
          ),
        ],
      ),
    );
  }
}

class CardsCards extends StatelessWidget {
  const CardsCards({
    Key? key,
    required this.image,
    required this.title,
    required this.text,
    required this.price,
  }) : super(key: key);

  final String image, title, text;
  final int price;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(
        left: kDefaultPadding,
        top: kDefaultPadding / 1,
        bottom: kDefaultPadding * 2.5,
      ),
      width: size.width * 0.3,
      child: Column(
        children: [
          Image.asset(image),
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(kDefaultPadding / 2),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 10),
                      blurRadius: 50,
                      color: kPrimaryColor.withOpacity(0.2),
                    )
                  ]),
              child: Row(children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "$title\n",
                        style: Theme.of(context).textTheme.button,
                      ),
                      TextSpan(
                        text: "$text",
                        style: TextStyle(
                          color: kPrimaryColor.withOpacity(0.5),
                        ),
                      )
                    ],
                  ),
                ),
                const Spacer(),
                Text("Xxx"),
              ]),
            ),
          )
        ],
      ),
    );
  }
}
