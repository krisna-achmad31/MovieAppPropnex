import 'package:PropnexTestApp/components/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar {
  static Widget customAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(0),
      child: AppBar(
        backgroundColor: ProjectColors.projectColorMainColor(),
        elevation: 0,
      ),
    );
  }
}
