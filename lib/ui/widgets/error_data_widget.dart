import 'package:flutter/material.dart';

class  ErrorDataWidget extends StatelessWidget {
  const  ErrorDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Error',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w800,
          fontSize: 36,
        ),
      ),
    );
  }
}
