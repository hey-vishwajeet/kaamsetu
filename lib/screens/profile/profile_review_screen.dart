import 'package:flutter/material.dart';

import '../../models/worker_profile.dart';
import '../../routes/app_routes.dart';
import '../../routes/route_arguments.dart';
import '../../theme/app_theme.dart';
import '../../widgets/app_app_bar.dart';
import '../../widgets/app_buttons.dart';
import '../../widgets/app_card.dart';

class ProfileReviewScreen extends StatelessWidget {
  const ProfileReviewScreen({required this.profile, super.key});
  final WorkerProfile profile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KaamSetuAppBar(title: 'Profile'),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(AppSpacing.md),
          children: [
            const CircleAvatar(radius: 42, child: Icon(Icons.person, size: 42)),
            const SizedBox(height: AppSpacing.md),
            Text(
              profile.fullName,
              textAlign: TextAlign.center,
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: AppSpacing.lg),
            AppCard(
              child: Column(
                children: [
                  _Detail(label: 'Mobile', value: '+91 ${profile.phone}'),
                  _Detail(label: 'Trade', value: profile.trade),
                  _Detail(label: 'Location', value: profile.location),
                  _Detail(
                    label: 'Experience',
                    value: '${profile.experienceYears} years',
                    showDivider: false,
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            AppPrimaryButton(
              label: 'Choose skills',
              onPressed: () => Navigator.pushNamed(
                context,
                AppRoutes.skillSelection,
                arguments: ProfileArguments(profile),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Detail extends StatelessWidget {
  const _Detail({
    required this.label,
    required this.value,
    this.showDivider = true,
  });
  final String label;
  final String value;
  final bool showDivider;

  @override
  Widget build(BuildContext context) => Column(
    children: [
      ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(label),
        trailing: Flexible(
          child: Text(
            value,
            textAlign: TextAlign.right,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
      ),
      if (showDivider) const Divider(),
    ],
  );
}
