import 'package:flutter/material.dart';
import 'package:good_meal/models/Constantes.dart';
import 'package:good_meal/widgets/Branding.dart';

class PhoneBar extends AppBar {
  PhoneBar(): super(
    title: Branding(fontTitleSize: 20),
    centerTitle: true,
    backgroundColor: appBarColor,
  );
}