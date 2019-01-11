import 'package:flutter/material.dart';
import '../widgets/options_card.dart';
import '../blocs/editor_bloc.dart';

class Editor extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final bloc = EditorBloc();

    return StreamBuilder(
      stream: bloc.cardList,
      builder: (context, snapshot) => Scaffold(
        appBar: AppBar(
          title: Text('Widgets On Demand'),
        ),
        body: buildListOfOptionsCards(bloc.cardList.value),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => bloc.addCard(new OptionsCard()),
        ),
      ),
    ); 
  }

  Widget buildListOfOptionsCards(List<OptionsCard> cards){
    return Container(
      child: ListView(
        children: <Widget>[
          Column(
            children: cards,
          )
        ],
      ),
    );
  }
}