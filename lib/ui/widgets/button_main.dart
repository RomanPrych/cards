import 'package:flutter/material.dart';

class ButtonMain extends StatelessWidget {
  const ButtonMain({
    this.label,
    this.onTap,
    this.isActive,
    super.key,
  });

  final String? label;
  final bool? isActive;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isActiveButton ? onTap : null,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: !isActiveButton
                ? const Color.fromRGBO(42, 98, 254, 1)
                : Colors.transparent,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(15),
          color: isActiveButton
              ? const Color.fromRGBO(42, 98, 254, 1)
              : Colors.black,
        ),
        height: 50,
        alignment: Alignment.center,
        child: Text(
          label ?? 'Empty',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w800,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  bool get isActiveButton => isActive == true;
}
