import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeaderButton extends StatelessWidget {
  final String? imagePath;
  final Color? color;
  final VoidCallback? onPressed;

  HeaderButton({this.onPressed, this.imagePath, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      child: InkWell(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Image.asset(
            "assets/ic_back.png",
            height: 10,
            color: color != null ? color : Colors.white,
          ),
        ),
        onTap: onPressed,
      ),
    );
  }
}
