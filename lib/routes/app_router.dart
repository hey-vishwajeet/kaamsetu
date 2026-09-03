import 'package:flutter/material.dart';

import '../navigation/app_shell.dart';
import '../screens/applications/application_details_screen.dart';
import '../screens/auth/login_screen.dart';
import '../screens/auth/otp_screen.dart';
import '../screens/auth/splash_screen.dart';
import '../screens/error/unknown_route_screen.dart';
import '../screens/jobs/job_details_screen.dart';
import '../screens/profile/profile_review_screen.dart';
import '../screens/profile/registration_screen.dart';
import '../screens/skills/skill_assessment_screen.dart';
import '../screens/skills/skill_selection_screen.dart';
import 'app_routes.dart';
import 'route_arguments.dart';

abstract final class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    Widget page;
    switch (settings.name) {
      case AppRoutes.splash:
        page = const SplashScreen();
      case AppRoutes.login:
        page = const LoginScreen();
      case AppRoutes.otp:
        final args = settings.arguments;
        page = args is OtpArguments
            ? OtpScreen(phone: args.phone)
            : const UnknownRouteScreen();
      case AppRoutes.registration:
        final args = settings.arguments;
        page = args is RegistrationArguments
            ? RegistrationScreen(
                phone: args.phone,
                initialProfile: args.initialProfile,
                onSaved: args.onSaved,
              )
            : const UnknownRouteScreen();
      case AppRoutes.profileReview:
        final args = settings.arguments;
        page = args is ProfileArguments
            ? ProfileReviewScreen(profile: args.profile)
            : const UnknownRouteScreen();
      case AppRoutes.skillSelection:
        final args = settings.arguments;
        page = args is ProfileArguments
            ? SkillSelectionScreen(profile: args.profile)
            : const UnknownRouteScreen();
      case AppRoutes.skillAssessment:
        final args = settings.arguments;
        page = args is ProfileArguments
            ? SkillAssessmentScreen(profile: args.profile)
            : const UnknownRouteScreen();
      case AppRoutes.home:
        final args = settings.arguments;
        page = args is ProfileArguments
            ? AppShell(initialProfile: args.profile)
            : const UnknownRouteScreen();
      case AppRoutes.jobDetails:
        final args = settings.arguments;
        page = args is JobDetailsArguments
            ? JobDetailsScreen(
                job: args.job,
                isApplied: args.isApplied,
                onApply: args.onApply,
              )
            : const UnknownRouteScreen();
      case AppRoutes.applicationDetails:
        final args = settings.arguments;
        page = args is ApplicationDetailsArguments
            ? ApplicationDetailsScreen(application: args.application)
            : const UnknownRouteScreen();
      default:
        page = const UnknownRouteScreen();
    }
    return MaterialPageRoute<void>(builder: (_) => page, settings: settings);
  }
}
