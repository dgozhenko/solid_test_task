import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:solid_test_task/core/extension/hex_color.dart';

/// hex color row with text and copy icon button, on click it copies hex value
class HexColorRow extends StatelessWidget {
  /// Color from which hex will be extracted
  final Color color;

  /// Foreground color of text and icon
  final Color? foregroundColor;

  /// constructor
  const HexColorRow({
    required this.color,
    this.foregroundColor = Colors.black,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final hexColor = color.toHex();

    return Row(
      spacing: 4,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          hexColor,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: foregroundColor,
          ),
        ),
        IconButton(
          onPressed: () async {
            await Clipboard.setData(ClipboardData(text: hexColor));
          },
          icon: Icon(Icons.copy, color: foregroundColor,),
        ),
      ],
    );
  }
}
