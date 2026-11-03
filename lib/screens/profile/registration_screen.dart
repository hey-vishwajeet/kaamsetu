import 'package:flutter/material.dart';

import '../../mock_data/mock_data.dart';
import '../../models/worker_profile.dart';
import '../../routes/app_routes.dart';
import '../../routes/route_arguments.dart';
import '../../theme/app_theme.dart';
import '../../widgets/app_app_bar.dart';
import '../../widgets/app_buttons.dart';
import '../../widgets/app_fields.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({
    required this.phone,
    this.initialProfile,
    this.onSaved,
    super.key,
  });

  final String phone;
  final WorkerProfile? initialProfile;
  final ValueChanged<WorkerProfile>? onSaved;

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _nameController;
  late final TextEditingController _locationController;
  late final TextEditingController _experienceController;

  late String _trade;

  // Login screen theme colours
  static const Color backgroundColor = Color(0xFFFAF3E8);
  static const Color primaryColor = Color(0xFFEF791B);
  static const Color headingColor = Color(0xFF17243A);
  static const Color borderColor = Color(0xFFEADFD3);

  @override
  void initState() {
    super.initState();

    final profile = widget.initialProfile;

    _nameController = TextEditingController(text: profile?.fullName);

    _locationController = TextEditingController(text: profile?.location);

    _experienceController = TextEditingController(
      text: profile?.experienceYears.toString(),
    );

    _trade = profile?.trade ?? MockData.trades.first;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _locationController.dispose();
    _experienceController.dispose();
    super.dispose();
  }

  void _save() {
    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    }

    final profile = WorkerProfile(
      phone: widget.phone,
      fullName: _nameController.text.trim(),
      trade: _trade,
      location: _locationController.text.trim(),
      experienceYears: int.parse(_experienceController.text),
      skills: widget.initialProfile?.skills ?? const [],
      assessmentScore: widget.initialProfile?.assessmentScore,
    );

    if (widget.onSaved != null) {
      widget.onSaved!(profile);
      Navigator.pop(context);
      return;
    }

    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRoutes.home,
      (route) => false,
      arguments: ProfileArguments(profile),
    );
  }

  @override
  Widget build(BuildContext context) {
    final editing = widget.initialProfile != null;

    return Scaffold(
      backgroundColor: backgroundColor,

      appBar: KaamSetuAppBar(
        title: editing ? 'Edit profile' : 'Worker registration',
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),

          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 600),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Header Section

                  const Icon(
                    Icons.person_add_alt_1_rounded,
                    size: 42,
                    color: primaryColor,
                  ),

                  const SizedBox(height: 15),

                  Text(
                    editing ? 'Update Your Profile' : 'Create Your Profile',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: headingColor,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    editing
                        ? 'Keep your work information up to date.'
                        : 'Tell us about yourself and your work.',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 14, color: Colors.black54),
                  ),

                  const SizedBox(height: 25),

                  // Registration Form Card
                  Container(
                    padding: const EdgeInsets.all(20),

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: borderColor),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.04),
                          blurRadius: 15,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),

                    child: Form(
                      key: _formKey,

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,

                        children: [
                          // Full Name

                          AppTextField(
                            controller: _nameController,
                            label: 'Full name',
                            prefixIcon: Icons.person_outline_rounded,
                            validator: (value) =>
                                (value?.trim().length ?? 0) < 3
                                ? 'Enter your full name.'
                                : null,
                          ),

                          const SizedBox(height: 18),

                          // Primary Trade
                          DropdownButtonFormField<String>(
                            initialValue: _trade,

                            decoration: InputDecoration(
                              labelText: 'Primary trade',
                              prefixIcon: const Icon(
                                Icons.handyman_outlined,
                                color: primaryColor,
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: const BorderSide(
                                  color: borderColor,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: const BorderSide(
                                  color: borderColor,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: const BorderSide(
                                  color: primaryColor,
                                  width: 1.5,
                                ),
                              ),
                            ),

                            items: MockData.trades
                                .map(
                                  (trade) => DropdownMenuItem(
                                    value: trade,
                                    child: Text(trade),
                                  ),
                                )
                                .toList(),

                            onChanged: (value) {
                              setState(() {
                                _trade = value ?? _trade;
                              });
                            },
                          ),

                          const SizedBox(height: 18),

                          // Location
                          AppTextField(
                            controller: _locationController,
                            label: 'City or work area',
                            prefixIcon: Icons.location_on_outlined,
                            validator: (value) =>
                                (value?.trim().isEmpty ?? true)
                                ? 'Enter your location.'
                                : null,
                          ),

                          const SizedBox(height: 18),

                          // Experience
                          AppTextField(
                            controller: _experienceController,
                            label: 'Years of experience',
                            keyboardType: TextInputType.number,
                            prefixIcon: Icons.work_history_outlined,
                            validator: (value) {
                              final years = int.tryParse(value ?? '');

                              return years == null || years < 0 || years > 60
                                  ? 'Enter experience between 0 and 60 years.'
                                  : null;
                            },
                          ),

                          const SizedBox(height: 28),

                          // Submit Button
                          AppPrimaryButton(
                            label: editing ? 'Save Changes' : 'Add Profile',
                            onPressed: _save,
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Footer
                  const Text(
                    'KaamSetu - Connecting Skills with Opportunities',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, color: Colors.black45),
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
