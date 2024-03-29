import 'package:flutter/material.dart';
import 'package:intro_flutter/models/MakeItResponsive.dart';
import 'package:intro_flutter/section/EventSection.dart';
import 'package:intro_flutter/section/TopStack.dart';
import 'package:intro_flutter/widgets/PhoneBar.dart';
import 'package:intro_flutter/widgets/WebBar.dart';

import '../widgets/DrawerSmall.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            TopStack(),
            EventSection(),
            Placeholder()
          ],
        ),
      ),
    );
  }
}
