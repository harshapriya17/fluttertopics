import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  final Widget nextPage;

  const CustomBackButton({
    super.key,
    required this.nextPage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios_new,
          size: 18,
        ),
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => nextPage,
            ),
          );
        },
      ),
    );
  }
}