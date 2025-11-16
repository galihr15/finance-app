import 'package:flutter/material.dart';

class CardChip extends StatelessWidget {
  final double width;
  final double height;
  const CardChip({super.key, this.width = 36, this.height = 28});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFDAA520), Color(0xFFF0CF6C)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.12), blurRadius: 4, offset: const Offset(0,2)),
        ],
      ),
      child: CustomPaint(
        painter: _ChipPainter(),
        size: Size(width, height),
      ),
    );
  }
}

class _ChipPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double w = size.width;
    final double h = size.height;

    final Paint darkPaint = Paint()
      ..color = const Color(0xFF9A6B00).withOpacity(0.9)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.8;

    final Paint innerPaint = Paint()
      ..color = const Color(0xFF9A6B00).withOpacity(0.12)
      ..style = PaintingStyle.fill;

    // inner rounded rect to give chip grooves
    final RRect inner = RRect.fromRectAndRadius(Rect.fromLTWH(2.5, 2.5, w - 5, h - 5), const Radius.circular(4));
    canvas.drawRRect(inner, innerPaint);

    // vertical groove lines
    final double x1 = w * 0.28;
    final double x2 = w * 0.5;
    final double x3 = w * 0.72;
    canvas.drawLine(Offset(x1, 4), Offset(x1, h - 4), darkPaint);
    canvas.drawLine(Offset(x2, 4), Offset(x2, h - 4), darkPaint);
    canvas.drawLine(Offset(x3, 4), Offset(x3, h - 4), darkPaint);

    // horizontal center line
    canvas.drawLine(Offset(4, h * 0.5), Offset(w - 4, h * 0.5), darkPaint);

    // small center rounded rectangle representing contact
    final double cw = w * 0.28;
    final double ch = h * 0.36;
    final RRect centerRect = RRect.fromRectAndRadius(
      Rect.fromCenter(center: Offset(w * 0.5, h * 0.5), width: cw, height: ch),
      const Radius.circular(2),
    );
    canvas.drawRRect(centerRect, darkPaint..style = PaintingStyle.stroke..strokeWidth = 1.2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
