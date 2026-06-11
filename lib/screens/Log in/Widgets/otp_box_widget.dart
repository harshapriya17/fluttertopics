import 'package:flutter/material.dart';

class OtpBoxWidget extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final FocusNode? nextFocus;
  final bool hasError;
  final VoidCallback? onChanged;

  const OtpBoxWidget({
    super.key,
    required this.controller,
    required this.focusNode,
    this.nextFocus,
    this.hasError = false,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 65,
      height: 70,
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,

        onChanged: (value) {
          if (value.length == 1 &&
              nextFocus != null) {
            FocusScope.of(context)
                .requestFocus(nextFocus);
          }

          if (onChanged != null) {
            onChanged!();
          }
        },

        decoration: InputDecoration(
          counterText: "",

          filled: true,
          fillColor:
          Colors.grey.withOpacity(0.05),

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
    );
  }
}