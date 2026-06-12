import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

/// The behavioral state of the [AiOrb].
enum AiOrbState {
  /// Slow, calm breathing glow — waiting for input.
  idle,

  /// Faster pulse with outward ripple rings — actively listening.
  listening,

  /// Rotating gradient / swirling core — processing a request.
  thinking,
}

/// A glowing, animated orb used as the centerpiece of the AI assistant
/// page. Designed to sit in the middle of the screen and communicate
/// state through motion alone.
///
/// - [AiOrbState.idle]: gentle breathing pulse, low intensity.
/// - [AiOrbState.listening]: faster pulse + expanding ripple rings.
/// - [AiOrbState.thinking]: rotating swirl gradient, higher energy.
class AiOrb extends StatefulWidget {
  final AiOrbState state;

  /// Diameter of the orb's core (ripples extend beyond this).
  final double size;

  const AiOrb({super.key, required this.state, this.size = 160});

  @override
  State<AiOrb> createState() => _AiOrbState();
}

class _AiOrbState extends State<AiOrb> with TickerProviderStateMixin {
  /// Drives the breathing / pulse scale.
  late final AnimationController _pulseController;

  /// Drives the rotating swirl gradient (thinking state).
  late final AnimationController _rotationController;

  /// Drives the expanding ripple rings (listening state).
  late final AnimationController _rippleController;

  @override
  void initState() {
    super.initState();

    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2200),
    )..repeat(reverse: true);

    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    )..repeat();

    _rippleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    )..repeat();

    _syncDurations();
  }

  @override
  void didUpdateWidget(AiOrb oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.state != widget.state) {
      _syncDurations();
    }
  }

  /// Adjusts animation speeds based on the current state so the
  /// orb feels more "alive" when listening/thinking.
  void _syncDurations() {
    switch (widget.state) {
      case AiOrbState.idle:
        _pulseController.duration = const Duration(milliseconds: 2400);
        _rotationController.duration = const Duration(seconds: 14);
        break;
      case AiOrbState.listening:
        _pulseController.duration = const Duration(milliseconds: 1100);
        _rotationController.duration = const Duration(seconds: 8);
        break;
      case AiOrbState.thinking:
        _pulseController.duration = const Duration(milliseconds: 900);
        _rotationController.duration = const Duration(seconds: 3);
        break;
    }

    // Restart pulse with new duration smoothly.
    if (_pulseController.isAnimating) {
      _pulseController.repeat(reverse: true);
    }
    if (_rotationController.isAnimating) {
      _rotationController.repeat();
    }
  }

  @override
  void dispose() {
    _pulseController.dispose();
    _rotationController.dispose();
    _rippleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final coreSize = widget.size;
    final stageSize = widget.size * 2.2;

    return SizedBox(
      width: stageSize,
      height: stageSize,
      child: AnimatedBuilder(
        animation: Listenable.merge([
          _pulseController,
          _rotationController,
          _rippleController,
        ]),
        builder: (context, _) {
          return Stack(
            alignment: Alignment.center,
            children: [
              // Ripple rings — only visible while listening.
              if (widget.state == AiOrbState.listening)
                ..._buildRipples(coreSize),

              // Outer ambient glow.
              _buildGlow(coreSize),

              // Core orb.
              _buildCore(coreSize),
            ],
          );
        },
      ),
    );
  }

  List<Widget> _buildRipples(double coreSize) {
    // Two staggered ripples for a continuous expanding effect.
    return List.generate(2, (i) {
      final progress = (_rippleController.value + (i * 0.5)) % 1.0;
      final scale = 1.0 + progress * 1.6;
      final opacity = (1.0 - progress).clamp(0.0, 1.0) * 0.35;

      return Opacity(
        opacity: opacity,
        child: Container(
          width: coreSize * scale,
          height: coreSize * scale,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.luxGold, width: 1.5),
          ),
        ),
      );
    });
  }

  Widget _buildGlow(double coreSize) {
    final pulse = _pulseController.value;

    // Idle: subtle breathing. Listening/Thinking: stronger glow.
    final baseIntensity = switch (widget.state) {
      AiOrbState.idle => 0.35,
      AiOrbState.listening => 0.55,
      AiOrbState.thinking => 0.65,
    };

    final intensity = baseIntensity + (pulse * 0.25);
    final glowSize = coreSize * (1.5 + pulse * 0.25);

    return Container(
      width: glowSize,
      height: glowSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [
            AppColors.primaryLight.withValues(alpha: intensity * 0.45),
            AppColors.primary.withValues(alpha: intensity * 0.15),
            AppColors.primary.withValues(alpha: 0),
          ],
          stops: const [0.0, 0.5, 1.0],
        ),
      ),
    );
  }

  Widget _buildCore(double coreSize) {
    final pulse = _pulseController.value;
    final scale = 1.0 + (pulse * 0.06);

    return Transform.scale(
      scale: scale,
      child: Container(
        width: coreSize,
        height: coreSize,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: widget.state == AiOrbState.thinking
              ? _thinkingGradient()
              : _restingGradient(),
          boxShadow: [
            BoxShadow(
              color: AppColors.luxEagle.withValues(alpha: 0.45 + pulse * 0.25),
              blurRadius: 40 + pulse * 20,
              spreadRadius: 4 + pulse * 6,
            ),
          ],
        ),
      ),
    );
  }

  /// Calm gradient for idle / listening states.
  Gradient _restingGradient() {
    return RadialGradient(
      center: const Alignment(-0.3, -0.3),
      radius: 0.9,
      colors: [
        AppColors.luxEagle.withValues(alpha: 0.95),
        AppColors.luxBlue,
        AppColors.luxRavenclaw,
        AppColors.luxRowena,
      ],
      stops: const [0.0, 0.35, 0.75, 1.0],
    );
  }

  /// Rotating swirl gradient for the thinking state.
  SweepGradient _thinkingGradient() {
    final angle = _rotationController.value * 2 * math.pi;

    return SweepGradient(
      transform: GradientRotation(angle),
      colors: [
        AppColors.luxAmethystDark,
        AppColors.luxAmethystLight,
        AppColors.luxPlumeWine,
        AppColors.luxPrimary,
        AppColors.luxBlack,
      ],
      stops: const [0.0, 0.25, 0.5, 0.75, 1.0],
    );
  }
}
