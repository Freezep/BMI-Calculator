import 'package:flutter/material.dart';


class MyCard extends StatelessWidget {
  MyCard({required this.cardColor,required this.cardChild});

  final Color cardColor;
  final Widget cardChild;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
