import 'package:cards_english/common/di/di.dart';
import 'package:cards_english/common/extensions/string_extention.dart';
import 'package:cards_english/data/models/card_model.dart';
import 'package:cards_english/data/repo/config/remote_config.dart';
import 'package:cards_english/data/repo/get_cards_data/get_cards_data_repo.dart';
import 'package:cards_english/data/repo/get_photo_by_name/get_photo_by_name_repo.dart';
import 'package:cards_english/ui/root/block/root_state.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RootBlock extends Cubit<RootState> {
  RootBlock() : super(LoadingRootState()) {
    init();
    _config.remoteConfig.onConfigUpdated.listen((event) {
      init();
    });
  }

  final Config _config = locator.get<Config>();
  final GetCardsDataRepo _getCardsDataRepo = locator.get<GetCardsDataRepo>();
  final GetPhotoByNameRepo _getPhotoByNameRepo =
      locator.get<GetPhotoByNameRepo>();
  List<CardModel?> _listCardModels = [];
  int _index = 0;

  int get getIndex =>
      _index > 0 && _index < getListCardModels.length ? _index : 0;

  bool get isBackFinish => getIndex != 0;

  bool get isNextFinish => getIndex != getListCardModels.length - 1;

  List<CardModel> get getListCardModels => List<CardModel>.from(
        _listCardModels.where(
          (element) => element != null,
        ),
      );

  Future<void> init() async {
    try {
      emit(LoadingRootState());
      _listCardModels = await _getCardsDataRepo.getData();
      if (_listCardModels.isEmpty) {
        emit(ErrorRootState());
        return;
      }
      await _getPhotos();
      await _sort();
      emit(DataRootState(
        list: getListCardModels,
        index: getIndex,
        isBackFinish: isBackFinish,
        isNextFinish: isNextFinish,
      ));
    } catch (e) {
      print('ERROR init method = $e');
      emit(ErrorRootState());
    }
  }

  Future<void> _sort() async {
    await _config.remoteConfig.fetchAndActivate();
    Map<String, RemoteConfigValue> data = _config.remoteConfig.getAll();
    RemoteConfigValue? value = data['cards_config'];
    List<CardModel?> temp = [];
    value?.asString().toSort().forEach((key, value) {
      CardModel? model;
      _listCardModels.forEach((element) {
        if (element?.cardId?.trim() == key.trim()) {
          model = element;
        }
      });
      temp.insert(value, model);
    });
    _listCardModels = temp;
  }

  Future<void> _getPhotos() async {
    for (var e in getListCardModels) {
      var image = await _getPhotoByNameRepo.getPhoto(e.imageId);
      e.image = image;
    }
  }

  void onNextTap() {
    if (_index != getListCardModels.length - 1) {
      _index++;
      emit(DataRootState(
        list: getListCardModels,
        index: getIndex,
        isBackFinish: isBackFinish,
        isNextFinish: isNextFinish,
      ));
    }
  }

  void onBackTap() {
    if (_index != 0) {
      _index--;

      emit(DataRootState(
        list: getListCardModels,
        index: getIndex,
        isBackFinish: isBackFinish,
        isNextFinish: isNextFinish,
      ));
    }
  }
}
