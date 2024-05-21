import 'package:cards_english/data/models/card_model.dart';
import 'package:cards_english/data/repo/get_cards_data/get_cards_data_repo.dart';
import 'package:gsheets/gsheets.dart';

class GetCardsDataRepoImpl implements GetCardsDataRepo {
  @override
  Future<List<CardModel?>> getData() async {
    try {
      final gSheets = GSheets(_credentials);
      Spreadsheet ss = await gSheets.spreadsheet(_spreadsheetId);
      var sheet = ss.worksheetByTitle('Sheet1');
      List<List<String>>? response = await sheet?.values.allRows(fromRow: 2);

      return response?.map((e) => CardModel.fromSheet(e)).toList() ?? [];
    } catch (e) {
      print('ERROR GetCardsDataRepoImpl = $e');
      return [];
    }
  }

  final _spreadsheetId = '1KPn09WhqrxL0VHWthhsAq4ImxoyuEYQbPawbW39TNEE';

  final _credentials = r'''
{
 
}
''';
}
