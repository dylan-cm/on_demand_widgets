import 'package:rxdart/rxdart.dart';
import '../widgets/options_card.dart';

class EditorBloc {
  List<OptionsCard> _deck = [];

  final _cardListSubject = BehaviorSubject<List<OptionsCard>>(seedValue: []);

  // Getter to sink for list of cards
  Function() get addCard => _addCardToList;

  // Getter to stream for list of cards
  ValueObservable<List<OptionsCard>> get cardList => _cardListSubject.stream;

  //Business Logic on how to add card
  void _addCardToList(){
    _deck.add(OptionsCard(
      delete: deleteCard,
      id: _deck.length,
    ));
    _deck.last.bloc.changeScreenName(_deck.length.toString());
    _cardListSubject.sink.add(_deck);
  }

  void deleteCard(int cardId){
    _deck.removeWhere((item) => item.id == cardId);
    _cardListSubject.sink.add(_deck);
  }

  void dispose(){
    _cardListSubject.close();
  }
}