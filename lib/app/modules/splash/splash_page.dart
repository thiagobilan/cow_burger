import 'package:cow_burger/app/core/ui/widgets/cow_appbar.dart';
import 'package:cow_burger/app/core/ui/widgets/cow_button.dart';
import 'package:cow_burger/app/core/ui/widgets/cow_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFF140E0E),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: context.width,
                child: Image.asset(
                  'assets/images/lanche.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  SizedBox(
                    height: context.heightTransformer(reducedBy: 85),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: Image.asset(
                      'assets/images/logo.png',
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  CowButton(
                    onPress: () => Get.toNamed('/auth/login'),
                    label: 'Acessar',
                    width: context.widthTransformer(reducedBy: 40),
                    height: 35,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
