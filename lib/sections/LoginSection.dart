import 'package:flutter/material.dart';
import 'package:good_meal/models/Constantes.dart';
import 'package:good_meal/pages/HomePage.dart';

class LoginSection extends StatefulWidget {
  const LoginSection({super.key});

  @override
  State<LoginSection> createState() => _LoginSectionState();
}

class _LoginSectionState extends State<LoginSection> {
  
  final TextEditingController loginController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    
    Size size = MediaQuery.of(context).size;
    
    return Container(
      padding: EdgeInsets.only(top: 50),
      width: size.width,
      child: Center(
        child: Card(
          color: appBarColor,
          child: Container(
            width: 300,
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container( // champ login
                  padding: EdgeInsets.only(top: 20),
                  child: TextFormField(
                    controller: loginController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "login"
                    ),
                    validator: (value){
                      if(value!.isEmpty){
                        return "svp entre un login";
                      }
                      return null;
                    },
                  ),
                ),
                Container( // champs de mot de passe
                  padding: EdgeInsets.only(top: 20),
                  child: TextFormField(
                    controller: passController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Mot de passe"
                    ),
                    validator: (value){
                      if( value!.isEmpty){
                        return "veuillez entrer un mot de passe !!!";
                      } else if(value.length < 8 ){
                        return "le mot de passe doit être suprérieur à 8 charactères";
                      } else if(!value.contains(RegExp(r'[!%£&@#$]'))){
                        return "il faut un charactère spéciale !!";
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          onPressed: (){},
                          child: Text("Annuler")
                      ),
                      SizedBox(width: 10,),
                      ElevatedButton(
                          onPressed: (){
                            if(loginController.text == adminlog &&
                                generateMd5(passController.text) == adminpass){
                              Navigator.push(context,
                                MaterialPageRoute(builder: (context){
                                  return HomePage();
                                })
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  content: Text("vous vous êtes trompé !!!")));
                            }
                          },
                          child: Text("Go")
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
