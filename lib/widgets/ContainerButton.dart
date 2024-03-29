import 'package:flutter/material.dart';
import 'package:intro_flutter/models/Constantes.dart';
import 'package:intro_flutter/models/MakeItResponsive.dart';

class ContainerButton extends StatelessWidget {
  const ContainerButton({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ScreenSize screenSize = MakeItResponsive().getScreenSize(context);

    return Center(
      child: Padding(
        padding: EdgeInsets.only(
          top: (size.height / 2) - ((screenSize == ScreenSize.small) ? 30 : 20),
          left: size.width / 5,
          right: size.width / 5
        ) ,
        child: (screenSize == ScreenSize.small) ? small(context) : big(),
      ),
    );
  }

  //widget interne a notre container button
  //widget pour le tel
  Widget small(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: getFloating(context)
    );
  }

  //widget pour le web
  Widget big() {
     return Container(
       height: 40,
       child: Card(
         elevation: 8,
         color: Colors.blueAccent,
         child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: getCardHoverButton(),
         ),
       ),

     );
  }

}
