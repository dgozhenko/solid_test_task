/// Color model for database
class ColorModel {
  final int id;
  final String hexString;

  /// Constructor
  const ColorModel({required this.id, required this.hexString});

  /// maps color into Map
  Map<String, dynamic> toMap() {
    return {'id': id, 'hexString': hexString};
  }
}
