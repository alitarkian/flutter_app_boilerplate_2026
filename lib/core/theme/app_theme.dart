import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';
import 'app_radius.dart';
import 'design_tokens.dart';

abstract final class AppTheme {
  const AppTheme._();

  // ─── Dark ─────────────────────────────────────────────────────

  static ThemeData dark() {
    const cs = ColorScheme.dark(
      primary: AppColors.white,
      onPrimary: AppColors.textPrimaryDark,
      primaryContainer: AppColors.darkSurface2,
      onPrimaryContainer: AppColors.textPrimary,
      secondary: AppColors.primary,
      onSecondary: AppColors.white,
      secondaryContainer: Color(0xFF1F1030),
      onSecondaryContainer: AppColors.primaryLight,
      tertiary: AppColors.accent,
      onTertiary: AppColors.textPrimaryDark,
      surface: AppColors.darkBg2,
      onSurface: AppColors.textPrimary,
      surfaceContainerHighest: AppColors.darkSurface2,
      surfaceContainerHigh: AppColors.darkSurface,
      surfaceContainer: AppColors.darkBg2,
      surfaceContainerLow: AppColors.darkBg,
      surfaceContainerLowest: AppColors.darkBg,
      outline: AppColors.darkBorder,
      outlineVariant: AppColors.darkBorderSubtle,
      error: AppColors.error,
      onError: AppColors.white,
      errorContainer: AppColors.errorBg,
      onErrorContainer: AppColors.errorLight,
      shadow: Colors.black,
      scrim: Colors.black,
      inverseSurface: AppColors.lightSurface,
      onInverseSurface: AppColors.textPrimaryDark,
      inversePrimary: AppColors.textPrimaryDark,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: cs,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.darkBg,

      // ── Text ──
      textTheme: _textTheme(AppColors.textPrimary),
      primaryTextTheme: _textTheme(AppColors.white),

      // ── AppBar ──
      appBarTheme: const AppBarTheme(
        centerTitle: false,
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.darkBg,
        foregroundColor: AppColors.textPrimary,
        titleTextStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
          letterSpacing: -0.2,
        ),
        iconTheme: IconThemeData(
          color: AppColors.textPrimary,
          size: DesignTokens.iconLg,
        ),
        actionsIconTheme: IconThemeData(
          color: AppColors.textSecondary,
          size: DesignTokens.iconMd,
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: AppColors.darkBg,
          systemNavigationBarIconBrightness: Brightness.light,
        ),
      ),

      // ── Input ──
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.white.withValues(alpha: 0.05),
        hintStyle: TextStyle(
          color: AppColors.white.withValues(alpha: DesignTokens.opacityHint),
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        labelStyle: TextStyle(
          color: AppColors.white.withValues(alpha: DesignTokens.opacitySubtle),
          fontSize: 14,
        ),
        floatingLabelStyle: TextStyle(
          color: AppColors.white.withValues(alpha: 0.70),
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        prefixIconColor: WidgetStateColor.resolveWith((states) {
          if (states.contains(WidgetState.focused)) {
            return AppColors.white.withValues(alpha: 0.60);
          }
          return AppColors.white.withValues(alpha: 0.28);
        }),
        suffixIconColor: AppColors.white.withValues(alpha: 0.28),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 15,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.input),
          borderSide: BorderSide(
            color: AppColors.white.withValues(alpha: 0.09),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.input),
          borderSide: BorderSide(
            color: AppColors.white.withValues(alpha: 0.09),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.input),
          borderSide: BorderSide(
            color: AppColors.white.withValues(alpha: 0.30),
            width: DesignTokens.borderFocus,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.input),
          borderSide: const BorderSide(color: AppColors.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.input),
          borderSide: const BorderSide(
            color: AppColors.error,
            width: DesignTokens.borderFocus,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.input),
          borderSide: BorderSide(
            color: AppColors.white.withValues(alpha: 0.04),
          ),
        ),
        errorStyle: const TextStyle(color: AppColors.error, fontSize: 12),
        helperStyle: TextStyle(
          color: AppColors.white.withValues(alpha: 0.40),
          fontSize: 12,
        ),
        counterStyle: TextStyle(
          color: AppColors.white.withValues(alpha: 0.35),
          fontSize: 11,
        ),
      ),

