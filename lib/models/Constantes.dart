import 'package:flutter/material.dart';
import 'package:intro_flutter/models/ButtonObject.dart';
import 'package:intro_flutter/models/CarouselImage.dart';
import 'package:intro_flutter/models/Event.dart';
import 'package:intro_flutter/models/UrlClass.dart';
import 'package:intro_flutter/pages/HomePage.dart';
import 'package:intro_flutter/pages/NextPage.dart';
import 'package:intro_flutter/widgets/HoverButton.dart';
import 'package:intro_flutter/widgets/UrlButton.dart';

//définition des couleurs
Color appBarColor = const Color.fromRGBO(3, 169, 244, 1);
Color brandingColor = const Color.fromRGBO(255, 255, 255, 0.7);


//définir les chemins d'image

String p1 = "images/p1.jpg";
String p2 = "images/p2.jpg";
String p3 = "images/p3.jpg";
String p4 = "images/p4.jpg";
String p5 = "images/p5.jpg";
String p6 = "images/p6.jpg";
String p7 = "images/p7.jpg";
String p8 = "images/p8.jpg";
String p9 = "images/p9.jpg";
String p10 = "images/p10.jpg";
String p12 = "images/p12.jpg";

//gestions des bouttons de menu
List<ButtonObject> menuButton = [
  ButtonObject(destination: HomePage(), label: "Ma cuisine"),
  ButtonObject(destination: NextPage(), label: "Mes recettes"),
  ButtonObject(destination: HomePage(), label: "Mon Blog"),
];

List<HoverButton> getMenuButton() => menuButton.map(
    (btn) => HoverButton(button: btn)
).toList();

//gestion des boutons du topstack
List<ButtonObject> containerButton = [
  ButtonObject(destination: HomePage(), label: "Téléphone", icon : Icon(Icons.phone)),
  ButtonObject(destination: HomePage(), label: "Mail", icon : Icon(Icons.mail)),
  ButtonObject(destination: HomePage(), label: "Compte", icon : Icon(Icons.person)),
];

//list de composant du button
List<HoverButton> getCardHoverButton() =>
    containerButton.map((button) => HoverButton(button: button)).toList();

//list de composant button pour le phone
List<FloatingActionButton> getFloating(BuildContext context) => containerButton.map(
    (button) => FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return button.destination;
          }));
        },
      backgroundColor: appBarColor,
      heroTag: button.label,
      child: button.icon,
    )
).toList();

//tableau event
List<Event> events = [
  Event(name: "Goinffre 1", path: p3),
  Event(name: "Goinffre 2", path: p4),
  Event(name: "Goinffre 3", path: p5),
  Event(name: "Goinffre 4", path: p10),
  Event(name: "Goinffre 5", path: p12),
];

//tableau d'url de contact

List<UrlClass> networks = [
  UrlClass(name: "Facebook", url:"https://www.facebook.com"),
  UrlClass(name: "Instagram", url:"https://www.instagram.com"),
  UrlClass(name: "X", url:"https://www.twitter.com"),
];

List<UrlButton> getSocialButton() =>
    networks.map((net)=> UrlButton(urlClass: net)).toList();

List<CarouselImage> cimages = [
  CarouselImage(name: "cookie", path: p6),
  CarouselImage(name: "rex", path: p7),
  CarouselImage(name: "tata", path: p8),
  CarouselImage(name: "toto", path: p9),
  CarouselImage(name: "tutu", path: p10),
  CarouselImage(name: "titi", path: p3),
  CarouselImage(name: "tintin", path: p4),
  CarouselImage(name: "tete", path: p12),

];