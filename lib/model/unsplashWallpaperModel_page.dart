class WallpaperModel {
  String small;
  String regular;
  String full;
  WallpaperModel(
      {required this.small, required this.regular, required this.full});
  factory WallpaperModel.fromMap(Map<dynamic, dynamic> parsedJson) {
    return WallpaperModel(
        small: parsedJson['small'],
        regular: parsedJson['regular'],
        full: parsedJson['full']);
  }
}
