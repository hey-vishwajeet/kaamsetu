import 'package:flutter/material.dart';

import '../../models/worker_profile.dart';
import '../../theme/app_theme.dart';
import '../../widgets/app_app_bar.dart';
import '../../widgets/app_buttons.dart';
import '../../widgets/app_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    required this.profile,
    required this.onEdit,
    required this.onLogout,
    super.key,
  });
  final WorkerProfile profile;
  final VoidCallback onEdit;
  final VoidCallback onLogout;

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
            Text(
              profile.trade,
              textAlign: TextAlign.center,
              style: const TextStyle(color: AppColors.muted),
            ),
            const SizedBox(height: AppSpacing.lg),
            AppCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(Icons.phone_outlined),
                    title: Text('+91 ${profile.phone}'),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(Icons.location_on_outlined),
                    title: Text(profile.location),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(Icons.work_history_outlined),
                    title: Text('${profile.experienceYears} years experience'),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(Icons.workspace_premium_outlined),
                    title: Text(
                      'Assessment score: ${profile.assessmentScore ?? 0}%',
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            Text(
              'Skills',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: AppSpacing.sm),
            Wrap(
              spacing: AppSpacing.sm,
              children: profile.skills
                  .map((skill) => Chip(label: Text(skill)))
                  .toList(),
            ),
            const SizedBox(height: AppSpacing.lg),
            AppPrimaryButton(
              label: 'Edit profile',
              icon: Icons.edit_outlined,
              onPressed: onEdit,
            ),
            const SizedBox(height: AppSpacing.sm),
            AppSecondaryButton(
              label: 'Log out',
              icon: Icons.logout,
              onPressed: onLogout,
            ),
          ],
        ),
      ),
    );
  }
}
