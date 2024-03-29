import 'package:flutter/material.dart';
import 'package:intro_flutter/models/MakeItResponsive.dart';
import 'package:intro_flutter/section/CarouselSection.dart';
import 'package:intro_flutter/section/ContactSection.dart';
import 'package:intro_flutter/section/EventSection.dart';
import 'package:intro_flutter/section/TopStack.dart';
import 'package:intro_flutter/widgets/PhoneBar.dart';
import 'package:intro_flutter/widgets/WebBar.dart';

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
    return Scaffold(
      appBar: ( screenSize == ScreenSize.small ) ? PhoneBar() : WebBar(size: size),
      drawer: DrawerSmall(), //composant de menu pour tel
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSection(depthIndex: 3,),
            /*Container(
              height: 250,
              child: Placeholder(),
            ), */
            ContactSection(),
            Placeholder()
          ],
        ),
      ),
    );
  }
}
