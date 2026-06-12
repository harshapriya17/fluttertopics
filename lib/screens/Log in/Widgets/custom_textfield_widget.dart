import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final String title;
  final String hintText;
  final TextEditingController controller;
  final String? errorText;
  final bool obscureText;
  final Widget? suffixIcon;

  final Function(String)? onChanged;

  const CustomTextFieldWidget({
    super.key,
    required this.title,
    required this.hintText,
    required this.controller,
    this.errorText,
    this.obscureText = false,
    this.suffixIcon,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    bool hasError = errorText != null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(height: 10),

        TextFormField(
          controller: controller,
          obscureText: obscureText,
          onChanged: onChanged,

          decoration: InputDecoration(
            hintText: hintText,

            errorText: errorText,

            filled: true,
            fillColor: Colors.grey.withOpacity(0.08),

            contentPadding:
            const EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 18,
            ),

            suffixIcon: suffixIcon,

            enabledBorder: OutlineInputBorder(
              borderRadius:
              BorderRadius.circular(14),
              borderSide: BorderSide(
                color: hasError
                    ? Colors.red
                    : Colors.grey.shade300,
              ),
            ),

            focusedBorder: OutlineInputBorder(
              borderRadius:
              BorderRadius.circular(14),
              borderSide: BorderSide(
                color: hasError
                    ? Colors.red
                    : const Color(0xFF3C5BA5),
                width: 2,
              ),
            ),

            errorBorder: OutlineInputBorder(
              borderRadius:
              BorderRadius.circular(14),
              borderSide: const BorderSide(
                color: Colors.red,
                width: 2,
              ),
            ),

            focusedErrorBorder:
            OutlineInputBorder(
              borderRadius:
              BorderRadius.circular(14),
              borderSide: const BorderSide(
                color: Colors.red,
                width: 2,
              ),
            ),
          ),
        ),

        const SizedBox(height: 25),
      ],
    );
  }
}