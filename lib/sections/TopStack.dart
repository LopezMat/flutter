import 'package:flutter/material.dart';
import 'package:good_meal/widgets/ContainerButton.dart';
import 'package:good_meal/widgets/ContainerTextImage.dart';

class TopStack extends StatelessWidget {
  const TopStack({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ContainerTextImage(),
        ContainerButton()
      ],
    );
  }
}
