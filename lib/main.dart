import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wallpaper_pexel_api/views/home.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    
      statusBarColor: Colors.transparent,
      //color set to transperent or set your own color
      statusBarIconBrightness: Brightness.light,
      //set brightness for icons, like dark background light icons
    ));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wallpaper Brz',
      theme: ThemeData(
        
        //accentColor: Colors.white,
      
        primaryColor: Color(0xff3ebace),
        accentColor: Color(0xFFD8ecf1),
        scaffoldBackgroundColor: Color(0xFFf3f5f7),
      ),
      home: Home(),
    );
  }
}
