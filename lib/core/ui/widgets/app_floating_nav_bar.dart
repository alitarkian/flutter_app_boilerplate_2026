import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_radius.dart';
import '../../theme/app_spacing.dart';

/// A single destination in the [AppFloatingNavBar].
class AppNavItem {
  final IconData icon;
  final IconData? activeIcon;
  final String label;

  const AppNavItem({required this.icon, required this.label, this.activeIcon});
}

/// A floating, pill-shaped bottom navigation bar with an animated
/// sliding indicator behind the selected item.
///
/// Designed to float above content with margin on all sides — wrap
/// the page body in a `Stack` or use it as a `Scaffold.bottomNavigationBar`
/// with `extendBody: true`.
class AppFloatingNavBar extends StatelessWidget {
  final List<AppNavItem> items;

  final int currentIndex;

  final ValueChanged<int> onTap;

  const AppFloatingNavBar({
    super.key,
    required this.items,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final barColor = isDark ? AppColors.darkSurface : AppColors.lightSurface;
    final borderColor = isDark
        ? AppColors.white.withValues(alpha: 0.08)
        : AppColors.lightBorder;
    final shadowColor = isDark
        ? Colors.black.withValues(alpha: 0.45)
        : AppColors.black.withValues(alpha: 0.10);

    return SafeArea(
      top: false,
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          AppSpacing.lg,
          0,
          AppSpacing.lg,
          AppSpacing.md,
        ),
        child: Container(
          height: 64,
          decoration: BoxDecoration(
            color: barColor,
            borderRadius: BorderRadius.circular(AppRadius.pill),
            border: Border.all(color: borderColor),
            boxShadow: [
              BoxShadow(
                color: shadowColor,
                blurRadius: 24,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final itemWidth = constraints.maxWidth / items.length;

              return Stack(
                children: [
                  // Animated sliding pill indicator
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 320),
                    curve: Curves.easeOutCubic,
                    left: itemWidth * currentIndex + AppSpacing.xs,
                    top: AppSpacing.xs,
                    bottom: AppSpacing.xs,
                    width: itemWidth - (AppSpacing.xs * 2),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.primary.withValues(alpha: 0.16),
                        borderRadius: BorderRadius.circular(AppRadius.pill),
                        border: Border.all(
                          color: AppColors.primary.withValues(alpha: 0.30),
                        ),
                      ),
                    ),
                  ),

                  // Nav items
                  Row(
                    children: List.generate(items.length, (index) {
                      final item = items[index];
                      final selected = index == currentIndex;

                      return Expanded(
                        child: _NavTile(
                          item: item,
                          selected: selected,
                          onTap: () => onTap(index),
                        ),
                      );
                    }),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _NavTile extends StatelessWidget {
  final AppNavItem item;
  final bool selected;
  final VoidCallback onTap;

  const _NavTile({
    required this.item,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final activeColor = AppColors.primaryLight;
    final inactiveColor = isDark
        ? AppColors.textTertiary
        : AppColors.textTertiaryDark;

    final color = selected ? activeColor : inactiveColor;

    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(AppRadius.pill),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppRadius.pill),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                transitionBuilder: (child, animation) =>
                    ScaleTransition(scale: animation, child: child),
                child: Icon(
                  selected ? (item.activeIcon ?? item.icon) : item.icon,
                  key: ValueKey(selected),
                  color: color,
                  size: 22,
                ),
              ),
              AnimatedSize(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeOutCubic,
                child: selected
                    ? Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text(
                          item.label,
                          style: TextStyle(
                            color: color,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
