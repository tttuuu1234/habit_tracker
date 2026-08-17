import 'dart:math';

import 'package:flutter/material.dart';

/// スパークルアニメーション用のパーティクルデータ。
class _Particle {
  _Particle({
    required this.angle,
    required this.distance,
    required this.size,
    required this.color,
  });

  /// 放射角度（ラジアン）。
  final double angle;

  /// 中心からの最大移動距離。
  final double distance;

  /// パーティクルの最大半径。
  final double size;

  /// パーティクルの色。
  final Color color;
}

class ProgressRing extends StatefulWidget {
  const ProgressRing({
    super.key,
    required this.completed,
    required this.total,
    this.size = 160,
    this.strokeWidth = 12,
  });

  final int completed;
  final int total;
  final double size;
  final double strokeWidth;

  @override
  State<ProgressRing> createState() => _ProgressRingState();
}

class _ProgressRingState extends State<ProgressRing>
    with SingleTickerProviderStateMixin {
  late final AnimationController _sparkleController;
  List<_Particle> _particles = [];
  final _random = Random();

  /// リングアニメーション完了時にスパークルを発火するかどうか。
  bool _pendingSparkle = false;

  double get _progress =>
      widget.total == 0 ? 0.0 : widget.completed / widget.total;

  @override
  void initState() {
    super.initState();
    _sparkleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
  }

  @override
  void didUpdateWidget(covariant ProgressRing oldWidget) {
    super.didUpdateWidget(oldWidget);

    final oldProgress =
        oldWidget.total == 0 ? 0.0 : oldWidget.completed / oldWidget.total;
    final newProgress = _progress;

    if (oldProgress < 1.0 && newProgress >= 1.0) {
      _pendingSparkle = true;
    }
  }

  void _triggerSparkle() {
    const particleColors = [
      Colors.amber,
      Colors.white,
    ];
    final extraColors = [
      Colors.yellow.shade600,
      Colors.orange.shade300,
    ];
    final allColors = [...particleColors, ...extraColors];

    _particles = List.generate(12, (_) {
      return _Particle(
        angle: _random.nextDouble() * 2 * pi,
        distance: 8 + _random.nextDouble() * 16,
        size: 1.5 + _random.nextDouble() * 2.5,
        color: allColors[_random.nextInt(allColors.length)],
      );
    });

    _sparkleController.forward(from: 0);
  }

  @override
  void dispose() {
    _sparkleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final progress = _progress;

    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: progress),
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      onEnd: () {
        if (_pendingSparkle) {
          _pendingSparkle = false;
          _triggerSparkle();
        }
      },
      builder: (context, animatedProgress, child) {
        return SizedBox(
          width: widget.size,
          height: widget.size,
          child: Stack(
            children: [
              CustomPaint(
                size: Size(widget.size, widget.size),
                painter: _ProgressRingPainter(
                  progress: animatedProgress,
                  strokeWidth: widget.strokeWidth,
                  progressColor: Colors.green.shade700,
                  backgroundColor: Colors.grey.shade300,
                ),
              ),
              AnimatedBuilder(
                animation: _sparkleController,
                builder: (context, _) {
                  if (!_sparkleController.isAnimating &&
                      _sparkleController.status != AnimationStatus.completed) {
                    return const SizedBox.shrink();
                  }
                  return CustomPaint(
                    size: Size(widget.size, widget.size),
                    painter: _SparkleParticlePainter(
                      particles: _particles,
                      animationValue:
                          Curves.easeOut.transform(_sparkleController.value),
                      ringRadius: (widget.size - widget.strokeWidth) / 2,
                    ),
                  );
                },
              ),
              child!,
            ],
          ),
        );
      },
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '${widget.completed}/${widget.total}',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Text(
              '完了',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SparkleParticlePainter extends CustomPainter {
  _SparkleParticlePainter({
    required this.particles,
    required this.animationValue,
    required this.ringRadius,
  });

  final List<_Particle> particles;
  final double animationValue;
  final double ringRadius;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    // 12時位置（リング頂上）
    final origin = Offset(center.dx, center.dy - ringRadius);

    // 初期フラッシュ: 最初の30%で白い光がぼやけて消える
    if (animationValue < 0.3) {
      final flashProgress = animationValue / 0.3;
      final flashOpacity = 1.0 - flashProgress;
      final flashRadius = 4 + flashProgress * 12;

      final flashPaint = Paint()
        ..color = Colors.white.withValues(alpha: flashOpacity * 0.8)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6);

      canvas.drawCircle(origin, flashRadius, flashPaint);
    }

    // パーティクル描画
    for (final particle in particles) {
      final currentDistance = particle.distance * animationValue;
      final opacity = 1.0 - animationValue;
      final currentSize = particle.size * (1.0 - animationValue * 0.6);

      if (opacity <= 0 || currentSize <= 0) continue;

      final dx = cos(particle.angle) * currentDistance;
      final dy = sin(particle.angle) * currentDistance;
      final position = Offset(origin.dx + dx, origin.dy + dy);

      final paint = Paint()
        ..color = particle.color.withValues(alpha: opacity);

      canvas.drawCircle(position, currentSize, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _SparkleParticlePainter oldDelegate) {
    return oldDelegate.animationValue != animationValue;
  }
}

class _ProgressRingPainter extends CustomPainter {
  _ProgressRingPainter({
    required this.progress,
    required this.strokeWidth,
    required this.progressColor,
    required this.backgroundColor,
  });

  final double progress;
  final double strokeWidth;
  final Color progressColor;
  final Color backgroundColor;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;

    final backgroundPaint = Paint()
      ..color = backgroundColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, backgroundPaint);

    if (progress > 0) {
      final progressPaint = Paint()
        ..color = progressColor
        ..strokeWidth = strokeWidth
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round;

      final sweepAngle = 2 * pi * progress;

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        -pi / 2,
        sweepAngle,
        false,
        progressPaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _ProgressRingPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
