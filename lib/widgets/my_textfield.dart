import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: Colors.grey.shade900),
      controller: controller,
      obscureText: false,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade200),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.blueAccent),
        ),
        fillColor: Colors.grey.shade200,
        filled: true,
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
      ),
    );
  }
}
