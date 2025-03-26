import 'dart:math';

import 'package:flutter/material.dart';

/// Color Randomizer Page that generate new color
/// on screen tap, with ability to save color into local database
class ColorRandomizerPage extends StatefulWidget {
  /// Constructor
  const ColorRandomizerPage({super.key});

  @override
  State<ColorRandomizerPage> createState() => _ColorRandomizerPageState();
}

class _ColorRandomizerPageState extends State<ColorRandomizerPage> {
  Color backgroundColor = const Color(0xffffffff);
  Color fontColor = const Color(0xff000000);
  final luminanceThreshold = 0.16;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          backgroundColor = Color(Random().nextInt(0xffffffff));
          fontColor =
              backgroundColor.computeLuminance() > luminanceThreshold
                  ? Colors.black
                  : Colors.white;
        });
      },
      onLongPress: () {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Color Saved To Gallery')));
      },
      child: AnimatedContainer(
        decoration: BoxDecoration(color: backgroundColor),
        duration: const Duration(milliseconds: 300),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              child: Center(
                child: Column(
                  children: [
                    Text(
                      'Hey there',
                      style: TextStyle(
                        color: fontColor,
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    AnimatedOpacity(
                      opacity:
                          backgroundColor != const Color(0xffffffff)
                              ? 1.0
                              : 0.0,
                      duration: const Duration(milliseconds: 300),
                      child: Text(
                        '(Try long tap color if you like it)',
                        style: TextStyle(color: fontColor, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
