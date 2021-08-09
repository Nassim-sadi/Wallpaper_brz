import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageView extends StatefulWidget {
  final String imgUrl;
  ImageView({required this.imgUrl});
  @override
  _ImageViewState createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  @override
  void initState() {
    // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20),
      primary: Colors.transparent,
      shadowColor: Colors.transparent,
    );

    return Scaffold(
      body: Hero(
        tag: widget.imgUrl,
        child: Stack(
          clipBehavior: Clip.hardEdge,
          fit: StackFit.expand,
          alignment: Alignment.bottomCenter,
          children: [
            CachedNetworkImage(
              imageUrl: widget.imgUrl,
              placeholder: (context, url) => Center(
                child: SizedBox(
                  width: 40,
                  height: 40,
                  child: new CircularProgressIndicator(),
                ),
              ),
              errorWidget: (context, url, error) => new Icon(Icons.error),
              fit: BoxFit.cover,
              //filterQuality: FilterQuality.high,
              //filterQuality: FilterQuality.high,
            ),
            Positioned(
              //height: ,
              right: 0,
              left: 0,
              bottom: 0,
              child: SizedBox(
                height: 70,
                width: 20,
                child: ClipRRect(
                  clipBehavior: Clip.hardEdge,
                  //borderRadius: BorderRadius.only(b),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: CupertinoButton(
                      child: Text(
                        'Set As Wallpaper',
                        style: TextStyle(
                            fontSize: 18,
                            color: Color(0xeFe3e5e7),
                            shadows: [
                              Shadow(
                                  color: Colors.black26,
                                  offset: Offset(2, 2),
                                  blurRadius: 0),
                            ]),
                      ),
                      onPressed: () {
                        print('Wallpeper set  ;) --------');
                        print(widget.imgUrl);
                      },
                      // style: style,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
