import 'package:flutter/material.dart';

import '../models/job.dart';
import '../theme/app_theme.dart';
import 'app_card.dart';

class JobCard extends StatelessWidget {
  const JobCard({required this.job, required this.onTap, super.key});

  final Job job;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  job.title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Chip(label: Text('${job.matchPercent}% match')),
            ],
          ),
          Text(job.company, style: const TextStyle(color: AppColors.muted)),
          const SizedBox(height: AppSpacing.md),
          Wrap(
            spacing: AppSpacing.md,
            runSpacing: AppSpacing.sm,
            children: [
              _Meta(icon: Icons.location_on_outlined, text: job.location),
              _Meta(icon: Icons.currency_rupee, text: job.pay),
              _Meta(icon: Icons.near_me_outlined, text: job.distance),
            ],
          ),
        ],
      ),
    );
  }
}

class _Meta extends StatelessWidget {
  const _Meta({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) => Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(icon, size: 17, color: AppColors.primary),
      const SizedBox(width: 4),
      Text(text),
    ],
  );
}
