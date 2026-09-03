import 'job.dart';

class JobApplication {
  const JobApplication({
    required this.id,
    required this.job,
    required this.status,
    required this.appliedAt,
  });

  final String id;
  final Job job;
  final String status;
  final DateTime appliedAt;
}
