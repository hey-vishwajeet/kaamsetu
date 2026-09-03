class Job {
  const Job({
    required this.id,
    required this.title,
    required this.company,
    required this.trade,
    required this.location,
    required this.pay,
    required this.distance,
    required this.matchPercent,
    required this.description,
    required this.skills,
  });

  final String id;
  final String title;
  final String company;
  final String trade;
  final String location;
  final String pay;
  final String distance;
  final int matchPercent;
  final String description;
  final List<String> skills;
}
