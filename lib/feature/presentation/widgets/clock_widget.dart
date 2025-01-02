import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Clock extends StatefulWidget {
  final double width;
  final double height;

  const Clock({Key? key, required this.width, required this.height})
      : super(key: key);

  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // Обновляем часы каждую секунду
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: widget.width,
          height: widget.height,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFFF5EFEF),
            boxShadow: [
              BoxShadow(
                color: Color(0xABF4C27F),
                blurRadius: 12,
                spreadRadius: 6,
                offset: Offset(0, 4),
              ),
            ],
          ),
        ),
        CustomPaint(
          size: Size(widget.width,
              widget.height), // Используем ширину и высоту из конструктора
          painter: ClockPainter(),
        ),
        Container(
          width: widget.width * 0.083,
          height: widget.height * 0.083,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFFEEEEEE),
            boxShadow: [
              BoxShadow(
                color: Color(0x59000000),
                blurRadius: 4,
                spreadRadius: 0,
                offset: Offset(0, 4),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class ClockPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0;

    // Получаем текущее время
    final DateTime now = DateTime.now();
    final double hour = now.hour % 12 + now.minute / 60; // Часы
    final double minute = now.minute + now.second / 60; // Минуты
    final double second = now.second.toDouble();

    // Рисуем часовые метки
    for (int i = 0; i < 12; i += 3) {
      final double angle = (i * 30) * (pi / 180);
      final double x = size.width / 2 + (size.width / 2 - 20) * cos(angle);
      final double y = size.height / 2 + (size.height / 2 - 20) * sin(angle);

      final textPainter = TextPainter(
        text: TextSpan(
          text: i == 0 ? '3' : (i + 3).toString(),
          style: GoogleFonts.poppins(
            fontSize: size.width * 0.1,
            fontWeight: FontWeight.w700,
            color: const Color(0xFFF4C27F),
          ),
        ),
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      final Offset textOffset = Offset(
        x - textPainter.width / 2,
        y - textPainter.height / 2,
      );
      textPainter.paint(canvas, textOffset);
    }

    // Рисуем стрелки
    _drawHand(canvas, size, hour * 30, size.width / 2 * 0.54,
        size.width / 2 * 0.033, Color(0xFFD8605B)); // Часовая стрелка
    _drawHand(canvas, size, minute * 6, size.width / 2 * 0.63,
        size.width / 2 * 0.029, Color(0xFFF4C27F)); // Минутная стрелка
    _drawHand(canvas, size, second * 6, size.width / 2 * 0.75,
        size.width / 2 * 0.023, Color(0xFFC1C0C0)); // Секундная стрелка
  }

  void _drawHand(Canvas canvas, Size size, double angle, double length,
      double strokeWidth, Color color) {
    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    angle -= 90;
    final double x = size.width / 2 + cos((pi * angle) / 180) * length;
    final double y = size.height / 2 + sin((pi * angle) / 180) * length;
    final Path path = Path()
      ..moveTo(size.center(Offset.zero).dx, size.center(Offset.zero).dy)
      ..lineTo(x, y);
    //canvas.drawLine(size.center(Offset.zero), Offset(x, y), paint);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // Перерисовываем каждый раз
  }
}
