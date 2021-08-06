import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
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
    var deviceHeigh = MediaQuery.of(context).size.height;
    var deviceWidth = MediaQuery.of(context).size.width;
    final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20),
      primary: Colors.transparent,
      shadowColor: Colors.transparent,
    );

    return Scaffold(
      body: Hero(
        tag: widget.imgUrl,
        child: Stack(
          children: [
            CachedNetworkImage(
              imageUrl: widget.imgUrl,
              height: deviceHeigh,
              width: deviceWidth,
              fit: BoxFit.cover,
              //filterQuality: FilterQuality.high,
            ),
            Positioned(
              right: 0,
              left: 0,
              bottom: 0,
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Container(
                    //color: Colors.black.withOpacity(0),
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: ElevatedButton.icon(
                        icon: Icon(
                          Icons.paid_rounded,
                          color: Colors.grey,
                          size: 45,
                        ),
                        label: Text(
                          'Set As Wallpaper',
                          style: TextStyle(color: Color(0xFFF3F5F7), shadows: [
                            Shadow(
                                color: Colors.black26,
                                offset: Offset(1, 1),
                                blurRadius: 0),
                          ]),
                        ),
                        onPressed: () {
                          print('Wallpeper set  ;) --------');
                          print(widget.imgUrl);
                        },
                        style: style,
                      ),
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
