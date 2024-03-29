import 'package:flutter/material.dart';
import 'package:intro_flutter/models/Constantes.dart';
import 'package:intro_flutter/models/MakeItResponsive.dart';
import 'package:intro_flutter/section/CarouselSection.dart';
import 'package:intro_flutter/section/ContactSection.dart';
import 'package:intro_flutter/section/EventSection.dart';
import 'package:intro_flutter/section/TopStack.dart';
import 'package:intro_flutter/widgets/PhoneBar.dart';
import 'package:intro_flutter/widgets/WebBar.dart';

import '../helper/DbHelper.dart';
import '../models/Utilisateur.dart';
import '../widgets/DrawerSmall.dart';

class RecettePage extends StatefulWidget {
  const RecettePage({super.key});

  @override
  State<RecettePage> createState() => _RecettePageState();
}

class _RecettePageState extends State<RecettePage> {

  List<Utilisateur> users = [];
  final TextEditingController passController = TextEditingController();
  final TextEditingController nomController = TextEditingController();
  final TextEditingController prenomController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialize();
  }

  Future initialize() async {
    users = await DbHelper.instance.getUsers();
    if(users.isEmpty){
      //print("la table est vide");
      //on crée un utilisateur et on l'injecte dans la bdd
      Utilisateur userTest = Utilisateur(nom: "toto", prenom: "teauteau", login: "toto.toto", pass: generateMd5("toto@2024"));
      await DbHelper.instance.insertUser(userTest);
    }
    setState(() {
      users = users;
    });
  }

  Future refresh() async {
    users = await DbHelper.instance.getUsers();
    setState(() {
      users = users;
    });
}

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ScreenSize screenSize = MakeItResponsive().getScreenSize(context);
    return Scaffold(
      appBar: ( screenSize == ScreenSize.small ) ? PhoneBar() : WebBar(size: size),
      drawer: DrawerSmall(), //composant de menu pour tel
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                Text("ajouter un utilisateur"),
                Column(
                  children: [
                    TextFormField(
                      controller: nomController,
                      decoration: InputDecoration(labelText: "Nom", border: OutlineInputBorder()),
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                      controller: prenomController,
                      decoration: InputDecoration(labelText: "Prenom", border: OutlineInputBorder()),
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                      controller: passController,
                      decoration: InputDecoration(labelText: "Mot de passe", border: OutlineInputBorder()),
                      obscureText: true,
                    ),
                    Row(
                      children: [
                        InkWell(onTap: (){
                          nomController.clear();
                          prenomController.clear();
                          passController.clear();
                        }, child: Text("Annuler")),
                        SizedBox(width: 10,),
                        InkWell(onTap: (){
                          Utilisateur newUser = Utilisateur(nom: nomController.text, prenom: prenomController.text, login: nomController.text + "." + prenomController.text, pass: generateMd5(passController.text));
                          DbHelper.instance.insertUser(newUser);
                          refresh();

                        }, child: Text("Enregistrer")),
                      ],
                    )
                  ]
                ),
                Column(
                  children: users.map( (user) => Card(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(user.nom),
                            SizedBox(width: 5,),
                            Text(user.prenom)
                          ],
                        ),
                        Text(user.login),
                        Text(user.pass)
                      ],
                    ),
                  )).toList()
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
