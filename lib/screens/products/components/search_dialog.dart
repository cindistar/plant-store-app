import 'package:flutter/material.dart';

class SearchDialog extends StatelessWidget {
  final String initialText;

  const SearchDialog(this.initialText);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 6,
          left: 24,
          right: 24,
          child: Card(
            child: TextFormField(
              initialValue: initialText,
              textInputAction: TextInputAction.search,
              autofocus: true,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(vertical: 15),
                prefixIcon: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Color(0xFF827D7D),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              onFieldSubmitted: (text) {
                Navigator.of(context).pop(text);
              },
            ),
          ),
        ),
      ],
    );
  }
}
