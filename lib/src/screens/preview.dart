import 'package:flutter/material.dart';
import '../widgets/screen.dart';
import '../blocs/options_card_provider.dart';
import '../blocs/editor_provider.dart';

class Preview extends StatelessWidget{
  @override
    Widget build(BuildContext context) {
      final editBloc = EditorProvider.of(context);
      // final optionsBloc = OptionsCardProvider.of(context);

      return StreamBuilder(
        stream: editBloc.cardList,
        initialData: [],
        builder: (context, snapshot) {
          print(snapshot.data);
          return Scaffold(
          body: Screen(),
          );
        },
      );
    }
}