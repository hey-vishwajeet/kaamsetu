import 'package:flutter/material.dart';

import '../../models/job_application.dart';
import '../../theme/app_theme.dart';
import '../../widgets/app_app_bar.dart';
import '../../widgets/app_card.dart';
import '../../widgets/app_feedback.dart';

class ApplicationsScreen extends StatelessWidget {
  const ApplicationsScreen({
    required this.applications,
    required this.onOpen,
    super.key,
  });
  final List<JobApplication> applications;
  final ValueChanged<JobApplication> onOpen;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KaamSetuAppBar(title: 'Applications'),
      body: applications.isEmpty
          ? const AppStateView(
              icon: Icons.assignment_outlined,
              title: 'No applications yet',
              message: 'Apply to a recommended job and track its status here.',
            )
          : ListView.separated(
              padding: const EdgeInsets.all(AppSpacing.md),
              itemCount: applications.length,
              separatorBuilder: (_, _) => const SizedBox(height: AppSpacing.md),
              itemBuilder: (context, index) {
                final application = applications[index];
                return AppCard(
                  onTap: () => onOpen(application),
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      application.job.title,
                      style: const TextStyle(fontWeight: FontWeight.w700),
                    ),
                    subtitle: Text(
                      '${application.job.company}\n${application.job.location}',
                    ),
                    isThreeLine: true,
                    trailing: Chip(label: Text(application.status)),
                  ),
                );
              },
            ),
    );
  }
}
