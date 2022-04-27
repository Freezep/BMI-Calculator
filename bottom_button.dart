import 'package:flutter/material.dart';
import 'package:bmi_calculator/screens/InputPage.dart';


class BottomButton extends StatelessWidget {
  BottomButton({required this.title,required this.onPress});

  final String title;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(
            color: bottomContainerColor,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10))
        ),
        margin: EdgeInsets.only(top: 10),
        height: bottomContainerHeight,
        width: double.infinity,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.w400
            ),
          ),
        ),
      ),
    );
  }
}