import 'package:flutter/material.dart';

class ColorPickerWidget extends StatelessWidget {
  final Color selectedColor;
  final ValueChanged<Color> onColorSelected;

  ColorPickerWidget({required this.selectedColor, required this.onColorSelected});

  final List<Color> colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.purple,
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      children: colors.map((color) {
        return GestureDetector(
          onTap: () => onColorSelected(color),
          child: CircleAvatar(
            backgroundColor: color,
            child: selectedColor == color ? Icon(Icons.check, color: Colors.white) : null,
          ),
        );
      }).toList(),
    );
  }
}
