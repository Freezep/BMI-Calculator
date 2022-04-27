import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  RoundButton({required this.icon, required this.onClick});

  final IconData icon;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF202644),
      onPressed: onClick,
      elevation: 0.0,
      child: Icon(icon),
    );
  }
}
