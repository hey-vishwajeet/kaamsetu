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
    if (!(_formKey.currentState?.validate() ?? false)) return;
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
    Navigator.pushNamed(
      context,
      AppRoutes.profileReview,
      arguments: ProfileArguments(profile),
    );
  }

  @override
  Widget build(BuildContext context) {
    final editing = widget.initialProfile != null;
    return Scaffold(
      appBar: KaamSetuAppBar(
        title: editing ? 'Edit profile' : 'Worker registration',
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 600),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      editing
                          ? 'Update your work details'
                          : 'Tell us about your work',
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(height: AppSpacing.lg),
                    AppTextField(
                      controller: _nameController,
                      label: 'Full name',
                      prefixIcon: Icons.person_outline,
                      validator: (value) => (value?.trim().length ?? 0) < 3
                          ? 'Enter your full name.'
                          : null,
                    ),
                    const SizedBox(height: AppSpacing.md),
                    DropdownButtonFormField<String>(
                      initialValue: _trade,
                      decoration: const InputDecoration(
                        labelText: 'Primary trade',
                        prefixIcon: Icon(Icons.handyman_outlined),
                      ),
                      items: MockData.trades
                          .map(
                            (trade) => DropdownMenuItem(
                              value: trade,
                              child: Text(trade),
                            ),
                          )
                          .toList(),
                      onChanged: (value) =>
                          setState(() => _trade = value ?? _trade),
                    ),
                    const SizedBox(height: AppSpacing.md),
                    AppTextField(
                      controller: _locationController,
                      label: 'City or work area',
                      prefixIcon: Icons.location_on_outlined,
                      validator: (value) => (value?.trim().isEmpty ?? true)
                          ? 'Enter your location.'
                          : null,
                    ),
                    const SizedBox(height: AppSpacing.md),
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
                    const SizedBox(height: AppSpacing.lg),
                    AppPrimaryButton(
                      label: editing ? 'Save changes' : 'Review profile',
                      onPressed: _save,
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
