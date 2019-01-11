import 'package:flutter/material.dart';
import '../blocs/options_card_bloc.dart';
import 'dart:async';

//TODO: refactor for legibility

class OptionsCard extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final bloc = OptionsCardBloc();

    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('This is a widget'),
            subtitle: Text('Choose some options'),
          ),

          colorPicker(bloc),

          ButtonTheme.bar(
            child: ButtonBar(
              children: <Widget>[
                FlatButton(
                  onPressed: () => print('Delete'),
                  child: Text('Delete'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget colorPicker(OptionsCardBloc bloc){
    return StreamBuilder(
      stream: bloc.primaryColor,
      // initialData: bloc.primaryColor.value,
      builder: (context, snapshot){
        return DropdownButton<Color>(
          hint: Text(bloc.primaryColorName.value),
          onChanged: (chosenColor) {
            bloc.changeColor(chosenColor);
            print("The selected primary color is ${bloc.primaryColor.value}, "
              "also known as ${bloc.primaryColorName.value}");
          },
          items: <DropdownMenuItem<Color>>[
            DropdownMenuItem(
              child: Text('Blue'),
              value: Colors.blue[500],
            ),
            DropdownMenuItem(
              child: Text('Red'),
              value: Colors.red[500],
            ),
          ],
        );
      },
    );
    
    
  }
}