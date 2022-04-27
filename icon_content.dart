import 'package:flutter/material.dart';

const iconTextStyle = TextStyle(
  fontSize: 18,
  color: Color(0xFF8D8E98),
);

class IconContent extends StatelessWidget {
  IconContent({required this.iconText,required this.icon});
  final String iconText;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(iconText,
          style: iconTextStyle,
        ),
      ],
    );
  }
}

