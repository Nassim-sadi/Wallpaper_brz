import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_pexel_api/model/wallpaper_model.dart';
import 'package:wallpaper_pexel_api/views/image_view.dart';

Widget brandName() {
  return Center(
    child: RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: TextStyle(
          fontSize: 20,
        ),
        children: const <TextSpan>[
          TextSpan(
              text: 'Wallpaper',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
          TextSpan(
              text: 'BRZ',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),
        ],
      ),
    ),
  );
}

Widget wallpapersList({required List<WallpaperModel> wallpapers, context}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: GridView.count(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 0.6,
      mainAxisSpacing: 5,
      crossAxisSpacing: 5,
      children: wallpapers.map((wallpaper) {
        return GridTile(
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ImageView(imgUrl: wallpaper.src.portrait)));
            },
            child: Hero(
              tag: wallpaper.src.portrait,
              child: Container(
               
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: CachedNetworkImage(
                    imageUrl: wallpaper.src.portrait,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    ),
  );
}
