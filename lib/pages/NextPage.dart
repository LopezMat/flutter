import 'package:flutter/material.dart';
import 'package:good_meal/models/MakeItResponsive.dart';
import 'package:good_meal/sections/CarouselSection.dart';
import 'package:good_meal/sections/ContactSection.dart';
import 'package:good_meal/sections/EventSection.dart';
import 'package:good_meal/sections/TopStack.dart';
import 'package:good_meal/widgets/PhoneBar.dart';
import 'package:good_meal/widgets/WebBar.dart';

import '../widgets/DrawerSmall.dart';

class NextPage extends StatefulWidget {
  const NextPage({super.key});

  @override
  State<NextPage> createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
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
            CarouselSection(depthIndex: 3,),
            // Container(
            //   height: 150,
            //   child: Placeholder(),
            // ),
            ContactSection(),
            Placeholder()
          ],
        ),
      ),
    );
  }
}
