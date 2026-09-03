import 'package:flutter/material.dart';

import '../../models/job_application.dart';
import '../../theme/app_theme.dart';
import '../../widgets/app_app_bar.dart';
import '../../widgets/app_card.dart';

class ApplicationDetailsScreen extends StatelessWidget {
  const ApplicationDetailsScreen({required this.application, super.key});
  final JobApplication application;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KaamSetuAppBar(title: 'Application status'),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(AppSpacing.md),
          children: [
            const Icon(Icons.check_circle, size: 72, color: AppColors.success),
            const SizedBox(height: AppSpacing.md),
            Text(
              'Application submitted',
              textAlign: TextAlign.center,
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: AppSpacing.sm),
            const Text(
              'The employer can now review your profile.',
              textAlign: TextAlign.center,
              style: TextStyle(color: AppColors.muted),
            ),
            const SizedBox(height: AppSpacing.lg),
            AppCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    application.job.title,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Text(application.job.company),
                  const Divider(height: 32),
                  const Text(
                    'Current status',
                    style: TextStyle(color: AppColors.muted),
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    application.status,
                    style: const TextStyle(
                      color: AppColors.success,
                      fontWeight: FontWeight.w800,
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
