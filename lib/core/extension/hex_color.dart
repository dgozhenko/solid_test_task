import 'dart:ui';

/// Extension on Color to convert Color to hex string
/// and hex string to Color
extension HexColor on Color {
  /// method to convert hex string into color
  /// can accept hex string with # and without
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    const hexStringWithoutHexLength = 6;
    const hexStringWithHexLength = 6;
    const radix = 16;

    if (hexString.length == hexStringWithoutHexLength ||
        hexString.length == hexStringWithHexLength) {
      buffer.write('ff');
    }
    buffer.write(hexString.replaceFirst('#', ''));

    return Color(int.parse(buffer.toString(), radix: radix));
  }

  /// method to convert color into hex string
  /// can generate string with leading hex or without it
  String toHex({bool leadingHashSign = true}) {
    const rgbInt = 255;
    const radix = 16;
    const padAmount = 2;

    return '${leadingHashSign ? '#' : ''}'
        '${(rgbInt * a).toInt().toRadixString(radix).padLeft(padAmount, '0')}'
        '${(rgbInt * r).toInt().toRadixString(radix).padLeft(padAmount, '0')}'
        '${(rgbInt * g).toInt().toRadixString(radix).padLeft(padAmount, '0')}'
        '${(rgbInt * b).toInt().toRadixString(radix).padLeft(padAmount, '0')}';
  }
}
