import 'package:cards_english/ui/root/block/root_block.dart';
import 'package:cards_english/ui/root/root_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardsMain extends StatelessWidget {
  const CardsMain({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (BuildContext context) => RootBlock(),
        child: const RootPage(),
      ),
    );
  }
}
