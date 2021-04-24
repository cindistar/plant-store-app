import 'package:flutter/material.dart';

class CustomLeafCircle extends StatelessWidget {
  const CustomLeafCircle({this.iconData, this.color});
  final IconData iconData;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: const BoxDecoration(
        color: Color(0xFFF5F5F5),
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0xFFDAD4D4),
            offset: Offset(5, 5),
            blurRadius: 5,
          ),
          BoxShadow(
            color: Color(0xFFFFFFFF),
            offset: Offset(-5, -5),
            blurRadius: 10,
          ),
        ],
      ),
      child: Icon(
        iconData,
        color: color,
        size: 35,
      ),
    );
  }
}
