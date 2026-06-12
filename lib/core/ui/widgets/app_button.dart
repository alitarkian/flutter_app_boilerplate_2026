import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_radius.dart';
import '../../theme/design_tokens.dart';

enum AppButtonType { primary, secondary, danger, text }

class AppButton extends StatelessWidget {
  final String label;

  final VoidCallback? onPressed;

  final bool loading;

  final bool enabled;

  final bool expanded;

  final Widget? icon;

  final AppButtonType type;

  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.loading = false,
    this.enabled = true,
    this.expanded = true,
    this.icon,
    this.type = AppButtonType.primary,
  });

  const AppButton.primary({
    super.key,
    required this.label,
    required this.onPressed,
    this.loading = false,
    this.enabled = true,
    this.expanded = true,
    this.icon,
  }) : type = AppButtonType.primary;

  const AppButton.secondary({
    super.key,
    required this.label,
    required this.onPressed,
    this.loading = false,
    this.enabled = true,
    this.expanded = true,
    this.icon,
  }) : type = AppButtonType.secondary;

  const AppButton.danger({
    super.key,
    required this.label,
    required this.onPressed,
    this.loading = false,
    this.enabled = true,
    this.expanded = true,
    this.icon,
  }) : type = AppButtonType.danger;

  const AppButton.text({
    super.key,
    required this.label,
    required this.onPressed,
    this.loading = false,
    this.enabled = true,
    this.expanded = false,
    this.icon,
  }) : type = AppButtonType.text;

  @override
  Widget build(BuildContext context) {
    final disabled = !enabled || loading;

    if (type == AppButtonType.text) {
      return TextButton(
        onPressed: disabled ? null : onPressed,
        child: _child(),
      );
    }

    final button = SizedBox(
      height: DesignTokens.buttonHeight,
      child: ElevatedButton(
        onPressed: disabled ? null : onPressed,
        style: _style(),
        child: _child(),
      ),
    );

    if (!expanded) {
      return button;
    }

    return SizedBox(width: double.infinity, child: button);
  }

  Widget _child() {
    if (loading) {
      return const SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(strokeWidth: 2),
      );
    }

    if (icon == null) {
      return Text(label);
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [icon!, const SizedBox(width: 8), Text(label)],
    );
  }

  ButtonStyle _style() {
    switch (type) {
      case AppButtonType.primary:
        return ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.textPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.md),
          ),
        );

      case AppButtonType.secondary:
        return ElevatedButton.styleFrom(
          backgroundColor: AppColors.textPrimary,
          foregroundColor: AppColors.primary,
          side: BorderSide(color: AppColors.primary),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.md),
          ),
        );

      case AppButtonType.danger:
        return ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          foregroundColor: AppColors.textPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.md),
          ),
        );

      case AppButtonType.text:
        return ElevatedButton.styleFrom();
    }
  }
}
