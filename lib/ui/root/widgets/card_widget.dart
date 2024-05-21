import 'package:cards_english/common/extensions/sized_box_extension.dart';
import 'package:cards_english/data/models/card_model.dart';
import 'package:cards_english/ui/widgets/error_photo_widget.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  const CardWidget(this.model, {super.key});

  final CardModel? model;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        padding: const EdgeInsets.all(50),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromRGBO(24, 24, 25, 1)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isPhoto)
              Image.memory(
                model!.image!,
                errorBuilder: (context, _, __) => const ErrorPhotoWidget(),
              ),
            if (!isPhoto) const ErrorPhotoWidget(),
            30.0.hsb,
            Text(
              model?.cardWord ?? 'Empty',
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 36),
            ),
            20.0.hsb,
            Text(
              model?.cardTranslation ?? 'Empty',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 36,
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool get isPhoto =>
      model != null && model!.image != null && model!.image!.isNotEmpty;
}
