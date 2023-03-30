import 'package:PropnexTestApp/components/colors.dart';
import 'package:PropnexTestApp/components/text.dart';
import 'package:PropnexTestApp/controller/SplashController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SplashPage extends StatelessWidget {
  static const routedName = '/splashScreen';

  SplashController splashController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColors.projectColorMainColor(),
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(
              'assets/img_splash.png',
              height: double.infinity,
              fit: BoxFit.fitHeight,
            ),
            Center(
              child: Column(
                children: [
                  Spacer(),
                  TextRegularLancelot(
                    label: 'MovieApp',
                    size: 64,
                    color: Colors.white,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 32, right: 32),
                    child: TextRegularExo(
                      label: 'watch and find movie that bring your mood back ',
                      color: Colors.white,
                      size: 24,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Spacer()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
