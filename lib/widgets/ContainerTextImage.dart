import 'package:flutter/material.dart';
import 'package:intro_flutter/models/Constantes.dart';

class ContainerTextImage extends StatelessWidget {
  const ContainerTextImage({super.key});

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height / 2,
      width: size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: Image.asset(p12).image,
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
        )
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(left: 50, right: 50),
          child: Text(
              "Des gâteaux pour les codeurs gourmets",
            style: TextStyle(
              color: Colors.blue,
              fontSize: 30,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
