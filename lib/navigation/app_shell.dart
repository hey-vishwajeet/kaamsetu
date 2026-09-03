import 'package:flutter/material.dart';

import '../mock_data/mock_data.dart';
import '../models/app_notification.dart';
import '../models/job.dart';
import '../models/job_application.dart';
import '../models/worker_profile.dart';
import '../routes/app_routes.dart';
import '../routes/route_arguments.dart';
import '../screens/applications/applications_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/notifications/notifications_screen.dart';
import '../screens/profile/profile_screen.dart';
import '../widgets/app_navigation_bar.dart';

class AppShell extends StatefulWidget {
  const AppShell({required this.initialProfile, super.key});
  final WorkerProfile initialProfile;

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  int _index = 0;
  late WorkerProfile _profile = widget.initialProfile;
  final List<JobApplication> _applications = [];
  final List<AppNotification> _notifications = [...MockData.notifications];

  JobApplication _apply(Job job) {
    final existing = _applications
        .where((item) => item.job.id == job.id)
        .firstOrNull;
    if (existing != null) return existing;
    final application = JobApplication(
      id: 'application-${_applications.length + 1}',
      job: job,
      status: 'Under review',
      appliedAt: DateTime.now(),
    );
    setState(() {
      _applications.add(application);
      _notifications.insert(
        0,
        AppNotification(
          id: 'applied-${job.id}',
          title: 'Application submitted',
          message: 'Your application for ${job.title} is under review.',
        ),
      );
    });
    return application;
  }

  void _openJob(Job job) {
    Navigator.pushNamed(
      context,
      AppRoutes.jobDetails,
      arguments: JobDetailsArguments(
        job: job,
        isApplied: _applications.any((item) => item.job.id == job.id),
        onApply: _apply,
      ),
    );
  }

  void _openApplication(JobApplication application) {
    Navigator.pushNamed(
      context,
      AppRoutes.applicationDetails,
      arguments: ApplicationDetailsArguments(application),
    );
  }

  void _editProfile() {
    Navigator.pushNamed(
      context,
      AppRoutes.registration,
      arguments: RegistrationArguments(
        phone: _profile.phone,
        initialProfile: _profile,
        onSaved: (profile) => setState(() => _profile = profile),
      ),
    );
  }

  void _logout() {
    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRoutes.login,
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      HomeScreen(profile: _profile, onOpenJob: _openJob),
      ApplicationsScreen(applications: _applications, onOpen: _openApplication),
      NotificationsScreen(
        notifications: _notifications,
        onRead: (index) => setState(
          () => _notifications[index] = _notifications[index].copyWith(
            isRead: true,
          ),
        ),
      ),
      ProfileScreen(profile: _profile, onEdit: _editProfile, onLogout: _logout),
    ];
    return PopScope(
      canPop: _index == 0,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop && _index != 0) setState(() => _index = 0);
      },
      child: Scaffold(
        body: IndexedStack(index: _index, children: pages),
        bottomNavigationBar: AppBottomNavigation(
          selectedIndex: _index,
          onDestinationSelected: (index) => setState(() => _index = index),
        ),
      ),
    );
  }
}
