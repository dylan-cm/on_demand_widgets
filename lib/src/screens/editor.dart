import 'package:flutter/material.dart';

class Editor extends StatefulWidget {
  @override
    State<StatefulWidget> createState() => _EditorState();
}

class _EditorState extends State<Editor>{
  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return Scaffold(
          appBar: AppBar(
            title: Text('Widgets On Demand'),
          ),
          body: Text('Hello World!'),
        );
    }
}