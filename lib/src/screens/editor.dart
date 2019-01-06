import 'package:flutter/material.dart';
import '../widgets/options_card.dart';

class Editor extends StatefulWidget {
  @override
    State<StatefulWidget> createState() => _EditorState();
}

class _EditorState extends State<Editor>{
  List<OptionsCard> toExport = [];

  @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Widgets On Demand'),
        ),
        body: Text('Hello World!'),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: _addWidget,
        ),
      );
    }

    void _addWidget(){
      toExport.add(OptionsCard());
    }
}