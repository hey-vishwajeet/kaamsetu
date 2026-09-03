import 'package:flutter/material.dart';

import '../../models/job.dart';
import '../../models/job_application.dart';
import '../../routes/app_routes.dart';
import '../../routes/route_arguments.dart';
import '../../theme/app_theme.dart';
import '../../widgets/app_app_bar.dart';
import '../../widgets/app_buttons.dart';
import '../../widgets/app_card.dart';

class JobDetailsScreen extends StatefulWidget {
  const JobDetailsScreen({
    required this.job,
    required this.isApplied,
    required this.onApply,
    super.key,
  });

  final Job job;
  final bool isApplied;
  final JobApplication Function(Job) onApply;

  @override
  State<JobDetailsScreen> createState() => _JobDetailsScreenState();
}

class _JobDetailsScreenState extends State<JobDetailsScreen> {
  late bool _isApplied = widget.isApplied;

  void _apply() {
    if (_isApplied) return;
    final application = widget.onApply(widget.job);
    setState(() => _isApplied = true);
    Navigator.pushReplacementNamed(
      context,
      AppRoutes.applicationDetails,
      arguments: ApplicationDetailsArguments(application),
    );
  }

  @override
  Widget build(BuildContext context) {
    final job = widget.job;
    return Scaffold(
      appBar: const KaamSetuAppBar(title: 'Job details'),
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.all(AppSpacing.md),
        child: AppPrimaryButton(
          label: _isApplied ? 'Application submitted' : 'Apply for this job',
          icon: _isApplied ? Icons.check_circle : Icons.send,
          onPressed: _isApplied ? null : _apply,
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(AppSpacing.md),
          children: [
            Text(
              job.title,
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              job.company,
              style: const TextStyle(color: AppColors.muted, fontSize: 16),
            ),
            const SizedBox(height: AppSpacing.lg),
            AppCard(
              child: Column(
                children: [
                  _Detail(
                    icon: Icons.location_on_outlined,
                    label: 'Location',
                    value: job.location,
                  ),
                  _Detail(
                    icon: Icons.currency_rupee,
                    label: 'Pay',
                    value: job.pay,
                  ),
                  _Detail(
                    icon: Icons.near_me_outlined,
                    label: 'Distance',
                    value: job.distance,
                  ),
                  _Detail(
                    icon: Icons.auto_awesome,
                    label: 'Profile match',
                    value: '${job.matchPercent}%',
                    showDivider: false,
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            Text(
              'About the job',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(job.description),
            const SizedBox(height: AppSpacing.lg),
            Text(
              'Skills needed',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: AppSpacing.sm),
            Wrap(
              spacing: AppSpacing.sm,
              children: job.skills
                  .map((skill) => Chip(label: Text(skill)))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class _Detail extends StatelessWidget {
  const _Detail({
    required this.icon,
    required this.label,
    required this.value,
    this.showDivider = true,
  });
  final IconData icon;
  final String label;
  final String value;
  final bool showDivider;

  @override
  Widget build(BuildContext context) => Column(
    children: [
      ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Icon(icon, color: AppColors.primary),
        title: Text(label),
        trailing: Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      if (showDivider) const Divider(),
    ],
  );
}
