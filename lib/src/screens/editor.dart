import 'package:flutter/material.dart';
import '../widgets/options_card.dart';
import '../blocs/editor_provider.dart';
import '../blocs/editor_bloc.dart';

class Editor extends StatelessWidget{
  final bloc = EditorBloc();

  @override
  Widget build(BuildContext context) {
    

    return EditorProvider(
      child: StreamBuilder(
        stream: bloc.cardList,
        builder: (context, snapshot) => Scaffold(
          appBar: AppBar(
            title: Text('Widgets On Demand'),
          ),
          body: snapshot.hasData ? buildListOfOptionsCards(bloc.cardList.value) : Container(),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () => bloc.addCard(),
          ),
        ),
      ),
    ); 
  }

  Widget buildListOfOptionsCards(List<OptionsCard> cards){
    return Container(
      child: ListView(
        children: <Widget>[
          Column(children: cards)
        ],
      ),
    );
  }
}