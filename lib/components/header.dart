import 'package:PropnexTestApp/components/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'button.dart';
import 'colors.dart';

class HeaderPage extends StatelessWidget {
  final String label;

  HeaderPage(this.label);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppBar().preferredSize.height,
      decoration: BoxDecoration(
        border: Border.all(width: 0, color: Colors.transparent),
        color: ProjectColors.projectColorSecondMainColor(),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: HeaderButton(
              onPressed: () {
                Get.back();
              },
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: TextRegularExo(
              label: label,
              size: 20,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
