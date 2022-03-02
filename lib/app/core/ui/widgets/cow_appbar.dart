import 'package:flutter/material.dart';

class CowAppbar extends AppBar {
  CowAppbar({Key? key, double elevation = 2})
      : super(
            key: key,
            backgroundColor: Colors.white,
            elevation: elevation,
            centerTitle: true,
            title: Image.asset(
              'assets/images/logo.png',
              width: 80,
            ));
}
