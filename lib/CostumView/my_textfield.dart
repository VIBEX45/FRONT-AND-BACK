import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final bool obsecureText;
  final TextEditingController? controller;

  const MyTextField({super.key, 
  required this.hintText,
  required this.obsecureText,
  this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(  
        obscureText: false,  
        controller: controller, 
        // style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.secondary),
                borderRadius: BorderRadius.circular(20)
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: 
                  BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                    
                    // borderRadius: BorderRadius.circular(40),
                    ),
                ),
                fillColor: Theme.of(context).colorScheme.tertiary,
                // fillColor: Colors.white,
                filled: true,
                hintText: hintText,
                // hintStyle: const TextStyle(color: Colors.white38),
                // labelStyle: TextStyle(color: Colors.white)
             ),
             ),
    );
  }
}
