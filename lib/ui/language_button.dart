import 'package:material_ui/material_ui.dart';

class LanguageButton extends StatelessWidget {
  final bool english;
  final VoidCallback onPressed;
  const LanguageButton({
    super.key,
    required this.english,
    required this.onPressed,
  });
  @override
  Widget build(BuildContext context) => IconButton(
    tooltip: english ? 'Mudar para português' : 'Switch to English',
    onPressed: onPressed,
    icon: ClipOval(
      child: CustomPaint(size: const Size(28, 28), painter: _Flag(!english)),
    ),
  );
}

class _Flag extends CustomPainter {
  final bool brazil;
  _Flag(this.brazil);
  @override
  void paint(Canvas canvas, Size size) {
    final r = Offset.zero & size;
    final p = Paint()..color = Color(brazil ? 0xff167343 : 0xff163667);
    canvas.drawRect(r, p);
    if (brazil) {
      p.color = const Color(0xffffd54b);
      canvas.drawPath(
        Path()
          ..moveTo(14, 4)
          ..lineTo(26, 14)
          ..lineTo(14, 24)
          ..lineTo(2, 14)
          ..close(),
        p,
      );
      canvas.drawCircle(
        const Offset(14, 14),
        6,
        p..color = const Color(0xff163667),
      );
      canvas.drawLine(
        const Offset(9, 12),
        const Offset(19, 16),
        p
          ..color = Colors.white
          ..strokeWidth = 1.5,
      );
    } else {
      for (final color in [Colors.white, const Color(0xffcf3048)]) {
        p
          ..color = color
          ..strokeWidth = (color == Colors.white ? 6 : 2);
        canvas.drawLine(Offset.zero, const Offset(28, 28), p);
        canvas.drawLine(const Offset(28, 0), const Offset(0, 28), p);
      }
      canvas.drawRect(
        const Rect.fromLTWH(10, 0, 8, 28),
        p..color = Colors.white,
      );
      canvas.drawRect(const Rect.fromLTWH(0, 10, 28, 8), p);
      canvas.drawRect(
        const Rect.fromLTWH(12, 0, 4, 28),
        p..color = const Color(0xffcf3048),
      );
      canvas.drawRect(const Rect.fromLTWH(0, 12, 28, 4), p);
    }
  }

  @override
  bool shouldRepaint(_Flag oldDelegate) => brazil != oldDelegate.brazil;
}
