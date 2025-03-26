/// Color model for database
class ColorModel {
  /// hex string value of color
  final String hexString;

  /// Constructor
  const ColorModel({required this.hexString});

  /// maps color into Map
  Map<String, dynamic> toMap() {
    return {'hexString': hexString};
  }
}
