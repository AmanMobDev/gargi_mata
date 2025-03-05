import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  String? value;
  FontWeight? fontWeight;
  double fontSize;
  Color color;
  TextAlign? textAlign;
  CustomTextWidget(
      {super.key,
      this.value,
      this.fontWeight,
      required this.fontSize,
      required this.color,
      this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(
      value!,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
      textAlign: textAlign,
    );
  }
}
