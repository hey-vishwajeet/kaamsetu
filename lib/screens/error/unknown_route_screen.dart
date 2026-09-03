import 'package:flutter/material.dart';

import '../../routes/app_routes.dart';
import '../../widgets/app_feedback.dart';

class UnknownRouteScreen extends StatelessWidget {
  const UnknownRouteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppStateView(
        icon: Icons.explore_off_outlined,
        title: 'Page not found',
        message: 'This page is unavailable or its link is invalid.',
        actionLabel: 'Back to start',
        onAction: () => Navigator.pushNamedAndRemoveUntil(
          context,
          AppRoutes.login,
          (route) => false,
        ),
      ),
    );
  }
}
