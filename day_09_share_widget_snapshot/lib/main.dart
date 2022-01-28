import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:screenshot/screenshot.dart';
import 'package:flutter/rendering.dart';
import 'package:share/share.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _screenshotController = ScreenshotController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Screenshot(
                controller: _screenshotController,
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Image.asset('images/codepassionately.png'),
                        Text('Code Passionately',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold
                        ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              TextButton(
                  onPressed: _takeScreenshot ,
                  child: Text(("Take ScreenShot and Share"))
              )
            ],
          ),
        ),
      ),
    );
  }

  Future _takeScreenshot() async{
    Uint8List _imageFile;
    _screenshotController.capture().then((Uint8List image) async{
      setState(() {
        _imageFile = image;
      });
      final result = await ImageGallerySaver.saveImage(_imageFile);
      String path = result["filePath"];
      print(path.substring(8));
      if(result.isNotEmpty){
        List<String> ImagePath = [];
        ImagePath.add(path.substring(8));
        await Share.shareFiles(ImagePath, text: "Hello Check out this awesome screenshot");
      }
    }).catchError((onError){
      print(onError);
    });


  }

}
