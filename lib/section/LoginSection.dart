import 'package:flutter/material.dart';
import 'package:intro_flutter/models/Constantes.dart';

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

    return  Container(
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
                Container( //champs login
                  padding: EdgeInsets.only(top: 20),
                  child: TextFormField(
                    controller: loginController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "login"
                    ),
                    validator: (value){
                      if(value!.isEmpty){
                        return "svp rentrez un login";
                      }
                      return null;
                    },
                  ),
                ),
                Container( //champs de mot de passe
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
                        return "veuillez entrez un mot de passe payou !!!!";
                      }else if(value.length < 8){
                        return "le mot de passe doit être supèrieur à 8 charactères";
                      }else if(!value.contains(RegExp(r'[!%£&@#$]'))){
                        return "il faut un charactère spéciale !!!";
                      }
                      return null;
                    },
                  ),
                ),
                Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
