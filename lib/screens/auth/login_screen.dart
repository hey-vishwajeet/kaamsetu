import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../routes/app_routes.dart';
import '../../routes/route_arguments.dart';

// COLORS

const Color orange = Color(0xFFEF791B);
const Color background = Color(0xFFFAF3E8);
const Color darkBlue = Color(0xFF17243A);

// LOGIN SCREEN

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final mobileController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    mobileController.dispose();
    super.dispose();
  }

  // NAVIGATE TO OTP SCREEN

  void continueToOTP() {
    if (formKey.currentState!.validate()) {
      Navigator.pushNamed(
        context,
        AppRoutes.otp,
        arguments: OtpArguments(mobileController.text.trim()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 30),

              // LOGO
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.engineering, color: orange, size: 45),

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
                style: TextStyle(fontSize: 13, color: Colors.black54),
              ),

              const SizedBox(height: 25),

              // WORKER ILLUSTRATION
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                height: 270,
                width: double.infinity,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),

                  gradient: const LinearGradient(
                    colors: [Color(0xFFFFE4C5), Color(0xFFF8C58E)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),

                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    const Positioned(
                      top: 15,
                      right: 20,
                      child: Icon(Icons.cloud, size: 55, color: Colors.white70),
                    ),

                    const Positioned(
                      bottom: 5,
                      left: 5,
                      child: Icon(
                        Icons.location_city,
                        size: 100,
                        color: Color(0xFFD99C61),
                      ),
                    ),

                    const Positioned(
                      bottom: 5,
                      right: 5,
                      child: Icon(
                        Icons.apartment,
                        size: 110,
                        color: Color(0xFFD99C61),
                      ),
                    ),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.engineering,
                          size: 125,
                          color: Color(0xFF344052),
                        ),

                        const SizedBox(height: 8),

                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 8,
                          ),

                          decoration: BoxDecoration(
                            color: orange,
                            borderRadius: BorderRadius.circular(20),
                          ),

                          child: const Text(
                            "SKILLED WORKERS",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // LOGIN CONTENT
              Padding(
                padding: const EdgeInsets.all(25),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Welcome to KaamSetu!",
                      style: TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                        color: darkBlue,
                      ),
                    ),

                    const SizedBox(height: 12),

                    const Text(
                      "Find the right job, showcase your skills "
                      "and build a better future with AI-powered assistance.",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 30),

                    const Text(
                      "Mobile Number",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 12),

                    // MOBILE NUMBER FIELD
                    Form(
                      key: formKey,

                      child: TextFormField(
                        controller: mobileController,

                        keyboardType: TextInputType.phone,

                        maxLength: 10,

                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],

                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter mobile number";
                          }

                          if (!RegExp(r'^[6-9][0-9]{9}$').hasMatch(value)) {
                            return "Enter valid 10-digit mobile number";
                          }

                          return null;
                        },

                        decoration: InputDecoration(
                          counterText: "",

                          hintText: "Enter mobile number",

                          prefixIcon: const Padding(
                            padding: EdgeInsets.all(15),
                            child: Text(
                              "+91",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),

                          prefixIconConstraints: const BoxConstraints(
                            minWidth: 65,
                          ),

                          filled: true,
                          fillColor: Colors.white,

                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 18,
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
                        ),
                      ),
                    ),

                    const SizedBox(height: 25),

                    // CONTINUE BUTTON
                    SizedBox(
                      width: double.infinity,
                      height: 55,

                      child: ElevatedButton(
                        onPressed: continueToOTP,

                        style: ElevatedButton.styleFrom(
                          backgroundColor: orange,
                          foregroundColor: Colors.white,

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),

                        child: const Text(
                          "Continue",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 22),

                    const Center(
                      child: Text(
                        "You will receive an OTP for verification.",
                        style: TextStyle(fontSize: 13, color: Colors.black54),
                      ),
                    ),

                    const SizedBox(height: 30),

                    // FEATURES
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FeatureItem(
                          icon: Icons.psychology,
                          title: "AI Skill\nAssessment",
                        ),

                        FeatureItem(
                          icon: Icons.work,
                          title: "Smart Job\nMatching",
                        ),

                        FeatureItem(
                          icon: Icons.verified_user,
                          title: "Skill\nDevelopment",
                        ),
                      ],
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

// FEATURE WIDGET

class FeatureItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const FeatureItem({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: const Color(0xFFFFE4C5),

          child: Icon(icon, color: orange, size: 25),
        ),

        const SizedBox(height: 8),

        Text(
          title,
          textAlign: TextAlign.center,

          style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
