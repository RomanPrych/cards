import 'package:flutter/services.dart';

class CardModel {
  CardModel({
    this.cardId,
    this.cardWord,
    this.cardTranslation,
    this.imageId,
    this.image,
  });

  String? cardId;
  String? cardWord;
  String? cardTranslation;
  String? imageId;
  Uint8List? image;

  static CardModel? fromSheet(List<String>? sheet) {
    if (sheet == null || sheet.isEmpty) {
      return null;
    }
    final [
      String cardId,
      String cardWord,
      String cardTranslation,
      String imageId,
    ] = sheet;
    return CardModel(
      cardId: cardId,
      cardWord: cardWord,
      cardTranslation: cardTranslation,
      imageId: imageId,
    );
  }

  @override
  String toString() =>
      'CardModel {cardId: $cardId, cardWord: $cardWord, cardTranslation: $cardTranslation, imageId: $imageId, image:${image?.isNotEmpty}}';
}
