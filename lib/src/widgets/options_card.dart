import 'package:flutter/material.dart';

//TODO: refactor for legibility

class OptionsCard extends StatelessWidget{
  @override
    Widget build(BuildContext context) {
      return Card(
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text('This is a widget'),
              subtitle: Text('Choose some options'),
            ),

            DropdownButton<MaterialColor>(
              hint: Text('Choose Color'),
              onChanged: (value)=> print(value),
              items: <DropdownMenuItem<MaterialColor>>[
                DropdownMenuItem(
                  child: Text('Blue'),
                  value: Colors.blue,
                ),
                DropdownMenuItem(
                  child: Text('Red'),
                  value: Colors.red,
                ),
              ],
            ),

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
}