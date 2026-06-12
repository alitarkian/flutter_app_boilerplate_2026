import 'package:app_boilerplate/core/theme/app_spacing.dart';
import 'package:flutter/material.dart';

class AppEmptyState extends StatelessWidget {
  final String title;

  final String? subtitle;

  final IconData icon;

  const AppEmptyState({
    super.key,
    required this.title,
    this.subtitle,
    this.icon = Icons.inbox_outlined,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(AppSpacing.lg),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 72),

            const SizedBox(height: 16),

            Text(title, style: Theme.of(context).textTheme.titleMedium),

            if (subtitle != null) ...[
              const SizedBox(height: 8),

              Text(subtitle!, textAlign: TextAlign.center),
            ],
          ],
        ),
      ),
    );
  }
}
