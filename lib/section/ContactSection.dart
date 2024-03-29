import 'package:flutter/material.dart';
import 'package:intro_flutter/models/Constantes.dart';
import 'package:intro_flutter/widgets/TitleText.dart';

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
          Row(//titre de la section
            children: [
              TitleText(string: "Contact : "),
              Expanded(child: Container())
            ],
          ),
          Row(//le contenue sur 2 colonnes
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // espacement en bordure
            children: [
              Column( //la première colone
                children: social()
              ),
              Column( //la deuxième colone
                children: [
                  Text("Contactez-nous"),
                  TextButton(onPressed: (){}, child: Text("tel: 0629845953")),
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
    List<Widget> items = [Text('Resaux sociaux')];
    items.addAll(getSocialButton());
    return items;
  }
}
