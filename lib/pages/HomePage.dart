import 'package:flutter/material.dart';
import 'package:good_meal/models/MakeItResponsive.dart';
import 'package:good_meal/sections/EventSection.dart';
import 'package:good_meal/sections/TopStack.dart';
import 'package:good_meal/widgets/PhoneBar.dart';
import 'package:good_meal/widgets/WebBar.dart';

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
    print(size.width);
    print(screenSize);
    return Scaffold(
      appBar: ( screenSize == ScreenSize.small ) ? PhoneBar() : WebBar(size: size),
      drawer: DrawerSmall(), // composant de menu pour tel
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
