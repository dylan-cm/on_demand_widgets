import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';

//Eventually each complex enough component will have its own bloc
//  and the OptionsCardBloc will simply assign inputs and outputs.
//  For PoC this is okay because there is only one component.
class OptionsCardBloc {
  //Users Color Choice
  final _primaryColorSubject = BehaviorSubject<Color>(seedValue: Colors.blue[500]);
  final _primaryColorName = BehaviorSubject<String>(seedValue: "Blue");

  //Getter to sink of Color Stream
  Function(Color) get changeColor => handleColorChange;

  //Getter to stream of Color objects
  ValueObservable<Color> get primaryColor => _primaryColorSubject.stream;

  //Getter to stream of Strings of names of Colors
  ValueObservable<String> get primaryColorName => _primaryColorName.stream;

  void dispose(){
    _primaryColorSubject.close();
    _primaryColorName.close();
  }

  void handleColorChange(Color color){
    _primaryColorSubject.sink.add(color);
    if(color == Colors.blue[500]){
      _primaryColorName.sink.add("Blue");
    } else {
      _primaryColorName.sink.add("Red");
    }
    // print(name);
  }
}