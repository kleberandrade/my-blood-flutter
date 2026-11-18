import 'package:material_ui/material_ui.dart';

Widget sectionHeading(String title, String subtitle) => Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text(
      title,
      style: const TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w800,
        letterSpacing: -1,
      ),
    ),
    const SizedBox(height: 10),
    Text(
      subtitle,
      style: const TextStyle(
        fontSize: 15,
        color: Color(0xff71656a),
        height: 1.5,
      ),
    ),
    const SizedBox(height: 24),
  ],
);
