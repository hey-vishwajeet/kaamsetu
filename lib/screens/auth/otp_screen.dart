import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../routes/app_routes.dart';
import '../../routes/route_arguments.dart';

// COLORS

const Color orange = Color(0xFFEF791B);
const Color background = Color(0xFFFAF3E8);
const Color darkBlue = Color(0xFF17243A);

// OTP SCREEN

class OtpScreen extends StatefulWidget {
  const OtpScreen({
    required this.phone,
    super.key,
  });

  final String phone;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final _formKey = GlobalKey<FormState>();

  final _otpController = TextEditingController();

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  // VERIFY OTP AND NAVIGATE TO REGISTRATION

  void _verify() {
    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    }

    Navigator.pushNamed(
      context,
      AppRoutes.registration,
      arguments: RegistrationArguments(
        phone: widget.phone,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 22,
            vertical: 25,
          ),

          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 480,
              ),

              child: Column(
                children: [
                  const SizedBox(height: 10),

                  // KAAMSETU LOGO

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.engineering,
                        color: orange,
                        size: 45,
                      ),

                      const SizedBox(width: 10),

                      const Text(
                        "KaamSetu",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: darkBlue,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    "Connecting Skills With Opportunities",
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.black54,
                    ),
                  ),

                  const SizedBox(height: 35),

                  // OTP ILLUSTRATION

                  Container(
                    height: 190,
                    width: double.infinity,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),

                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFFFFE4C5),
                          Color(0xFFF8C58E),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),

                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.verified_user,
                          size: 90,
                          color: Color(0xFF344052),
                        ),

                        SizedBox(height: 10),

                        Text(
                          "SECURE VERIFICATION",
                          style: TextStyle(
                            color: darkBlue,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 35),

                  // HEADING

                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Verify Your Mobile Number",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: darkBlue,
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Enter the 6-digit OTP to verify your "
                      "mobile number and continue to registration.",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                        height: 1.5,
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),

                  // MOBILE NUMBER

                  Container(
                    padding: const EdgeInsets.all(16),

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: const Color(0xFFEADFD3),
                      ),
                    ),

                    child: Row(
                      children: [
                        const Icon(
                          Icons.phone_android,
                          color: orange,
                          size: 25,
                        ),

                        const SizedBox(width: 12),

                        Expanded(
                          child: Text(
                            "+91 ${widget.phone}",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: darkBlue,
                            ),
                          ),
                        ),

                        const Icon(
                          Icons.check_circle,
                          color: Colors.green,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),

                  // OTP INPUT FIELD

                  Form(
                    key: _formKey,

                    child: TextFormField(
                      controller: _otpController,

                      keyboardType: TextInputType.number,

                      maxLength: 6,

                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],

                      textAlign: TextAlign.center,

                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 12,
                        color: darkBlue,
                      ),

                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter OTP";
                        }

                        if (value.length != 6) {
                          return "Enter complete 6-digit OTP";
                        }

                        if (value != '123456') {
                          return "Invalid prototype OTP. Use 123456.";
                        }

                        return null;
                      },

                      decoration: InputDecoration(
                        counterText: "",

                        hintText: "------",

                        hintStyle: const TextStyle(
                          letterSpacing: 8,
                          color: Colors.black26,
                        ),

                        filled: true,
                        fillColor: Colors.white,

                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 20,
                        ),

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),

                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: Color(0xFFEADFD3),
                          ),
                        ),

                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: orange,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),

                  // VERIFY BUTTON

                  SizedBox(
                    width: double.infinity,
                    height: 55,

                    child: ElevatedButton(
                      onPressed: _verify,

                      style: ElevatedButton.styleFrom(
                        backgroundColor: orange,
                        foregroundColor: Colors.white,

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),

                      child: const Text(
                        "Verify & Continue",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  // CHANGE MOBILE NUMBER

                  TextButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                    },

                    icon: const Icon(
                      Icons.edit,
                      color: orange,
                    ),

                    label: const Text(
                      "Change Mobile Number",
                      style: TextStyle(
                        color: orange,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),

                  const Text(
                    "Your information is securely protected.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}