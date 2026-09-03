import 'package:flutter/material.dart';

import '../../mock_data/mock_data.dart';
import '../../models/worker_profile.dart';
import '../../routes/app_routes.dart';
import '../../routes/route_arguments.dart';
import '../../theme/app_theme.dart';
import '../../widgets/app_app_bar.dart';
import '../../widgets/app_buttons.dart';

class SkillSelectionScreen extends StatefulWidget {
  const SkillSelectionScreen({required this.profile, super.key});
  final WorkerProfile profile;

  @override
  State<SkillSelectionScreen> createState() => _SkillSelectionScreenState();
}

class _SkillSelectionScreenState extends State<SkillSelectionScreen> {
  late final Set<String> _selected = widget.profile.skills.toSet();

  void _continue() {
    if (_selected.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Choose at least one skill.')),
      );
      return;
    }
    Navigator.pushNamed(
      context,
      AppRoutes.skillAssessment,
      arguments: ProfileArguments(
        widget.profile.copyWith(skills: _selected.toList()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KaamSetuAppBar(title: 'Skill selection'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'What can you do?',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              const Text(
                'Select every skill you can confidently use on site.',
                style: TextStyle(color: AppColors.muted),
              ),
              const SizedBox(height: AppSpacing.lg),
              Expanded(
                child: SingleChildScrollView(
                  child: Wrap(
                    spacing: AppSpacing.sm,
                    runSpacing: AppSpacing.sm,
                    children: MockData.skills.map((skill) {
                      return FilterChip(
                        label: Text(skill),
                        selected: _selected.contains(skill),
                        onSelected: (selected) => setState(
                          () => selected
                              ? _selected.add(skill)
                              : _selected.remove(skill),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              AppPrimaryButton(label: 'Start assessment', onPressed: _continue),
            ],
          ),
        ),
      ),
    );
  }
}
