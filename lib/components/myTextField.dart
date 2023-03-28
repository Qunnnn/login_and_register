import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool obscureText;
  const MyTextField({super.key, required this.controller, required this.label , required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40.0),
      child: TextFormField(
        obscuringCharacter: '*',
        autofocus: false,
        obscureText: obscureText ? true : false,
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
        ),
      ),
    );
  }
}
