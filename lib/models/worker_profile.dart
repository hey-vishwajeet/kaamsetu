class WorkerProfile {
  const WorkerProfile({
    required this.phone,
    required this.fullName,
    required this.trade,
    required this.location,
    required this.experienceYears,
    this.skills = const [],
    this.assessmentScore,
  });

  final String phone;
  final String fullName;
  final String trade;
  final String location;
  final int experienceYears;
  final List<String> skills;
  final int? assessmentScore;

  String get firstName => fullName.trim().split(' ').first;

  WorkerProfile copyWith({
    String? phone,
    String? fullName,
    String? trade,
    String? location,
    int? experienceYears,
    List<String>? skills,
    int? assessmentScore,
  }) {
    return WorkerProfile(
      phone: phone ?? this.phone,
      fullName: fullName ?? this.fullName,
      trade: trade ?? this.trade,
      location: location ?? this.location,
      experienceYears: experienceYears ?? this.experienceYears,
      skills: skills ?? this.skills,
      assessmentScore: assessmentScore ?? this.assessmentScore,
    );
  }
}
