import 'package:flutter/material.dart';
import 'Widgets/back_button_widget.dart';
import 'Widgets/custom_button.dart';
import 'Widgets/custom_textfield_widget.dart';
import 'login_page.dart';
import 'password_reset.dart';

class CreateNewPasswordPage extends StatefulWidget {
  const CreateNewPasswordPage({super.key});

  @override
  State<CreateNewPasswordPage> createState() =>
      _CreateNewPasswordPageState();
}

class _CreateNewPasswordPageState
    extends State<CreateNewPasswordPage> {

  final TextEditingController passwordController =
  TextEditingController();

  final TextEditingController
  confirmPasswordController =
  TextEditingController();

  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  bool hasError = false;
  String errorText = "";

  @override
  void initState() {
    super.initState();

    passwordController.addListener(() {
      setState(() {});
    });

    confirmPasswordController
        .addListener(() {
      setState(() {});
    });
  }

  void resetPassword() {
    String password =
    passwordController.text.trim();

    String confirmPassword =
    confirmPasswordController.text.trim();

    if (password.isEmpty) {
      setState(() {
        hasError = true;
        errorText =
        "Password is required";
      });
      return;
    }

    if (password.length < 6) {
      setState(() {
        hasError = true;
        errorText =
        "Password must be at least 6 characters";
      });
      return;
    }

    if (password != confirmPassword) {
      setState(() {
        hasError = true;
        errorText =
        "Passwords do not match";
      });
      return;
    }

    setState(() {
      hasError = false;
    });

    ScaffoldMessenger.of(context)
        .showSnackBar(
      const SnackBar(
        content: Text(
          "Password Reset Successfully",
        ),
      ),
    );

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (_) =>
        const LoginPage(),
      ),
          (route) => false,
    );
  }

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    bool buttonEnabled =
        passwordController.text.isNotEmpty &&
            confirmPasswordController
                .text
                .isNotEmpty;

    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Padding(
          padding:
          const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            children: [

              SizedBox(
                height:
                MediaQuery.of(context)
                    .size
                    .height *
                    0.65,

                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [

                    const SizedBox(height: 20),

                    CustomBackButton(
                      nextPage:
                      const PasswordResetPage(),
                    ),

                    const SizedBox(height: 30),

                    const Text(
                      "Create New Password",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight:
                        FontWeight.w700,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      "Create a strong password and confirm it below.",
                      style: TextStyle(
                        fontSize: 15,
                        color:
                        Colors.grey.shade600,
                      ),
                    ),

                    const SizedBox(height: 30),

                    CustomTextFieldWidget(
                      title: "New Password",
                      hintText:
                      "Enter new password",
                      controller:
                      passwordController,
                      obscureText:
                      obscurePassword,
                      suffixIcon:
                      IconButton(
                        icon: Icon(
                          obscurePassword
                              ? Icons
                              .visibility_off_outlined
                              : Icons
                              .visibility_outlined,
                        ),
                        onPressed: () {
                          setState(() {
                            obscurePassword =
                            !obscurePassword;
                          });
                        },
                      ),
                    ),

                    CustomTextFieldWidget(
                      title:
                      "Confirm Password",
                      hintText:
                      "Confirm password",
                      controller:
                      confirmPasswordController,
                      obscureText:
                      obscureConfirmPassword,
                      errorText:
                      hasError
                          ? errorText
                          : null,
                      suffixIcon:
                      IconButton(
                        icon: Icon(
                          obscureConfirmPassword
                              ? Icons
                              .visibility_off_outlined
                              : Icons
                              .visibility_outlined,
                        ),
                        onPressed: () {
                          setState(() {
                            obscureConfirmPassword =
                            !obscureConfirmPassword;
                          });
                        },
                      ),
                    ),

                    const SizedBox(height:20),

                    CustomButton(
                      text:
                      "Reset Password",
                      onPressed:
                      buttonEnabled
                          ? resetPassword
                          : null,
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