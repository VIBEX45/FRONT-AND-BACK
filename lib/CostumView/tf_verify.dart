import 'package:flutter/material.dart';

class TFVerif extends StatelessWidget {
  final String hintText;
  final bool obsecureText;
  final TextEditingController? controller;

  const TFVerif({super.key,
  required this.hintText,
  required this.obsecureText,
  this.controller
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: SizedBox(
      width: 40,
      child: TextField(
        obscureText: false,
        controller: controller,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.secondary)),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            fillColor: Theme.of(context).colorScheme.tertiary,
            filled: true,
            hintText: hintText),
      ),
    ));
  }
}