      // ── ElevatedButton ──
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(DesignTokens.buttonHeight),
          backgroundColor: AppColors.white,
          foregroundColor: AppColors.textPrimaryDark,
          disabledBackgroundColor: AppColors.white.withValues(alpha: 0.28),
          disabledForegroundColor: AppColors.textPrimaryDark.withValues(
            alpha: 0.40,
          ),
          elevation: DesignTokens.elevationNone,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.button),
          ),
          textStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.1,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        ),
      ),

      // ── OutlinedButton ──
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size.fromHeight(DesignTokens.buttonHeight),
          foregroundColor: AppColors.white.withValues(alpha: 0.70),
          disabledForegroundColor: AppColors.white.withValues(alpha: 0.25),
          side: BorderSide(color: AppColors.white.withValues(alpha: 0.12)),
          backgroundColor: AppColors.white.withValues(alpha: 0.04),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.button),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
          textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ),

      // ── TextButton ──
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.white.withValues(alpha: 0.65),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.sm),
          ),
          textStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        ),
      ),

      // ── IconButton ──
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          foregroundColor: AppColors.textSecondary,
          highlightColor: AppColors.white.withValues(alpha: 0.08),
        ),
      ),

      // ── Card ──
      cardTheme: CardThemeData(
        color: AppColors.darkSurface,
        shadowColor: Colors.black.withValues(alpha: 0.40),
        elevation: DesignTokens.elevationSm,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.card),
          side: BorderSide(color: AppColors.white.withValues(alpha: 0.06)),
        ),
        margin: EdgeInsets.zero,
      ),

      // ── Divider ──
      dividerTheme: DividerThemeData(
        color: AppColors.white.withValues(alpha: 0.08),
        thickness: DesignTokens.borderNormal,
        space: 1,
      ),

      // ── SnackBar ──
      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColors.darkSurface2,
        contentTextStyle: const TextStyle(
          color: AppColors.textPrimary,
          fontSize: 14,
        ),
        actionTextColor: AppColors.primaryLight,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
          side: BorderSide(color: AppColors.white.withValues(alpha: 0.08)),
        ),
        behavior: SnackBarBehavior.floating,
        elevation: DesignTokens.elevationLg,
      ),

      // ── BottomSheet ──
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: AppColors.darkSurface,
        surfaceTintColor: Colors.transparent,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(AppRadius.xl),
          ),
        ),
        dragHandleColor: AppColors.white.withValues(alpha: 0.20),
        dragHandleSize: const Size(36, 4),
        elevation: DesignTokens.elevationXl,
      ),

      // ── Dialog ──
      dialogTheme: DialogThemeData(
        backgroundColor: AppColors.darkSurface,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.modal),
        ),
        titleTextStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
        contentTextStyle: TextStyle(
          fontSize: 14,
          color: AppColors.textSecondary,
          height: 1.5,
        ),
        elevation: DesignTokens.elevationXl,
      ),

      // ── ListTile ──
      listTileTheme: ListTileThemeData(
        textColor: AppColors.textPrimary,
        iconColor: AppColors.textSecondary,
        tileColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.sm),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        minLeadingWidth: 24,
      ),

      // ── Switch ──
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) return AppColors.white;
          return AppColors.textTertiary;
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) return AppColors.primary;
          return AppColors.darkSurface3;
        }),
        trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
      ),

      // ── Checkbox ──
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) return AppColors.white;
          return Colors.transparent;
        }),
        checkColor: WidgetStateProperty.all(AppColors.textPrimaryDark),
        side: BorderSide(color: AppColors.white.withValues(alpha: 0.15)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        splashRadius: 16,
      ),

      // ── Radio ──
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) return AppColors.white;
          return AppColors.textTertiary;
        }),
        splashRadius: 16,
      ),

      // ── Chip ──
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.darkSurface2,
        selectedColor: AppColors.primary.withValues(alpha: 0.20),
        labelStyle: const TextStyle(
          fontSize: 13,
          color: AppColors.textSecondary,
        ),
        side: BorderSide(color: AppColors.white.withValues(alpha: 0.10)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.chip),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      ),

      // ── FloatingActionButton ──
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.textPrimaryDark,
        elevation: DesignTokens.elevationMd,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.lg),
        ),
      ),

      // ── NavigationBar ──
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: AppColors.darkSurface,
        indicatorColor: AppColors.primary.withValues(alpha: 0.15),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return const IconThemeData(color: AppColors.white, size: 22);
          }
          return IconThemeData(color: AppColors.textTertiary, size: 22);
        }),
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppColors.white,
            );
          }
          return TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: AppColors.textTertiary,
          );
        }),
        elevation: DesignTokens.elevationNone,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
      ),

      // ── Tooltip ──
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: AppColors.darkSurface3,
          borderRadius: BorderRadius.circular(AppRadius.xs),
          border: Border.all(color: AppColors.white.withValues(alpha: 0.08)),
        ),
        textStyle: const TextStyle(
          color: AppColors.textPrimary,
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      ),

      // ── ProgressIndicator ──
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.white,
        linearTrackColor: AppColors.darkSurface2,
        circularTrackColor: AppColors.darkSurface2,
      ),

      // ── TextSelection ──
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: AppColors.white,
        selectionColor: AppColors.white.withValues(alpha: 0.20),
        selectionHandleColor: AppColors.white,
      ),

      // ── PopupMenu ──
      popupMenuTheme: PopupMenuThemeData(
        color: AppColors.darkSurface2,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
          side: BorderSide(color: AppColors.white.withValues(alpha: 0.08)),
        ),
        textStyle: const TextStyle(color: AppColors.textPrimary, fontSize: 14),
        elevation: DesignTokens.elevationLg,
      ),

      // ── TabBar ──
      tabBarTheme: TabBarThemeData(
        labelColor: AppColors.white,
        unselectedLabelColor: AppColors.textTertiary,
        indicatorColor: AppColors.white,
        indicatorSize: TabBarIndicatorSize.label,
        labelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        unselectedLabelStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        dividerColor: AppColors.white.withValues(alpha: 0.08),
      ),
    );
  }

  // ─── Light ────────────────────────────────────────────────────

  static ThemeData light() {
    const cs = ColorScheme.light(
      primary: AppColors.luxPrimary,
      onPrimary: AppColors.white,
      primaryContainer: AppColors.lightSurface2,
      onPrimaryContainer: AppColors.textPrimaryDark,
      secondary: AppColors.primary,
      onSecondary: AppColors.white,
      secondaryContainer: Color(0xFFEDE8FF),
      onSecondaryContainer: AppColors.primaryDark,
      tertiary: AppColors.accent,
      onTertiary: AppColors.white,
      surface: AppColors.lightSurface,
      onSurface: AppColors.textPrimaryDark,
      surfaceContainerHighest: AppColors.lightSurface2,
      surfaceContainerHigh: AppColors.lightBg2,
      surfaceContainer: AppColors.lightBg,
      surfaceContainerLow: AppColors.lightSurface,
      outline: AppColors.lightBorder,
      outlineVariant: AppColors.lightBorderSubtle,
      error: AppColors.error,
      onError: AppColors.white,
      errorContainer: Color(0xFFFFEDED),
      onErrorContainer: AppColors.error,
      shadow: Color(0x1A000000),
      scrim: Color(0x80000000),
      inverseSurface: AppColors.darkSurface,
      onInverseSurface: AppColors.textPrimary,
      inversePrimary: AppColors.white,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: cs,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.lightBg,

      textTheme: _textTheme(AppColors.textPrimaryDark),
      primaryTextTheme: _textTheme(AppColors.white),

      appBarTheme: const AppBarTheme(
        centerTitle: false,
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.lightBg,
        foregroundColor: AppColors.textPrimaryDark,
        titleTextStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimaryDark,
          letterSpacing: -0.2,
        ),
        iconTheme: IconThemeData(
          color: AppColors.textPrimaryDark,
          size: DesignTokens.iconLg,
        ),
        actionsIconTheme: IconThemeData(
          color: AppColors.textSecondaryDark,
          size: DesignTokens.iconMd,
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: AppColors.lightBg,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.lightBg2,
        hintStyle: TextStyle(
          color: AppColors.textPrimaryDark.withValues(alpha: 0.30),
          fontSize: 14,
        ),
        labelStyle: TextStyle(
          color: AppColors.textPrimaryDark.withValues(alpha: 0.55),
          fontSize: 14,
        ),
        floatingLabelStyle: const TextStyle(
          color: AppColors.luxPrimary,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 15,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.input),
          borderSide: const BorderSide(color: AppColors.lightBorder),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.input),
          borderSide: const BorderSide(color: AppColors.lightBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.input),
          borderSide: const BorderSide(
            color: AppColors.luxPrimary,
            width: DesignTokens.borderFocus,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.input),
          borderSide: const BorderSide(color: AppColors.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.input),
          borderSide: const BorderSide(
            color: AppColors.error,
            width: DesignTokens.borderFocus,
          ),
        ),
        errorStyle: const TextStyle(color: AppColors.error, fontSize: 12),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(DesignTokens.buttonHeight),
          backgroundColor: AppColors.luxPrimary,
          foregroundColor: AppColors.white,
          disabledBackgroundColor: AppColors.textTertiaryDark.withValues(
            alpha: 0.20,
          ),
          disabledForegroundColor: AppColors.textTertiaryDark,
          elevation: DesignTokens.elevationNone,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.button),
          ),
          textStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.1,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size.fromHeight(DesignTokens.buttonHeight),
          foregroundColor: AppColors.luxPrimary,
          side: const BorderSide(color: AppColors.lightBorder),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.button),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
          textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.luxPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.sm),
          ),
          textStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        ),
      ),

      cardTheme: CardThemeData(
        color: AppColors.lightSurface,
        shadowColor: AppColors.black.withValues(alpha: 0.08),
        elevation: DesignTokens.elevationSm,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.card),
          side: const BorderSide(color: AppColors.lightBorderSubtle),
        ),
        margin: EdgeInsets.zero,
      ),

      dividerTheme: const DividerThemeData(
        color: AppColors.lightBorder,
        thickness: DesignTokens.borderNormal,
        space: 1,
      ),

      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColors.luxPrimary,
        contentTextStyle: const TextStyle(color: AppColors.white, fontSize: 14),
        actionTextColor: AppColors.accentBright,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
        ),
        behavior: SnackBarBehavior.floating,
        elevation: DesignTokens.elevationLg,
      ),

      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: AppColors.lightSurface,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(AppRadius.xl),
          ),
        ),
        elevation: DesignTokens.elevationXl,
      ),

      dialogTheme: DialogThemeData(
        backgroundColor: AppColors.lightSurface,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.modal),
        ),
        titleTextStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimaryDark,
        ),
        contentTextStyle: TextStyle(
          fontSize: 14,
          color: AppColors.textSecondaryDark,
          height: 1.5,
        ),
        elevation: DesignTokens.elevationXl,
      ),

      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected))
            return AppColors.luxPrimary;
          return Colors.transparent;
        }),
        checkColor: WidgetStateProperty.all(AppColors.white),
        side: const BorderSide(color: AppColors.lightBorder),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),

      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) return AppColors.white;
          return AppColors.textTertiaryDark;
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected))
            return AppColors.luxPrimary;
          return AppColors.lightBg2;
        }),
        trackOutlineColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) return Colors.transparent;
          return AppColors.lightBorder;
        }),
      ),

      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: AppColors.luxPrimary,
        selectionColor: Color(0x221C1C1C),
        selectionHandleColor: AppColors.luxPrimary,
      ),

      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.luxPrimary,
        linearTrackColor: AppColors.lightBg2,
        circularTrackColor: AppColors.lightBg2,
      ),

      tabBarTheme: TabBarThemeData(
        labelColor: AppColors.luxPrimary,
        unselectedLabelColor: AppColors.textTertiaryDark,
        indicatorColor: AppColors.luxPrimary,
        indicatorSize: TabBarIndicatorSize.label,
        labelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        unselectedLabelStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        dividerColor: AppColors.lightBorder,
      ),

      chipTheme: ChipThemeData(
        backgroundColor: AppColors.lightBg2,
        selectedColor: AppColors.primary.withValues(alpha: 0.12),
        labelStyle: const TextStyle(
          fontSize: 13,
          color: AppColors.textSecondaryDark,
        ),
        side: const BorderSide(color: AppColors.lightBorder),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.chip),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      ),
    );
  }

  // ─── Shared TextTheme ─────────────────────────────────────────

  static TextTheme _textTheme(Color color) {
    return TextTheme(
      displayLarge: TextStyle(
        fontSize: 57,
        fontWeight: FontWeight.w300,
        letterSpacing: -0.25,
        color: color,
        height: 1.12,
      ),
      displayMedium: TextStyle(
        fontSize: 45,
        fontWeight: FontWeight.w300,
        letterSpacing: -0.15,
        color: color,
        height: 1.15,
      ),
      displaySmall: TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.w400,
        color: color,
        height: 1.22,
      ),
      headlineLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.5,
        color: color,
        height: 1.25,
      ),
      headlineMedium: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.3,
        color: color,
        height: 1.28,
      ),
      headlineSmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.2,
        color: color,
        height: 1.33,
      ),
      titleLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w500,
        letterSpacing: -0.1,
        color: color,
        height: 1.27,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
        color: color,
        height: 1.5,
      ),
      titleSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
        color: color,
        height: 1.43,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: color,
        height: 1.5,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: color,
        height: 1.43,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: color.withValues(alpha: 0.65),
        height: 1.33,
      ),
      labelLarge: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.1,
        color: color,
        height: 1.43,
      ),
      labelMedium: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.5,
        color: color,
        height: 1.33,
      ),
      labelSmall: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.9,
        color: color.withValues(alpha: 0.55),
        height: 1.45,
      ),
    );
  }
}
