import 'package:flutter/material.dart';

class AuthTabWidget extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const AuthTabWidget({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w600,
              color: isSelected
                  ? const Color(0xFF3C5BA5)
                  : Colors.grey.shade300,
            ),
          ),

          const SizedBox(height: 8),

          Container(
            height: 3,
            width: 120,
            color: isSelected
                ? const Color(0xFF3C5BA5)
                : Colors.transparent,
          ),
        ],
      ),
    );
  }
}