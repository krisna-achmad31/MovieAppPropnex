import 'package:flutter/material.dart';

import 'colors.dart';

class TextRegularLancelot extends StatelessWidget {
  final String? label;
  final Color? color;
  final double? size;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final TextDecoration? textDecoration;
  final int? maxLine;
  final double? height;
  final TextOverflow? overFlows;
  final bool? softWraps;
  final VoidCallback? functionMove;

  TextRegularLancelot({this.label, this.color, this.size, this.textAlign, this.fontWeight, this.textDecoration, this.maxLine, this.height, this.overFlows, this.softWraps, this.functionMove});

  @override
  Widget build(BuildContext context) {
    return Text(
      label!,
      maxLines: maxLine != null ? maxLine : 4,
      overflow: overFlows,
      softWrap: softWraps,
      style: TextStyle(
          height: height != null ? height : 1.2, color: color != null ? color : Colors.black, fontSize: size != null ? size : 14, fontFamily: 'Lancelot', fontWeight: fontWeight != null ? fontWeight : FontWeight.normal, decoration: textDecoration != null ? textDecoration : TextDecoration.none),
      textAlign: textAlign != null ? textAlign : TextAlign.start,
    );
  }
}

class TextRegularExo extends StatelessWidget {
  final String? label;
  final Color? color;
  final double? size;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final TextDecoration? textDecoration;
  final int? maxLine;
  final double? height;
  final TextOverflow? overFlows;
  final bool? softWraps;
  final VoidCallback? functionMove;

  TextRegularExo({this.label, this.color, this.size, this.textAlign, this.fontWeight, this.textDecoration, this.maxLine, this.height, this.overFlows, this.softWraps, this.functionMove});

  @override
  Widget build(BuildContext context) {
    return Text(
      label!,
      maxLines: maxLine != null ? maxLine : 4,
      overflow: overFlows,
      softWrap: softWraps,
      style:
          TextStyle(height: height != null ? height : 1.2, color: color != null ? color : Colors.black, fontSize: size != null ? size : 14, fontFamily: 'Exo', fontWeight: fontWeight != null ? fontWeight : FontWeight.normal, decoration: textDecoration != null ? textDecoration : TextDecoration.none),
      textAlign: textAlign != null ? textAlign : TextAlign.start,
    );
  }
}

class BasicTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final TextInputType? keyboardType;
  final TextInputAction? inputAction;
  final Color? borderColor;
  final bool? isEnabled;
  final Function(String)? function;

  BasicTextField({this.controller, this.labelText, @required this.hintText, this.keyboardType = TextInputType.text, this.borderColor, this.isEnabled = true, this.function, this.inputAction});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      textInputAction: inputAction,
      controller: controller,
      decoration: InputDecoration(
        enabled: isEnabled!,
        labelText: labelText,
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.white, fontSize: 16, fontFamily: 'Ambit'),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: OutlineInputBorder(borderSide: BorderSide(color: borderColor != null ? borderColor! : Colors.white), borderRadius: BorderRadius.circular(16)),
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: borderColor != null ? borderColor! : Colors.white), borderRadius: BorderRadius.circular(16)),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: borderColor != null ? borderColor! : Colors.black), borderRadius: BorderRadius.circular(16)),
        errorBorder: OutlineInputBorder(borderSide: BorderSide(color: borderColor != null ? borderColor! : Colors.black), borderRadius: BorderRadius.circular(16)),
      ),
      style: TextStyle(fontSize: 14, fontFamily: 'Ambit', color: Colors.white),
      onChanged: function,
    );
  }
}

class WhiteOutlinedTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final TextInputType? type;
  final TextInputAction? action;
  final int? minLines;
  final int? maxLines;
  final int? maxLength;
  final FocusNode? function;
  final Function(String)? functionMove;
  final bool? autofocus;
  final VoidCallback? functionSearch;
  final Function? test;

  const WhiteOutlinedTextField({this.controller, this.hintText, this.type, this.action, this.minLines, this.maxLines, this.maxLength, this.function, this.functionMove, this.autofocus, this.functionSearch, this.test});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      width: double.infinity,
      child: TextFormField(
        autofocus: autofocus!,
        onChanged: functionMove,
        focusNode: function,
        minLines: minLines,
        maxLines: maxLines,
        controller: controller,
        decoration: InputDecoration(
          isDense: true,
          hintText: hintText,
          contentPadding: EdgeInsets.only(left: 16, top: 0, bottom: 0),
          suffixIcon: InkWell(
              onTap: functionSearch,
              child: Image.asset(
                'assets/ic_search.png',
                color: Colors.white,
              )),
          hintStyle: TextStyle(fontSize: 14, fontFamily: 'Exo', color: Colors.white),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 1.0), borderRadius: BorderRadius.circular(8)),
          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 1.0), borderRadius: BorderRadius.circular(16)),
        ),
        style: TextStyle(fontSize: 14, fontFamily: 'Exo', color: Colors.white),
        keyboardType: type,
        textInputAction: action,
        maxLength: maxLength,
      ),
    );
  }
}
