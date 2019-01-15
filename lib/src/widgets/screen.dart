import 'package:flutter/material.dart';
import '../blocs/options_card_provider.dart';

class Screen extends StatelessWidget{
  @override
    Widget build(BuildContext context) {
      final bloc = OptionsCardProvider.of(context);

      return StreamBuilder(
        stream: bloc.screenName,
        initialData: 'Loading',
        builder: (BuildContext context, AsyncSnapshot<String> snapshot){
          return Scaffold(
            appBar: AppBar(
              title: Text(snapshot.data),
            ),
          );
        },
      );
    }
}