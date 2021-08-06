import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wallpaper_pexel_api/data/data.dart';
import 'package:wallpaper_pexel_api/model/wallpaper_model.dart';
import 'package:wallpaper_pexel_api/widgets/widget.dart';
import 'package:http/http.dart' as http;

class Search extends StatefulWidget {
  //const Search({ Key? key }) : super(key: key);
  final String searchQuery;
  Search({required this.searchQuery});
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<WallpaperModel> wallpapers = [];

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    getSearchWallpapers(widget.searchQuery);

    // TODO: implement initState
    super.initState();
    searchController.text = widget.searchQuery;
  }

  getSearchWallpapers(String query) async {
    var response = await http.get(
        Uri.parse('https://api.pexels.com/v1/search?query=$query?per_page=20'),
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: brandName(),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color(0xfff5f8fd),
                  borderRadius: BorderRadius.circular(30),
                ),
                margin: EdgeInsets.symmetric(horizontal: 24),
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                          hintText: 'search for a Wallpaper',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        getSearchWallpapers(searchController.text);
                      },
                      child: Container(
                        child: Icon(Icons.search),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    //  CategoriesTile(),
                  ],
                ),
              ),
              wallpapersList(wallpapers: wallpapers, context: context),
            ],
          ),
        ),
      ),
    );
  }
}
