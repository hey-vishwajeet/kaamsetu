import 'package:flutter/material.dart';

import '../../routes/app_routes.dart';
import '../../routes/route_arguments.dart';
import '../../theme/app_theme.dart';
import '../../widgets/app_app_bar.dart';
import '../../widgets/app_buttons.dart';
import '../../widgets/app_fields.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({required this.phone, super.key});
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

  void _verify() {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRoutes.registration,
      (route) => false,
      arguments: RegistrationArguments(phone: widget.phone),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KaamSetuAppBar(title: 'Verify number'),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 480),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Enter your OTP',
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    Text(
                      'Sent to +91 ${widget.phone}',
                      style: const TextStyle(color: AppColors.muted),
                    ),
                    const SizedBox(height: AppSpacing.xl),
                    AppTextField(
                      controller: _otpController,
                      label: '6-digit OTP',
                      hint: '123456',
                      keyboardType: TextInputType.number,
                      prefixIcon: Icons.lock_outline,
                      maxLength: 6,
                      obscureText: true,
                      validator: (value) => value == '123456'
                          ? null
                          : 'Use the prototype OTP 123456.',
                    ),
                    const SizedBox(height: AppSpacing.md),
                    AppPrimaryButton(
                      label: 'Verify and continue',
                      onPressed: _verify,
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Change mobile number'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
