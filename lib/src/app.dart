import 'package:flutter/material.dart';
import 'screens/editor.dart';
import 'screens/preview.dart';
import 'blocs/options_card_provider.dart';
import 'blocs/editor_provider.dart';

class App extends StatefulWidget {
 App({Key key}) : super(key: key);
 
 @override
 _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int _selectedIndex = 0;
  final _widgetOptions = [
    Editor(),
    Preview(),
  ];

  Widget build (BuildContext context){
    return EditorProvider(
      child: OptionsCardProvider(
        child: MaterialApp(
          title: 'On Demand Widgets - Proof of Concept',
          home: Scaffold(
            body: Center(
              child: _widgetOptions.elementAt(_selectedIndex),
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(icon: Icon(Icons.font_download), title: Text('Editor')),
                BottomNavigationBarItem(icon: Icon(Icons.star), title: Text('Preview')),
              ],
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
            ),
          ),
        ),
      ),
    );
  }

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
}