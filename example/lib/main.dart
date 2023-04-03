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
  String _platformVersion = 'Unknown';
  int? textureID;

  @override
  void initState() {
    super.initState();
    ExternalTexture.registerTexture().then((id) {
      setState(() {
        textureID = id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(children: [
            textureID == null
                ? const SizedBox()
                : Expanded(child: Texture(textureId: textureID!)),
            Text('Running on: $_platformVersion\n')
          ]),
        ),
      ),
    );
  }
}
