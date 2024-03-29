import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:good_meal/models/CarouselImage.dart';
import 'package:good_meal/models/Event.dart';
import 'package:good_meal/models/UrlClass.dart';
import 'package:good_meal/pages/GibliPage.dart';
import 'package:good_meal/pages/HomePage.dart';
import 'package:good_meal/pages/NextPage.dart';
import 'package:good_meal/widgets/UrlButton.dart';

import '../widgets/HoverButton.dart';
import 'package:good_meal/models/ButtonObject.dart';
import 'package:crypto/crypto.dart';

// définition des couleurs
Color appBarColor = const Color.fromRGBO(3, 169, 245, 1.0);
Color brandingColor = const Color.fromRGBO(255, 255, 255, 0.7);

// définir les chemins d'images
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

// gestion des boutons de menu
List<ButtonObject> menuButton = [
  ButtonObject(destination: HomePage(), label: "Ma cuisine"),
  ButtonObject(destination: NextPage(), label: "Mes recettes"),
  ButtonObject(destination: HomePage(), label: "Blog"),
  ButtonObject(destination: GibliPage(), label: "Gibli"),
];

List<HoverButton> getMenuButton() => menuButton.map(
        (btn) => HoverButton(button: btn)
).toList();


// gestion des boutons du topstack
List<ButtonObject> containerButton = [
  ButtonObject(destination: HomePage(), label: "Telephone", icon: Icon(Icons.phone)),
  ButtonObject(destination: HomePage(), label: "Mail", icon: Icon(Icons.mail)),
  ButtonObject(destination: HomePage(), label: "Visio", icon: Icon(Icons.person)),
];

// list de composant button pour le web
List<HoverButton> getCardHoverButton() =>
    containerButton.map( (button) => HoverButton(button: button) ).toList();

// function getHoverButton(containerButton) {
//   List<hoverButton> list;
//   for(button in containerButton){
//     list.add(HoverButton(button: button));
//   }
//   return list;
// }

// list de composant button pour le phone
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

// tableau event
List<Event> events = [
  Event(name: "Groinffre 1", path: p3),
  Event(name: "Groinffre 2", path: p4),
  Event(name: "Groinffre 3", path: p5),
  Event(name: "Groinffre 4", path: p6),
  Event(name: "Groinffre 5", path: p7),
];

List<UrlClass> networks = [
  UrlClass(name: "Facebook", url: "https://www.facebook.com"),
  UrlClass(name: "Instagram", url: "https://www.instagram.com"),
  UrlClass(name: "X", url: "https://www.twitter.com"),
];

List<UrlButton> getSocialButton() =>
    networks.map((net) => UrlButton(urlClass: net)).toList();

List<CarouselImage> cimages = [
  CarouselImage(name: "Cookie", path: p6),
  CarouselImage(name: "Rex", path: p7),
  CarouselImage(name: "Rintintin", path: p8),
  CarouselImage(name: "Bill", path: p9),
  CarouselImage(name: "Medor", path: p10),
  CarouselImage(name: "Gaston", path: p3),
  CarouselImage(name: "Toto", path: p12),
  CarouselImage(name: "Toto", path: p12),
  CarouselImage(name: "Toto", path: p12),
  CarouselImage(name: "Toto", path: p12),
  CarouselImage(name: "Toto", path: p12),
  CarouselImage(name: "Toto", path: p12),
];

// information de connexion
String adminlog = "administrator";
String adminpass = generateMd5("admin@2024");

// fonction de hash en md5
String generateMd5(String data){
  return md5.convert(utf8.encode(data)).toString();
}