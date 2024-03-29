import 'package:flutter/material.dart';
import 'package:good_meal/sections/LoginSection.dart';

import '../models/MakeItResponsive.dart';
import '../widgets/PhoneBar.dart';
import '../widgets/WebBar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ScreenSize screenSize = MakeItResponsive().getScreenSize(context);
    return Scaffold(
      appBar: ( screenSize == ScreenSize.small ) ? PhoneBar() : WebBar(size: size),
      body: SingleChildScrollView(
        child: Column(
          children: [
           LoginSection(),
          ],
        ),
      ),
    );
  }
}
