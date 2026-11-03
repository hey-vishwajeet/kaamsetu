import 'package:flutter/material.dart';
import '../../models/worker_profile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    required this.profile,
    required this.onEdit,
    required this.onLogout,
    super.key,
  });

  final WorkerProfile profile;
  final VoidCallback onEdit;
  final VoidCallback onLogout;

  // KaamSetu Theme
  static const Color backgroundColor = Color(0xFFFAF3E8);
  static const Color primaryColor = Color(0xFFEF791B);
  static const Color headingColor = Color(0xFF17243A);
  static const Color borderColor = Color(0xFFEADFD3);
  static const Color lightOrange = Color(0xFFFFEAD8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,

      // App Bar
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        automaticallyImplyLeading: false,

        title: const Text(
          'My Profile',
          style: TextStyle(
            color: Colors.white,
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),

        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),

        actions: [
          IconButton(
            icon: const Icon(Icons.home_rounded, color: Colors.white, size: 27),
            onPressed: () {
              Navigator.popUntil(context, (route) => route.isFirst);
            },
          ),
          const SizedBox(width: 10),
        ],
      ),

      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),

          children: [
            // PROFILE HEADER
            Container(
              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
                border: Border.all(color: borderColor),
              ),

              child: Row(
                children: [
                  // Profile Avatar
                  const CircleAvatar(
                    radius: 43,
                    backgroundColor: lightOrange,
                    child: Icon(Icons.person, color: primaryColor, size: 55),
                  ),

                  const SizedBox(width: 18),

                  // Profile Name and Trade
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          profile.fullName,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: headingColor,
                          ),
                        ),

                        const SizedBox(height: 10),

                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 8,
                          ),

                          decoration: BoxDecoration(
                            color: lightOrange,
                            borderRadius: BorderRadius.circular(25),
                          ),

                          child: Text(
                            profile.trade,
                            style: const TextStyle(
                              color: Color(0xFFB9430A),
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        const SizedBox(height: 12),

                        const Text(
                          'Welcome to your KaamSetu profile',
                          style: TextStyle(color: Colors.black54, fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // PERSONAL INFORMATION
            _sectionTitle('Personal Information'),

            const SizedBox(height: 15),

            Container(
              padding: const EdgeInsets.all(18),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
                border: Border.all(color: borderColor),
              ),

              child: Column(
                children: [
                  _profileItem(
                    Icons.phone,
                    'Mobile Number',
                    '+91 ${profile.phone}',
                  ),

                  _divider(),

                  _profileItem(Icons.location_on, 'Location', profile.location),

                  _divider(),

                  _profileItem(
                    Icons.work,
                    'Experience',
                    '${profile.experienceYears} years',
                  ),

                  _divider(),

                  _profileItem(
                    Icons.emoji_events,
                    'Assessment Score',
                    '${profile.assessmentScore ?? 0}%',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // MY SKILLS
            _sectionTitle('My Skills'),

            const SizedBox(height: 15),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
                border: Border.all(color: borderColor),
              ),

              child: profile.skills.isEmpty
                  ? const Text(
                      'No skills added yet.',
                      style: TextStyle(color: Colors.black54),
                    )
                  : Wrap(
                      spacing: 10,
                      runSpacing: 12,

                      children: profile.skills.map((skill) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 17,
                            vertical: 10,
                          ),

                          decoration: BoxDecoration(
                            color: lightOrange,
                            borderRadius: BorderRadius.circular(25),
                          ),

                          child: Text(
                            skill,
                            style: const TextStyle(
                              color: Color(0xFFB9430A),
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
            ),

            const SizedBox(height: 30),

            // EDIT PROFILE BUTTON
            SizedBox(
              height: 58,
              child: ElevatedButton.icon(
                onPressed: onEdit,
                icon: const Icon(Icons.edit, color: Colors.white),
                label: const Text(
                  'Edit Profile',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 15),

            // LOGOUT BUTTON
            SizedBox(
              height: 58,
              child: OutlinedButton.icon(
                onPressed: onLogout,

                icon: const Icon(Icons.logout_rounded, color: primaryColor),

                label: const Text(
                  'Log Out',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: headingColor,
                  ),
                ),

                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: primaryColor, width: 2),

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // FOOTER
            const Text(
              'KaamSetu - Connecting Skills with Opportunities',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black54,
                fontSize: 12,
                fontStyle: FontStyle.italic,
              ),
            ),

            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }

  // SECTION TITLE
  Widget _sectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 23,
        fontWeight: FontWeight.bold,
        color: headingColor,
      ),
    );
  }

  // PROFILE INFORMATION ITEM
  Widget _profileItem(IconData icon, String title, String value) {
    return Row(
      children: [
        Container(
          height: 55,
          width: 55,

          decoration: BoxDecoration(
            color: lightOrange,
            borderRadius: BorderRadius.circular(16),
          ),

          child: Icon(icon, color: primaryColor, size: 27),
        ),

        const SizedBox(width: 18),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(color: Colors.black54, fontSize: 14),
              ),

              const SizedBox(height: 5),

              Text(
                value,
                style: const TextStyle(
                  color: headingColor,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // DIVIDER
  Widget _divider() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 13),
      child: Divider(color: borderColor, thickness: 1),
    );
  }
}
