import 'package:flutter/material.dart';
import 'package:kolay_wms_mobile/constants.dart';

class RoundedButton extends StatelessWidget {
  final String? text;
  final double? width;
  final double? height;

  final Function()? press;
  final Color? color, textColor;
  final double? fontSize;
  const RoundedButton(
      {Key? key,
      required this.text,
      required this.press,
      this.color = primaryColor,
      this.textColor = Colors.white,
      this.fontSize = 16,
      this.width = 20,
      this.height = 50})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(color),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ))),
        onPressed: press,
        child: Text(
          text!,
          style: TextStyle(fontSize: fontSize, color: textColor),
        ),
      ),
    );
  }
}
