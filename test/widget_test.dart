import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kaamsetu_worker/app.dart';
import 'package:kaamsetu_worker/models/worker_profile.dart';
import 'package:kaamsetu_worker/navigation/app_shell.dart';
import 'package:kaamsetu_worker/routes/app_router.dart';
import 'package:kaamsetu_worker/routes/app_routes.dart';
import 'package:kaamsetu_worker/theme/app_theme.dart';

void main() {
  const profile = WorkerProfile(
    phone: '9876543210',
    fullName: 'Ravi Kumar',
    trade: 'Mason',
    location: 'Pune',
    experienceYears: 5,
    skills: ['Brickwork', 'Site safety'],
    assessmentScore: 100,
  );

  testWidgets('splash opens the login screen', (tester) async {
    await tester.pumpWidget(const KaamSetuApp());
    expect(find.text('KaamSetu'), findsOneWidget);

    await tester.pump(const Duration(milliseconds: 1300));
    await tester.pumpAndSettle();
    expect(find.text('Find work that fits your skills'), findsOneWidget);
  });

  testWidgets('phone and OTP flow reaches registration', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.light,
        initialRoute: AppRoutes.login,
        onGenerateInitialRoutes: (_) => [
          AppRouter.onGenerateRoute(const RouteSettings(name: AppRoutes.login)),
        ],
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );

    await tester.enterText(find.byType(TextFormField), '9876543210');
    await tester.tap(find.text('Continue'));
    await tester.pumpAndSettle();
    expect(find.text('Enter your OTP'), findsOneWidget);

    await tester.enterText(find.byType(TextFormField), '123456');
    expect(
      tester.widget<TextFormField>(find.byType(TextFormField)).controller?.text,
      '123456',
    );
    final verifyButton = tester.widget<FilledButton>(
      find.widgetWithText(FilledButton, 'Verify and continue'),
    );
    verifyButton.onPressed!();
    await tester.pumpAndSettle();
    expect(find.text('Tell us about your work'), findsOneWidget);
  });

  testWidgets('bottom navigation and job application are reachable', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.light,
        onGenerateRoute: AppRouter.onGenerateRoute,
        home: const AppShell(initialProfile: profile),
      ),
    );

    expect(find.text('Recommended jobs'), findsOneWidget);
    await tester.tap(find.text('Applications'));
    await tester.pumpAndSettle();
    expect(find.text('No applications yet'), findsOneWidget);

    await tester.tap(find.text('Home'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Residential Site Mason'));
    await tester.pumpAndSettle();
    expect(find.text('About the job'), findsOneWidget);

    await tester.tap(find.text('Apply for this job'));
    await tester.pumpAndSettle();
    expect(find.text('Application submitted'), findsOneWidget);
    expect(find.text('Under review'), findsOneWidget);
  });

  testWidgets('unknown routes fail safely', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.light,
        onGenerateRoute: AppRouter.onGenerateRoute,
        home: Builder(
          builder: (context) => TextButton(
            onPressed: () => Navigator.pushNamed(context, '/not-a-real-page'),
            child: const Text('Open missing page'),
          ),
        ),
      ),
    );

    await tester.tap(find.text('Open missing page'));
    await tester.pumpAndSettle();
    expect(find.text('Page not found'), findsOneWidget);
  });
}
