import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CodeVerification extends StatefulWidget {
  const CodeVerification({super.key});

  @override
  State<CodeVerification> createState() => _CodeVerificationState();
}

class _CodeVerificationState extends State<CodeVerification> {
  TextEditingController pinController = TextEditingController();
  final String userEmail = "eca__@gmail.com";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // Back Button
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back, color: Colors.black),
              ),

              const SizedBox(height: 30),

              // Title
              const Text(
                "Verification Code",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              const SizedBox(height: 15),

              // Description
              RichText(
                text: TextSpan(
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    height: 1.5,
                  ),
                  children: [
                    const TextSpan(text: "We send verification code on your\n"),
                    TextSpan(
                      text: userEmail,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              // PIN Code Field
              Center(
                child: PinCodeTextField(
                  appContext: context,
                  length: 4,
                  controller: pinController,
                  obscureText: false,

                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,

                    borderRadius: BorderRadius.circular(10),
                        fieldHeight: 60,
                      fieldWidth: 60,
                    activeFillColor: Colors.white,
                       activeColor: Colors.blue,
                    selectedColor: Colors.blue,
                        inactiveColor: Colors.grey[300],
                    selectedFillColor: Colors.white,
                        inactiveFillColor: Colors.grey[100],
                  ),
                  animationDuration: const Duration(milliseconds: 300),
                  enableActiveFill: true,
                  onCompleted: (v) {

                    // Print ki jagah debugPrint use karein
                    debugPrint("Completed: $v");
                  },
                  onChanged: (value) {

                    // Print ki jagah debugPrint use karein
                    debugPrint(value);
                  },
                ),
              ),

              const SizedBox(height: 40),

              // Continue Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Add your verification logic here
                    if (pinController.text.length == 4) {
                      _verifyCode(pinController.text);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "Continue",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Resend Code
              Center(
                child: TextButton(
                  onPressed: () {
                    _resendCode();
                  },
                  child: const Text(
                    "Resend code?",
                    style: TextStyle(fontSize: 16, color: Colors.blue),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _verifyCode(String code) {
    // Add your verification API call here
    debugPrint("Verifying code: $code");

    // Show loading or navigate to next screen
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Verifying code: $code"),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _resendCode() {
    // Add resend code logic here
    debugPrint("Resending code to $userEmail");

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Verification code sent again!"),
        backgroundColor: Colors.blue,
      ),
    );
  }

  @override
  void dispose() {
    pinController.dispose();
    super.dispose();
  }
}
