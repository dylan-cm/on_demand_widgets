import 'package:flutter/material.dart';
import 'options_card_bloc.dart';
export 'options_card_bloc.dart';

class OptionsCardProvider extends InheritedWidget{
  final OptionsCardBloc bloc;

  OptionsCardProvider({Key key, Widget child})
    : bloc = OptionsCardBloc(),
      super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static OptionsCardBloc of(BuildContext context){
    return(context.inheritFromWidgetOfExactType(OptionsCardProvider) as OptionsCardProvider).bloc;
  }
}