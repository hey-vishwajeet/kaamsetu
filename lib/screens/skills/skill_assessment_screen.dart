import 'package:flutter/material.dart';

import '../../models/worker_profile.dart';
import '../../routes/app_routes.dart';
import '../../routes/route_arguments.dart';
import '../../theme/app_theme.dart';
import '../../widgets/app_app_bar.dart';
import '../../widgets/app_buttons.dart';
import '../../widgets/app_card.dart';

class SkillAssessmentScreen extends StatefulWidget {
  const SkillAssessmentScreen({required this.profile, super.key});
  final WorkerProfile profile;

  @override
  State<SkillAssessmentScreen> createState() => _SkillAssessmentScreenState();
}

class _SkillAssessmentScreenState extends State<SkillAssessmentScreen> {
  int? _answer;
  static const _answers = [
    'Ignore it and continue',
    'Report it and make the area safe',
    'Wait for someone else',
    'Leave the site',
  ];

  void _finish() {
    if (_answer == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Select an answer to continue.')),
      );
      return;
    }
    final score = _answer == 1 ? 100 : 60;
    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRoutes.home,
      (route) => false,
      arguments: ProfileArguments(
        widget.profile.copyWith(assessmentScore: score),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KaamSetuAppBar(title: 'Skill assessment'),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(AppSpacing.md),
          children: [
            Text(
              'Quick site-safety check',
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: AppSpacing.sm),
            const Text(
              'Question 1 of 1',
              style: TextStyle(color: AppColors.muted),
            ),
            const SizedBox(height: AppSpacing.lg),
            const AppCard(
              child: Text(
                'You notice an exposed electrical cable near a wet work area. What should you do first?',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            ...List.generate(_answers.length, (index) {
              final selected = _answer == index;
              return Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                child: AppCard(
                  onTap: () => setState(() => _answer = index),
                  child: Row(
                    children: [
                      Icon(
                        selected
                            ? Icons.radio_button_checked
                            : Icons.radio_button_off,
                        color: selected ? AppColors.primary : AppColors.muted,
                      ),
                      const SizedBox(width: AppSpacing.md),
                      Expanded(child: Text(_answers[index])),
                    ],
                  ),
                ),
              );
            }),
            const SizedBox(height: AppSpacing.md),
            AppPrimaryButton(label: 'Finish assessment', onPressed: _finish),
          ],
        ),
      ),
    );
  }
}
