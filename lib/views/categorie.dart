import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaper_pexel_api/data/data.dart';
import 'package:wallpaper_pexel_api/model/wallpaper_model.dart';
import 'package:wallpaper_pexel_api/widgets/widget.dart';

class Categorie extends StatefulWidget {
  // const Categorie({Key? key}) : super(key: key);
  final String categorieName;
  Categorie({required this.categorieName});
  @override
  _CategorieState createState() => _CategorieState();
}

class _CategorieState extends State<Categorie> {
  List<WallpaperModel> wallpapers = [];
  getCategorieWallpapers(String query) async {
    var response = await http.get(
        Uri.parse('https://api.pexels.com/v1/search?query=$query?per_page=30'),
        headers: {"Authorization": apiKey});

    //print(response.body.toString());
    Map<String, dynamic> jsonData = jsonDecode(response.body);
    jsonData['photos'].forEach((element) {
      //print(Element);

      WallpaperModel wallpaperModel = WallpaperModel.fromJson(element);

      // wallpapers.add(wallpaperModel);
      //wallpaperModel = WallpaperModel.fromMap(element);
      wallpapers.add(wallpaperModel);
    });
    setState(() {});
  }

  @override
  void initState() {
    getCategorieWallpapers(widget.categorieName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: brandName(),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(bottom: 10),
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Color(0xfff5f8fd),
                  borderRadius: BorderRadius.circular(30),
                ),
                margin: EdgeInsets.symmetric(horizontal: 24),
                padding: EdgeInsets.symmetric(horizontal: 15),
              ),
              SizedBox(
                height: 16,
              ),
              // Container(
              //   height: 70,
              //   child: ListView.builder(
              //     shrinkWrap: true,
              //     scrollDirection: Axis.horizontal,
              //     itemCount: categories.length,
              //     itemBuilder: (context, index) {
              //       return CategoriesTile(
              //         title: categories[index].categorieName,
              //         imgUrl: categories[index].imgUrl,
              //       );
              //     },
              //   ),
              //),
              wallpapersList(wallpapers: wallpapers, context: context),
              //  CategoriesTile(),
            ],
          ),
        ),
      ),
    );
  }
}
