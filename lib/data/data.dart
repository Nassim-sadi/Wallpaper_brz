import 'package:wallpaper_pexel_api/model/categories_model.dart';

import '../model/categories_model.dart';

String apiKey = '563492ad6f91700001000001b81e5d6f7aa242f6ada45e545b619628';
List<CategoriesModel> getCategories() {
  late List<CategoriesModel> categories = [];
  CategoriesModel categorieModel = new CategoriesModel();

//
  categorieModel.imgUrl =
      'https://images.pexels.com/photos/5587802/pexels-photo-5587802.jpeg?cs=srgb&dl=pexels-daria-sannikova-5587802.jpg&fm=jpg';
  categorieModel.categorieName = 'Nature';
  categories.add(categorieModel);
  categorieModel = new CategoriesModel();
  //
  categorieModel.imgUrl =
      'https://images.pexels.com/photos/7664871/pexels-photo-7664871.jpeg?cs=srgb&dl=pexels-solodsha-7664871.jpg&fm=jpg';
  categorieModel.categorieName = 'Food ';
  categories.add(categorieModel);
  categorieModel = new CategoriesModel();
//
  categorieModel.imgUrl =
      'https://images.pexels.com/photos/577585/pexels-photo-577585.jpeg?cs=srgb&dl=pexels-kevin-ku-577585.jpg&fm=jpg';
  categorieModel.categorieName = 'Coding';
  categories.add(categorieModel);
  categorieModel = new CategoriesModel();
//
  categorieModel.imgUrl =
      'https://images.pexels.com/photos/1626481/pexels-photo-1626481.jpeg?cs=srgb&dl=pexels-stas-knop-1626481.jpg&fm=jpg';
  categorieModel.categorieName = 'Music ';
  categories.add(categorieModel);
  categorieModel = new CategoriesModel();
//
  categorieModel.imgUrl =
      'https://images.pexels.com/photos/6468167/pexels-photo-6468167.jpeg?cs=srgb&dl=pexels-david-selbert-6468167.jpg&fm=jpg';
  categorieModel.categorieName = 'Animals ';
  categories.add(categorieModel);
  categorieModel = new CategoriesModel();
//
  categorieModel.imgUrl =
      'https://images.pexels.com/photos/302769/pexels-photo-302769.jpeg?cs=srgb&dl=pexels-pixabay-302769.jpg&fm=jpg';
  categorieModel.categorieName = 'Buildings';
  categories.add(categorieModel);
  categorieModel = new CategoriesModel();

  return categories;
}
