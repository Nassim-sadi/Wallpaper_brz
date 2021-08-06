class WallpaperModel {
  //String photographer;
  //String photographerUrl;
  //int photographerId;
  late SrcModel src;

  WallpaperModel(
      //this.photographer, this.photographerId, this.photographerUrl,
      this.src);

  //factory WallpaperModel.fromMap(Map<String, dynamic> parsedJson) {
  //return
  WallpaperModel.fromJson(Map<String, dynamic> parsedJson) {
    src = SrcModel.fromMap(parsedJson["src"]);
  }

  // photographer=parsedJson["photographer"],
  // photographerId= parsedJson["photographer_id"],
  // photographerUrl= parsedJson["photographer_url"],

}

class SrcModel {
  String portrait;
  String original;
  String medium;

  SrcModel(
      {required this.portrait, required this.original, required this.medium});

  factory SrcModel.fromMap(Map<String, dynamic> srcJson) {
    return SrcModel(
        portrait: srcJson["portrait"],
        original: srcJson["original"],
        medium: srcJson["medium"]);
  }
}
