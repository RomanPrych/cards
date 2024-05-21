import 'package:cards_english/common/extensions/sized_box_extension.dart';
import 'package:cards_english/ui/root/block/root_block.dart';
import 'package:cards_english/ui/root/block/root_state.dart';
import 'package:cards_english/ui/widgets/button_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar(
    this.state, {
    super.key,
  });

  final RootState state;

  @override
  Widget build(BuildContext context) {
    if (state is! DataRootState) {
      return const SizedBox.shrink();
    }
    DataRootState st = state as DataRootState;
    return Row(
      children: [
        20.0.wsb,
        Flexible(
          child: ButtonMain(
            isActive: st.isBackFinish,
            label: 'Back',
            onTap: context.read<RootBlock>().onBackTap,
          ),
        ),
        15.0.wsb,
        Flexible(
          child: ButtonMain(
            isActive: st.isNextFinish,
            label: 'Next',
            onTap: context.read<RootBlock>().onNextTap,
          ),
        ),
        20.0.wsb,
      ],
    );
  }
}
