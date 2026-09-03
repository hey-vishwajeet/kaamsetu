import '../models/app_notification.dart';
import '../models/job.dart';

abstract final class MockData {
  static const trades = <String>[
    'Mason',
    'Electrician',
    'Plumber',
    'Carpenter',
    'Painter',
    'Helper',
  ];

  static const skills = <String>[
    'Brickwork',
    'Plastering',
    'Tiling',
    'Wiring',
    'Pipe fitting',
    'Woodwork',
    'Painting',
    'Site safety',
  ];

  static const jobs = <Job>[
    Job(
      id: 'job-1',
      title: 'Residential Site Mason',
      company: 'Shree Buildcon',
      trade: 'Mason',
      location: 'Wakad, Pune',
      pay: '₹900/day',
      distance: '3.2 km',
      matchPercent: 94,
      description:
          'Brickwork and plastering for a residential project. Safety equipment and drinking water are provided on site.',
      skills: ['Brickwork', 'Plastering', 'Site safety'],
    ),
    Job(
      id: 'job-2',
      title: 'Commercial Electrician',
      company: 'Metro InfraWorks',
      trade: 'Electrician',
      location: 'Hinjewadi, Pune',
      pay: '₹1,100/day',
      distance: '6.8 km',
      matchPercent: 87,
      description:
          'Install conduits, route cables, and assist with panel connections at a commercial site.',
      skills: ['Wiring', 'Site safety'],
    ),
    Job(
      id: 'job-3',
      title: 'Plumbing Technician',
      company: 'Nirman Projects',
      trade: 'Plumber',
      location: 'Baner, Pune',
      pay: '₹1,000/day',
      distance: '8.1 km',
      matchPercent: 82,
      description:
          'Fit water lines and bathroom fixtures in newly constructed apartments.',
      skills: ['Pipe fitting', 'Site safety'],
    ),
  ];

  static const notifications = <AppNotification>[
    AppNotification(
      id: 'welcome',
      title: 'Welcome to KaamSetu',
      message: 'Your profile is ready. Explore jobs matched to your skills.',
    ),
  ];
}
