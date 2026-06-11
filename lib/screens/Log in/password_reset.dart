import 'package:flutter/material.dart';
import 'Widgets/back_button_widget.dart';
import 'Widgets/custom_button.dart';
import 'new_password.dart';
import 'otp_verification.dart';

class PasswordResetPage extends StatelessWidget {
  const PasswordResetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            children: [
              SizedBox(
                height:
                MediaQuery.of(context).size.height *
                    0.55,
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [

                    const SizedBox(height: 20),

                    CustomBackButton(
                      nextPage:
                      const OtpVerificationPage(),
                    ),

                    const SizedBox(height: 40),

                    const Text(
                      "Password Reset",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF222222),
                      ),
                    ),

                    const SizedBox(height: 15),

                    Text(
                      "Your password has been successfully reset. Click confirm to set a new password.",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.shade600,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 45),

                    CustomButton(
                      text: "Confirm",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                            const CreateNewPasswordPage(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}