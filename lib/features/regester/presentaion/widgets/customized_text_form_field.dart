import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomizedTextFormField extends StatelessWidget {
  CustomizedTextFormField({
    super.key,
    this.showSuffixIcon = false,
    required this.hint,
    this.obscureText = false,
    this.controller,
    this.validator,
    this.color,
  });
  Color? color;
  final bool showSuffixIcon;
  final String hint;
  final bool obscureText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6),
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(
              color: Color.fromARGB(255, 96, 95, 95), width: 1.7),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
              color: color ?? Color.fromARGB(255, 96, 95, 95), width: 1.7),
        ),
        suffixIcon: showSuffixIcon
            ? ShaderMask(
                shaderCallback: (Rect bounds) {
                  return const LinearGradient(
                    colors: [Colors.blue, Colors.green],
                  ).createShader(bounds);
                },
                child: GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    Icons.remove_red_eye_outlined,
                    color: Colors.white, // Adjust the icon color as needed
                  ),
                ),
              )
            : null,
      ),
      style: TextStyle(
        color: color == null ? Colors.grey : color,
      ),
    );
  }
}
