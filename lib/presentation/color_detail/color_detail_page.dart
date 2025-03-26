import 'package:flutter/material.dart';
import 'package:solid_test_task/core/extension/hex_color.dart';
import 'package:solid_test_task/domain/model/color_model.dart';

/// color detail page, displays color details
/// and allows regeneration and deletion
class ColorDetailPage extends StatelessWidget {
  /// constructor
  const ColorDetailPage({super.key});

  /// route name for simple navigation
  static const routeName = '/color-detail';

  @override
  Widget build(BuildContext context) {
    final color = ModalRoute.of(context)?.settings.arguments as ColorModel?;

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        decoration: BoxDecoration(color: HexColor.fromHex(color!.hexString)),
      ),
    );
  }
}
