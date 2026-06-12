import 'package:flutter/material.dart';
import 'package:foodgo/screens/topics/topic1_stateless.dart';
import '../../Widgets/auth_tab_widget.dart';
import '../../Widgets/custom_button.dart';
import '../../Widgets/custom_textfield_widget.dart';
import '../../services/auth_service.dart';
import '../../utils/validators.dart';
import 'forget_password.dart';
import '../../data/mock_login_data.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() =>
      _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoginSelected = true;
  bool obscurePassword = true;

  bool hasError = false;
  bool emailError = false;

  String emailErrorText = "";

  final TextEditingController emailController =
  TextEditingController(
    text:"admin@gmail.com",
  );

  final TextEditingController passwordController =
  TextEditingController(
    text:"admin123",
  );

  void loginValidation() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    setState(() {
      emailError = false;
      hasError = false;
    });

    String? emailValidation =
    Validators.validateEmail(email);

    if (emailValidation != null) {
      setState(() {
        emailError = true;
        emailErrorText = emailValidation;
      });
      return;
    }

    if (!AuthService.login(
      email,
      password,
    )) {
      setState(() {
        hasError = true;
      });
      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) =>
        const Topic1Stateless(),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
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
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [

                const SizedBox(height: 30),

                // LOGIN / SIGNUP TAB

                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.center,
                  children: [

                    AuthTabWidget(
                      title: "Log in",
                      isSelected:
                      isLoginSelected,
                      onTap: () {
                        setState(() {
                          isLoginSelected =
                          true;
                        });
                      },
                    ),

                    const SizedBox(
                      width: 40,
                    ),

                    AuthTabWidget(
                      title: "Sign up",
                      isSelected:
                      !isLoginSelected,
                      onTap: () {
                        setState(() {
                          isLoginSelected =
                          false;
                        });
                      },
                    ),
                  ],
                ),

                const SizedBox(height: 60),

                // EMAIL FIELD

                CustomTextFieldWidget(
                  title: "Your Email",
                  hintText:
                  "admin@gmail.com",
                  controller:
                  emailController,
                  errorText:
                  emailError
                      ? emailErrorText
                      : null,
                ),

                // PASSWORD FIELD

                CustomTextFieldWidget(
                  title: "Password",
                  hintText: "admin123",
                  controller:
                  passwordController,
                  obscureText:
                  obscurePassword,
                  errorText: hasError
                      ? "Wrong Email or Password"
                      : null,
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

                Align(
                  alignment:
                  Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                          const ForgotPasswordPage(),
                        ),
                      );
                    },
                    child: const Text(
                      "Forgot password?",
                      style: TextStyle(
                        color:
                        Color(0xFF3C5BA5),
                        fontWeight:
                        FontWeight.w600,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                CustomButton(
                  text: "Continue",
                  onPressed:
                  loginValidation,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}