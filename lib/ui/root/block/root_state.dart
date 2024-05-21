import 'package:cards_english/data/models/card_model.dart';
import 'package:equatable/equatable.dart';

class RootState extends Equatable {
  @override
  List<Object?> get props => [double.nan];
}

class DataRootState extends RootState {
  DataRootState({
    required this.isBackFinish,
    required this.isNextFinish,
    required this.list,
    required this.index,
  });

  final List<CardModel> list;
  final int index;
  final bool isBackFinish;
  final bool isNextFinish;

  @override
  List<Object?> get props => [
        double.nan,
        list,
        isBackFinish,
        isNextFinish,
        index,
      ];
}

class LoadingRootState extends RootState {
  @override
  List<Object?> get props => [double.nan];
}

class ErrorRootState extends RootState {
  @override
  List<Object?> get props => [double.nan];
}
