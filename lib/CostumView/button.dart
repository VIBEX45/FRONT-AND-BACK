import 'package:flutter/material.dart';


class MyButton extends StatelessWidget {
  final String text;
  final Icon? icon;
  final void Function()? onTap;
  const MyButton(
      {super.key,
      required this.text,
      required this.onTap,
      this.icon,
      required TextStyle Function(
              {Paint? background,
              Color? backgroundColor,
              Color? color,
              TextDecoration? decoration,
              Color? decorationColor,
              TextDecorationStyle? decorationStyle,
              double? decorationThickness,
              List<FontFeature>? fontFeatures,
              double? fontSize,
              FontStyle? fontStyle,
              FontWeight? fontWeight,
              Paint? foreground,
              double? height,
              double? letterSpacing,
              Locale? locale,
              List<Shadow>? shadows,
              TextBaseline? textBaseline,
              TextStyle? textStyle,
              double? wordSpacing})
          style,
      required int fontSize,
      required FontWeight fontWeight,
      required int height,});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            // color: const Color.fromARGB(104, 148, 209, 237),
            color: Colors.brown,
            borderRadius: BorderRadius.circular(20)),
        padding: const EdgeInsets.all(20),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          //text
          Text(text, style: const TextStyle(color: Colors.white)),
      
          const SizedBox(
            width: 10,
          ),
      
          //icon
          // Icon(Icons.arrow_forward, color: Colors.white)
        ]),
      ),
    );
  }
}
