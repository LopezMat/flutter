import 'package:flutter/material.dart';
import 'package:good_meal/models/Constantes.dart';
import 'package:good_meal/widgets/TitleText.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Container(
      color: appBarColor,
      width: size.width,
      padding: EdgeInsets.all(30),
      child: Column(
        children: [
          Row( // titre de la section
            children: [
              TitleText(string: "Contact : "),
              Expanded(child: Container())
            ],
          ),
          Row( // le contenue sur deux colonnes
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column( // la première colonne
                children: social(),
              ),
              Column( // la deuxième colonne
                children: [
                  Text("Contactez-nous : "),
                  TextButton(onPressed: (){}, child: Text("tel : 06.06.06.06.06")),
                  TextButton(onPressed: (){}, child: Text("email: cfa@lidem.eu")),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  List<Widget> social(){
    List<Widget> items = [Text("Social network")];
    items.addAll(getSocialButton());
    return items;
  }
}
