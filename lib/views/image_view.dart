import 'dart:io' show Platform;
import 'dart:typed_data';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';

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
                      onPressed: _save,
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

  _save() async {
    await _askPermission();
    var response = await Dio()
        .get(widget.imgUrl, options: Options(responseType: ResponseType.bytes));
    // ignore: non_constant_identifier_names
    final result =
        await ImageGallerySaver.saveImage(Uint8List.fromList(response.data));
    print(result);
    Navigator.pop(context);
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text('$result')));
  }

  _askPermission() async {
    var status = await Permission.storage.status;
    if (Platform.isIOS) {
    } else {
      if (status.isPermanentlyDenied) {
        openAppSettings();
      } else if (status.isDenied) {
        // ignore: unused_local_variable
        Map<Permission, PermissionStatus> statuses = await [
          Permission.storage,
        ].request();
      } else {
        // ignore: unused_local_variable
        Map<Permission, PermissionStatus> statuses = await [
          Permission.storage,
        ].request();
      }
    }
  }
}
