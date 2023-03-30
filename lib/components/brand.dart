import 'package:flutter/material.dart';

class Brand {
  static String brandName = "Krisna Flutter Starter";

  static Widget textOnly() {
    return Text(
      brandName,
      style: TextStyle(
        fontSize: 16,
      ),
    );
  }
}
