import 'package:flutter/material.dart';

abstract final class DesignTokens {
  const DesignTokens._();

  // ─── Component sizes ──────────────────────────────────────────
  static const double buttonHeight = 50.0;
  static const double buttonHeightSm = 40.0;
  static const double buttonHeightLg = 56.0;
  static const double buttonIconSize = 17.0;

  static const double inputHeight = 48.0;
  static const double inputIconSize = 18.0;

  static const double appBarHeight = 56.0;
  static const double bottomNavHeight = 64.0;
  static const double drawerWidth = 280.0;

  static const double avatarXs = 24.0;
  static const double avatarSm = 32.0;
  static const double avatarMd = 40.0;
  static const double avatarLg = 56.0;
  static const double avatarXl = 80.0;

  static const double iconSm = 16.0;
  static const double iconMd = 20.0;
  static const double iconLg = 24.0;
  static const double iconXl = 32.0;

  // ─── Page layout ─────────────────────────────────────────────
  static const double pageHorizontalPadding = 28.0;
  static const double pageVerticalPadding = 32.0;
  static const double cardPadding = 20.0;
  static const double sectionSpacing = 32.0;

  // ─── Border ───────────────────────────────────────────────────
  static const double borderThin = 0.5;
  static const double borderNormal = 1.0;
  static const double borderThick = 1.5;
  static const double borderFocus = 1.5;

  // ─── Elevation ────────────────────────────────────────────────
  static const double elevationNone = 0.0;
  static const double elevationSm = 2.0;
  static const double elevationMd = 4.0;
  static const double elevationLg = 8.0;
  static const double elevationXl = 16.0;

  // ─── Opacity ──────────────────────────────────────────────────
  static const double opacityDisabled = 0.38;
  static const double opacityHint = 0.25;
  static const double opacitySubtle = 0.40;
  static const double opacityMuted = 0.60;
  static const double opacityOverlay = 0.08;

  // ─── Animation durations ─────────────────────────────────────
  static const Duration instant = Duration(milliseconds: 80);
  static const Duration fast = Duration(milliseconds: 150);
  static const Duration normal = Duration(milliseconds: 250);
  static const Duration slow = Duration(milliseconds: 400);
  static const Duration slower = Duration(milliseconds: 600);

  // ─── Animation curves ────────────────────────────────────────
  static const Curve curveDefault = Curves.easeInOut;
  static const Curve curveEnter = Curves.easeOut;
  static const Curve curveExit = Curves.easeIn;
  static const Curve curveSpring = Curves.elasticOut;
  static const Curve curveBounce = Curves.bounceOut;

  // ─── Z-index (logical layers) ─────────────────────────────────
  static const int zBase = 0;
  static const int zRaised = 1;
  static const int zOverlay = 10;
  static const int zModal = 100;
  static const int zToast = 200;
  static const int zTooltip = 300;
}
