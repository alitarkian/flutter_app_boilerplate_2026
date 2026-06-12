import 'package:flutter/material.dart';

abstract final class AppColors {
  const AppColors._();

  // ─── Brand ───────────────────────────────────────────────────
  static const primary = Color(0xFF6432C8);
  static const primaryLight = Color(0xFF8B5CF6);
  static const primaryDark = Color(0xFF4C1FA8);

  static const secondary = Color(0xFF1E50A0);
  static const secondaryLight = Color(0xFF3E7EB5);
  static const secondaryDark = Color(0xFF012C55);

  static const accent = Color(0xFFCBA135);
  static const accentBright = Color(0xFFD4AF37);

  // ─── Dark Surface ─────────────────────────────────────────────
  static const darkBg = Color(0xFF0D0D0F);
  static const darkBg2 = Color(0xFF141418);
  static const darkSurface = Color(0xFF1A1A1F);
  static const darkSurface2 = Color(0xFF1E1E24);
  static const darkSurface3 = Color(0xFF242430);
  static const darkBorder = Color(0xFF2A2A35);
  static const darkBorderSubtle = Color(0xFF1F1F28);

  // ─── Light Surface ────────────────────────────────────────────
  static const lightBg = Color(0xFFF8F8FA);
  static const lightBg2 = Color(0xFFF0F0F5);
  static const lightSurface = Color(0xFFFFFFFF);
  static const lightSurface2 = Color(0xFFF5F5F7);
  static const lightBorder = Color(0xFFE0E0E6);
  static const lightBorderSubtle = Color(0xFFEEEEF2);

  // ─── Text ─────────────────────────────────────────────────────
  static const textPrimary = Color(0xFFFFFFFF);
  static const textSecondary = Color(0xFFB0B0BA);
  static const textTertiary = Color(0xFF70707A);
  static const textDisabled = Color(0xFF45454F);

  static const textPrimaryDark = Color(0xFF0A0A0A);
  static const textSecondaryDark = Color(0xFF4A4A55);
  static const textTertiaryDark = Color(0xFF8A8A95);

  // ─── Semantic ─────────────────────────────────────────────────
  static const success = Color(0xFF1D9E75);
  static const successLight = Color(0xFF0D6E50);
  static const successBg = Color(0xFF0D2B22);

  static const error = Color(0xFFE24B4A);
  static const errorLight = Color(0xFFFF6B6A);
  static const errorBg = Color(0xFF2D1212);

  static const warning = Color(0xFFEF9F27);
  static const warningLight = Color(0xFFFBBC05);
  static const warningBg = Color(0xFF2D2010);

  static const info = Color(0xFF378ADD);
  static const infoLight = Color(0xFF60A5FA);
  static const infoBg = Color(0xFF0F1E30);

  // ─── Overlay ─────────────────────────────────────────────────
  static const overlayLight = Color(0x0AFFFFFF);
  static const overlayMedium = Color(0x1AFFFFFF);
  static const overlayStrong = Color(0x33FFFFFF);

  static const overlayDark = Color(0x0A000000);
  static const overlayDarkMedium = Color(0x1A000000);
  static const overlayDarkStrong = Color(0x33000000);

  // ─── Lux Legacy ──────────────────────────────────────────────
  static const luxBlack = Color(0xFF0B0B0B);
  static const luxWhite = Color(0xFFF7F6F5);
  static const luxGold = Color(0xFFC6A86A);
  static const luxGoldBright = Color(0xFFD4AF37);
  static const luxPlatinum = Color(0xFFE6E9EB);
  static const luxDarkGray = Color(0xFF4A4C50);
  static const luxMidGray = Color(0xFF9EA0A6);
  static const luxGray = Color(0xFFC6C6C6);
  static const luxDivider = Color(0x144A4C50);
  static const luxPrimary = Color(0xFF1C1C1C);
  static const luxSecondary = Color(0xFFFA3D3B);
  static const luxBlue = Color(0xFF00385A);
  static const luxRowena = Color(0xFF012C55);
  static const luxRavenclaw = Color(0xFF17507E);
  static const luxEagle = Color(0xFF3E7EB5);
  static const luxAmethystDark = Color(0xFF290215);
  static const luxAmethystLight = Color(0xFF521D38);
  static const luxSlateGray = Color(0xFF758695);
  static const luxSlateCream = Color(0xFFF1ECDA);
  static const luxPlumeWine = Color(0xFF5E4074);
  static const luxPlumeCloud = Color(0xFFF7F9EC);
  static const luxGreen = Color(0xFF15403F);

  // ─── Victor Legacy ───────────────────────────────────────────
  static const victorBlack = Color(0xFF1C1C1C);
  static const victorBlack2 = Color(0xFF222936);
  static const victorRed = Color(0xFFFA3D3B);
  static const victorGray = Color(0xFFC6C6C6);
  static const victorTeeGreen = Color(0xFF23714D);
  static const victorTeeWhite = Color(0xFFF1CCBA);
  static const victorCafePrimary = Color(0xFF332B28);
  static const victorCafeGold = Color(0xFF8E7943);
  static const victorCafeGreen = Color(0xFF027B76);
  static const victorCafeBrown = Color(0xFF754531);
  static const victorCafeOrange = Color(0xFFFC602B);
  static const victorPink = Color(0xFFF3456B);
  static const victorWhiteWarm = Color(0xFFFFE9D7);
  static const victorGreenBlack = Color(0xFF10212B);
  static const victorGreenLight = Color(0xFF8FA464);
  static const victorGreenWhite = Color(0xFFEFFBDD);
  static const victorYellow = Color(0xFFFAAD29);
  static const victorAmethystLight = Color(0xFF3B0458);

  // ─── Extra / Global ──────────────────────────────────────────
  static const cherryRed = Color(0xFF74070E);
  static const amethysts = Color(0xFF543763);
  static const midnightSky = Color(0xFF1A1B2F);
  static const smoke = Color(0xFF282427);
  static const smokeWhite = Color(0xFFEEEBE9);

  static const white = Color(0xFFFFFFFF);
  static const black = Color(0xFF101828);
  static const transparent = Colors.transparent;
}
