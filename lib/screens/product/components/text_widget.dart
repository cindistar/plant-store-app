import 'package:flutter/material.dart';
import '../../../models/details.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({this.details});

  final Details details;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Height',
          style: TextStyle(
            fontSize: 18,
            color: Color(0xFF909090),
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          details.height,
          style: const TextStyle(
            fontSize: 18,
            color: Color(0xFF2F9F76),
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        const Text(
          'Humidity',
          style: TextStyle(
            fontSize: 18,
            color: Color(0xFF909090),
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          details.humidity,
          style: const TextStyle(
            fontSize: 18,
            color: Color(0xFF2F9F76),
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        const Text(
          'Weight',
          style: TextStyle(
            fontSize: 18,
            color: Color(0xFF909090),
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          details.weight,
          style: const TextStyle(
            fontSize: 18,
            color: Color(0xFF2F9F76),
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        const Text(
          'Temperature',
          style: TextStyle(
            fontSize: 18,
            color: Color(0xFF909090),
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          details.temperature,
          style: const TextStyle(
            fontSize: 18,
            color: Color(0xFF2F9F76),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

}
