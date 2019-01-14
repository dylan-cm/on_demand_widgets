import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

//Eventually each complex enough component will have its own bloc
//  and the OptionsCardBloc will simply assign inputs and outputs.
//  For PoC this is okay because there is only one component.
class OptionsCardBloc {
  //Users Color Choice
  final _primaryColor = BehaviorSubject<Color>(seedValue: Colors.blue[500]);
  final _primaryColorName = BehaviorSubject<String>(seedValue: "Blue");
  //Users name choice
  final _screenName = BehaviorSubject<String>(seedValue: "This is a new screen");

  //Getter to sink of Color Stream
  Function(Color) get changeColor => _handleColorChange;

  //Getter to stream of Color objects
  ValueObservable<Color> get primaryColor => _primaryColor.stream;

  //Getter to stream of Strings of names of Colors
  ValueObservable<String> get primaryColorName => _primaryColorName.stream;

  //Getter to sink of name stream
  Function(String) get changeScreenName => _screenName.sink.add;

  //Getter to stream of names
  ValueObservable<String> get screenName => _screenName.stream;

  void dispose(){
    print(_primaryColorName.value + _screenName.value);
    _primaryColor.close();
    _primaryColorName.close();
    _screenName.close();
  }

  void _handleColorChange(Color color){
    _primaryColor.sink.add(color);
    if(color == Colors.blue[500]){
      _primaryColorName.sink.add("Blue");
      print('blue');
    } else {
      _primaryColorName.sink.add("Red");
      print('red');
    }
    // print(name);
  }
}