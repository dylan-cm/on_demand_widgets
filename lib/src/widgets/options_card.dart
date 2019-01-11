import 'package:flutter/material.dart';
import '../blocs/options_card_bloc.dart';

class OptionsCard extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final bloc = OptionsCardBloc();

    return Card(
      child: Column(
        children: <Widget>[
          titleBuilder(bloc),
          screenNameBuilder(bloc),
          colorPickerBuilder(bloc),
          deleteButton(),
        ],
      ),
    );
  }

  Widget deleteButton(){
    return ButtonTheme.bar(
      child: ButtonBar(
        children: <Widget>[
          FlatButton(
            onPressed: () => print('Delete'),
            child: Text('Delete'),
          ),
        ],
      ),
    );
  }

  Widget titleBuilder(OptionsCardBloc bloc){
    return StreamBuilder(
      stream: bloc.screenName,
      builder: (context, snapshot) => ListTile(
        title: Text(bloc.screenName.value),
        subtitle: Text('Choose some options to customize'),
      ),
    );
  }

  Widget colorPickerBuilder(OptionsCardBloc bloc){
    return Container(padding: EdgeInsets.all(16.0), child: Row(
      children: <Widget>[
        Text("Primary color:    ", style: TextStyle(fontSize: 16.0)),
        StreamBuilder(
          stream: bloc.primaryColor,
          initialData: bloc.primaryColor.value,
          builder: (context, snapshot){
            return DropdownButton<Color>(
              hint: Text(bloc.primaryColorName.value),
              onChanged: (chosenColor) => bloc.changeColor(chosenColor),
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
        ),
      ],
    ));
  }

  Widget screenNameBuilder(OptionsCardBloc bloc){
    return StreamBuilder(
      stream: bloc.screenName,
      initialData: bloc.screenName.value,
      builder: (context, snapshot){
        return Container(
          padding: EdgeInsets.only(left: 16.0, right: 200.0),
          child: TextField(
            autofocus: false,
            decoration: InputDecoration(
              labelText: "Name the section",
              hintText: "Screen 1",
            ),
            onChanged: (name) => bloc.changeScreenName(name),
          ),
        );
      }
    );
  }
}