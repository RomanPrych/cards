import 'package:cards_english/data/models/card_model.dart';

abstract interface class GetCardsDataRepo {
  Future <List<CardModel?>> getData();
}