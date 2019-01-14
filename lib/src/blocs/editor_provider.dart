import 'package:flutter/material.dart';
import 'editor_bloc.dart';
export 'editor_bloc.dart';

class EditorProvider extends InheritedWidget{
  final EditorBloc bloc;

  EditorProvider({Key key, Widget child})
    : bloc = EditorBloc(),
      super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static EditorBloc of(BuildContext context){
    return(context.inheritFromWidgetOfExactType(EditorProvider) as EditorProvider).bloc;
  }
}