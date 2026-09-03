import 'package:flutter/material.dart';

import '../../mock_data/mock_data.dart';
import '../../models/job.dart';
import '../../models/worker_profile.dart';
import '../../theme/app_theme.dart';
import '../../widgets/app_app_bar.dart';
import '../../widgets/job_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({required this.profile, required this.onOpenJob, super.key});

  final WorkerProfile profile;
  final ValueChanged<Job> onOpenJob;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _query = '';

  @override
  Widget build(BuildContext context) {
    final jobs = MockData.jobs.where((job) {
      final query = _query.toLowerCase();
      return job.title.toLowerCase().contains(query) ||
          job.trade.toLowerCase().contains(query) ||
          job.location.toLowerCase().contains(query);
    }).toList();

    return Scaffold(
      appBar: const KaamSetuAppBar(title: 'KaamSetu'),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(AppSpacing.md),
          children: [
            Text(
              'Namaste, ${widget.profile.firstName}!',
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: AppSpacing.xs),
            const Text(
              'Jobs selected for your skills and area.',
              style: TextStyle(color: AppColors.muted),
            ),
            const SizedBox(height: AppSpacing.lg),
            TextField(
              decoration: const InputDecoration(
                hintText: 'Search jobs, trades, or locations',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) => setState(() => _query = value),
            ),
            const SizedBox(height: AppSpacing.lg),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Recommended jobs',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                Text(
                  '${jobs.length} found',
                  style: const TextStyle(color: AppColors.muted),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.md),
            if (jobs.isEmpty)
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 64),
                child: Center(child: Text('No jobs match your search.')),
              )
            else
              ...jobs.map(
                (job) => Padding(
                  padding: const EdgeInsets.only(bottom: AppSpacing.md),
                  child: JobCard(job: job, onTap: () => widget.onOpenJob(job)),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
