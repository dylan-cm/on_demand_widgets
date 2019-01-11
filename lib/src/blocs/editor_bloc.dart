import 'package:rxdart/rxdart.dart';
import '../widgets/options_card.dart';

class EditorBloc {
  final _cardListSubject = BehaviorSubject<List<OptionsCard>>(seedValue: [new OptionsCard()]);

  // Getter to sink for list of cards
  Function(OptionsCard) get addCard => addCardToList;

  // Getter to stream for list of cards
  ValueObservable<List<OptionsCard>> get cardList => _cardListSubject.stream;

  //Business Logic on how to add card
  void addCardToList(OptionsCard card){
    List<OptionsCard> list = cardList.value;
    list.add(card);
    _cardListSubject.sink.add(list);
  }

  void dispose(){
    _cardListSubject.close();
  }
}