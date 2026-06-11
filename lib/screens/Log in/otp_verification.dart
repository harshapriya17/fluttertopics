import 'dart:async';
import 'package:flutter/material.dart';
import 'Widgets/back_button_widget.dart';
import 'Widgets/custom_button.dart';
import 'Widgets/otp_box_widget.dart';
import 'forget_password.dart';
import 'password_reset.dart';

class OtpVerificationPage extends StatefulWidget {
  const OtpVerificationPage({super.key});

  @override
  State<OtpVerificationPage> createState() =>
      _OtpVerificationPageState();
}

class _OtpVerificationPageState
    extends State<OtpVerificationPage> {

  final otp1Controller = TextEditingController();
  final otp2Controller = TextEditingController();
  final otp3Controller = TextEditingController();
  final otp4Controller = TextEditingController();

  final FocusNode focus1 = FocusNode();
  final FocusNode focus2 = FocusNode();
  final FocusNode focus3 = FocusNode();
  final FocusNode focus4 = FocusNode();

  bool otpError = false;
  String otpErrorText = "";

  final String sampleOtp = "1234";

  int secondsRemaining = 30;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    secondsRemaining = 30;

    timer?.cancel();

    timer = Timer.periodic(
      const Duration(seconds: 1),
          (timer) {
        if (secondsRemaining > 0) {
          setState(() {
            secondsRemaining--;
          });
        } else {
          timer.cancel();
        }
      },
    );
  }

  void resendOtp() {
    startTimer();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          "OTP Resent Successfully",
        ),
      ),
    );
  }

  bool get otpCompleted =>
      otp1Controller.text.isNotEmpty &&
          otp2Controller.text.isNotEmpty &&
          otp3Controller.text.isNotEmpty &&
          otp4Controller.text.isNotEmpty;

  void verifyOtp() {
    String enteredOtp =
        otp1Controller.text +
            otp2Controller.text +
            otp3Controller.text +
            otp4Controller.text;

    if (enteredOtp.length != 4) {
      setState(() {
        otpError = true;
        otpErrorText = "OTP must be 4 digits";
      });
      return;
    }

    if (enteredOtp != sampleOtp) {
      setState(() {
        otpError = true;
        otpErrorText = "Invalid OTP";
      });
      return;
    }

    setState(() {
      otpError = false;
    });

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) =>
        const PasswordResetPage(),
      ),
    );
  }

  @override
  void dispose() {
    timer?.cancel();

    otp1Controller.dispose();
    otp2Controller.dispose();
    otp3Controller.dispose();
    otp4Controller.dispose();

    focus1.dispose();
    focus2.dispose();
    focus3.dispose();
    focus4.dispose();

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
          child: Column(
            children: [
              SizedBox(
                height:
                MediaQuery.of(context)
                    .size
                    .height *
                    0.60,
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [

                    const SizedBox(height: 20),

                    CustomBackButton(
                      nextPage:
                      const ForgotPasswordPage(),
                    ),

                    const SizedBox(height: 40),

                    const Text(
                      "OTP Verification",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight:
                        FontWeight.w700,
                      ),
                    ),

                    const SizedBox(height: 15),

                    Text(
                      "Please enter the 4-digit verification code sent to your email.",
                      style: TextStyle(
                        fontSize: 16,
                        color:
                        Colors.grey.shade600,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 30),

                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [

                        OtpBoxWidget(
                          controller:
                          otp1Controller,
                          focusNode: focus1,
                          nextFocus: focus2,
                          hasError:
                          otpError,
                          onChanged: () {
                            setState(() {
                              otpError =
                              false;
                            });
                          },
                        ),

                        OtpBoxWidget(
                          controller:
                          otp2Controller,
                          focusNode: focus2,
                          nextFocus: focus3,
                          hasError:
                          otpError,
                          onChanged: () {
                            setState(() {
                              otpError =
                              false;
                            });
                          },
                        ),

                        OtpBoxWidget(
                          controller:
                          otp3Controller,
                          focusNode: focus3,
                          nextFocus: focus4,
                          hasError:
                          otpError,
                          onChanged: () {
                            setState(() {
                              otpError =
                              false;
                            });
                          },
                        ),

                        OtpBoxWidget(
                          controller:
                          otp4Controller,
                          focusNode: focus4,
                          hasError:
                          otpError,
                          onChanged: () {
                            setState(() {
                              otpError =
                              false;
                            });
                          },
                        ),
                      ],
                    ),

                    if (otpError)
                      Padding(
                        padding:
                        const EdgeInsets.only(
                          top: 8,
                        ),
                        child: Text(
                          otpErrorText,
                          style:
                          const TextStyle(
                            color:
                            Colors.red,
                            fontSize: 12,
                          ),
                        ),
                      ),

                    const SizedBox(height: 20),

                    Center(
                      child: secondsRemaining > 0
                          ? Text(
                        "Resend OTP in 00:${secondsRemaining.toString().padLeft(2, '0')}",
                        style:
                        const TextStyle(
                          color: Color(
                              0xFF3C5BA5),
                          fontSize: 15,
                          fontWeight:
                          FontWeight.w600,
                        ),
                      )
                          : GestureDetector(
                        onTap:
                        resendOtp,
                        child:
                        const Text(
                          "Resend OTP",
                          style:
                          TextStyle(
                            color: Color(
                                0xFF3C5BA5),
                            fontSize:
                            15,
                            fontWeight:
                            FontWeight
                                .w700,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    CustomButton(
                      text:
                      "Verify OTP",
                      onPressed:
                      otpCompleted
                          ? verifyOtp
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