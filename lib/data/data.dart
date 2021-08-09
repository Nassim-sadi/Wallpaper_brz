import 'package:wallpaper_pexel_api/model/categories_model.dart';

import '../model/categories_model.dart';

String apiKey = '563492ad6f91700001000001b81e5d6f7aa242f6ada45e545b619628';
List<CategoriesModel> getCategories() {
  late List<CategoriesModel> categories = [];
  CategoriesModel categorieModel = new CategoriesModel();

//
  categorieModel.imgUrl =
      'https://images.pexels.com/photos/3225517/pexels-photo-3225517.jpeg?crop=entropy&cs=srgb&dl=pexels-michael-block-3225517.jpg&fit=crop&fm=jpg&h=800&w=640';
  categorieModel.categorieName = 'Nature';
  categories.add(categorieModel);
  categorieModel = new CategoriesModel();
  //
  categorieModel.imgUrl =
      'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?crop=entropy&cs=srgb&dl=pexels-ella-olsson-1640777.jpg&fit=crop&fm=jpg&h=426&w=640';
  categorieModel.categorieName = 'Food ';
  categories.add(categorieModel);
  categorieModel = new CategoriesModel();
//
  categorieModel.imgUrl =
      'https://images.pexels.com/photos/577585/pexels-photo-577585.jpeg?crop=entropy&cs=srgb&dl=pexels-kevin-ku-577585.jpg&fit=crop&fm=jpg&h=479&w=640';
      
  categorieModel.categorieName = 'Coding';
  categories.add(categorieModel);
  categorieModel = new CategoriesModel();
//
  categorieModel.imgUrl =
      'https://images.pexels.com/photos/1407322/pexels-photo-1407322.jpeg?crop=entropy&cs=srgb&dl=pexels-north-1407322.jpg&fit=crop&fm=jpg&h=426&w=640';
  categorieModel.categorieName = 'Music ';
  categories.add(categorieModel);
  categorieModel = new CategoriesModel();
//
  categorieModel.imgUrl =
      'https://images.pexels.com/photos/146083/pexels-photo-146083.jpeg?crop=entropy&cs=srgb&dl=pexels-flickr-146083.jpg&fit=crop&fm=jpg&h=966&w=640';
  categorieModel.categorieName = 'Animals ';
  categories.add(categorieModel);
  categorieModel = new CategoriesModel();
//
  categorieModel.imgUrl =
      'https://images.pexels.com/photos/275033/pexels-photo-275033.jpeg?crop=entropy&cs=srgb&dl=pexels-pixabay-275033.jpg&fit=crop&fm=jpg&h=389&w=640';
  categorieModel.categorieName = 'Games';
  categories.add(categorieModel);
  categorieModel = new CategoriesModel();

  return categories;
}
