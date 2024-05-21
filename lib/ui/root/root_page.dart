import 'package:cards_english/ui/root/block/root_block.dart';
import 'package:cards_english/ui/root/block/root_state.dart';
import 'package:cards_english/ui/root/widgets/bottom_nav_bar.dart';
import 'package:cards_english/ui/root/widgets/get_main_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RootBlock, RootState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
            automaticallyImplyLeading: false,
          ),
          body: SafeArea(
            child: GetMainWidget(state),
          ),
          bottomNavigationBar: BottomNavBar(state),
        );
      },
    );
  }
}
