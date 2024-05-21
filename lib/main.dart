import 'package:cards_english/cards_main.dart';
import 'package:cards_english/common/di/di.dart';
import 'package:cards_english/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await setupLocator();

  runApp(const CardsMain());
}
