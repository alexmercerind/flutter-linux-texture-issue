import 'package:flutter/material.dart';
import 'package:external_texture/external_texture.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int? textureId;

  @override
  void initState() {
    super.initState();
    ExternalTexture.registerTexture().then((id) {
      setState(() {
        textureId = id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('flutter-linux-texture-issue'),
        ),
        body: textureId == null
            ? const SizedBox()
            : Texture(textureId: textureId!),
      ),
    );
  }
}
