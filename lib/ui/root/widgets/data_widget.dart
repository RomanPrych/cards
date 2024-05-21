import 'package:cards_english/ui/root/block/root_state.dart';
import 'package:cards_english/ui/root/widgets/card_widget.dart';
import 'package:cards_english/ui/widgets/error_data_widget.dart';
import 'package:flutter/material.dart';

class DataWidget extends StatelessWidget {
  const DataWidget(
    this.state, {
    super.key,
  });

  final DataRootState state;

  @override
  Widget build(BuildContext context) {
    if (state.list.isEmpty) {
      return const ErrorDataWidget();
    }
    return AnimatedSwitcher(
      transitionBuilder: (_, __) => ScaleTransition(scale: __, child: _),
      duration: const Duration(milliseconds: 1000),
      child: state.list
          .map((e) => CardWidget(
                e,
                key: ValueKey<int>(state.index),
              ))
          .toList()[state.index],
    );
  }
}
