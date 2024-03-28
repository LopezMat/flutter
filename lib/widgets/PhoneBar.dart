import 'package:flutter/material.dart';
import 'package:intro_flutter/models/Constantes.dart';
import 'package:intro_flutter/widgets/Branding.dart';

class PhoneBar extends AppBar {
  PhoneBar(): super(
    title: Branding(fontTitleSize: 20),
    centerTitle: true,
    backgroundColor: appBarColor,

  );
}