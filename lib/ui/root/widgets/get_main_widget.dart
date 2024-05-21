import 'package:cards_english/ui/root/block/root_state.dart';
import 'package:cards_english/ui/root/widgets/data_widget.dart';
import 'package:cards_english/ui/widgets/error_data_widget.dart';
import 'package:cards_english/ui/widgets/loading_widget.dart';
import 'package:flutter/material.dart';

class GetMainWidget extends StatelessWidget {
  const GetMainWidget(
    this.state, {
    super.key,
  });

  final RootState state;

  @override
  Widget build(BuildContext context) {
    return switch (state) {
      LoadingRootState() => const LoadingWidget(),
      DataRootState() => DataWidget((state as DataRootState)),
      ErrorRootState() => const ErrorDataWidget(),
      _ => const ErrorDataWidget(),
    };
  }
}
