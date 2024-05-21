import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomizedTextFormField2 extends StatelessWidget {
  CustomizedTextFormField2({
    Key? key,
    this.showSuffixIcon = false,
    required this.hint,
    this.obscureText = false,
    this.controller,
    this.validator,
    this.color,
  }) : super(key: key);

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
        hintStyle: TextStyle(
          color: Colors.white, // Set the hint color to white
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: Colors.white, width: 1.7),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: color ?? Colors.black, width: 1.7),
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
      style: const TextStyle(
        color: Colors.white,
      ),
    );
  }
}
