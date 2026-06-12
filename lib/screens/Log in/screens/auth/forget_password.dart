import 'package:flutter/material.dart';
import '../../Widgets/back_button_widget.dart';
import '../../Widgets/custom_button.dart';
import '../../Widgets/custom_textfield_widget.dart';
import '../../data/mock_login_data.dart';
import '../../services/auth_service.dart';
import '../../utils/validators.dart';
import 'login_page.dart';
import 'otp_verification.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() =>
      _ForgotPasswordPageState();
}

class _ForgotPasswordPageState
    extends State<ForgotPasswordPage> {

  final TextEditingController emailController =
  TextEditingController();

  bool isEmailEntered = false;
  bool emailError = false;

  String emailErrorText = "";

  @override
  void initState() {
    super.initState();

    emailController.addListener(() {
      setState(() {
        isEmailEntered =
            emailController.text.trim().isNotEmpty;
      });
    });
  }

  void validateEmail() {
    String email =
    emailController.text.trim();

    String? validation =
    Validators.validateEmail(email);

    if (validation != null) {
      setState(() {
        emailError = true;
        emailErrorText = validation;
      });
      return;
    }

    if (!AuthService.emailExists(
      email,
    )) {
      setState(() {
        emailError = true;
        emailErrorText =
        "Email not found";
      });
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) =>
        const OtpVerificationPage(),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Padding(
          padding:
          const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height:
                  MediaQuery.of(context)
                      .size
                      .height *
                      0.55,
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment
                        .start,
                    children: [

                      const SizedBox(
                          height: 20),

                      const CustomBackButton(
                        nextPage:
                        LoginPage(),
                      ),

                      const SizedBox(
                          height: 30),

                      const Text(
                        "Forgot password",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight:
                          FontWeight
                              .w700,
                        ),
                      ),

                      const SizedBox(
                          height: 10),

                      Text(
                        "Please enter your email to reset the password",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors
                              .grey
                              .shade600,
                        ),
                      ),

                      const SizedBox(
                          height: 30),

                      CustomTextFieldWidget(
                        title:
                        "Your Email",
                        hintText:
                        "admin@gmail.com",
                        controller:
                        emailController,
                        errorText:
                        emailError
                            ? emailErrorText
                            : null,
                        onChanged:
                            (value) {
                          setState(() {
                            emailError =
                            false;
                          });
                        },
                      ),

                      const SizedBox(
                          height: 20),

                      CustomButton(
                        text:
                        "Reset Password",
                        onPressed:
                        isEmailEntered
                            ? validateEmail
                            : null,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}