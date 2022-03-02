import 'package:cow_burger/app/core/bindings/application_binding.dart';
import 'package:cow_burger/app/core/ui/cow_ui.dart';
import 'package:cow_burger/app/routes/auth_routers.dart';
import 'package:cow_burger/app/routes/splash_routers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const CowBurgerMainApp());
}

class CowBurgerMainApp extends StatelessWidget {
  const CowBurgerMainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cow Burger',
      theme: CowUI.theme,
      initialBinding: ApplicationBinding(),
      getPages: [
        ...SplashRouters.routers,
        ...AuthRouters.routers,
      ],
    );
  }
}
