import 'package:flutter/foundation.dart';

import '../models/job.dart';
import '../models/job_application.dart';
import '../models/worker_profile.dart';

class OtpArguments {
  const OtpArguments(this.phone);
  final String phone;
}

class RegistrationArguments {
  const RegistrationArguments({
    required this.phone,
    this.initialProfile,
    this.onSaved,
  });
  final String phone;
  final WorkerProfile? initialProfile;
  final ValueChanged<WorkerProfile>? onSaved;
}

class ProfileArguments {
  const ProfileArguments(this.profile);
  final WorkerProfile profile;
}

class JobDetailsArguments {
  const JobDetailsArguments({
    required this.job,
    required this.isApplied,
    required this.onApply,
  });
  final Job job;
  final bool isApplied;
  final JobApplication Function(Job) onApply;
}

class ApplicationDetailsArguments {
  const ApplicationDetailsArguments(this.application);
  final JobApplication application;
}
