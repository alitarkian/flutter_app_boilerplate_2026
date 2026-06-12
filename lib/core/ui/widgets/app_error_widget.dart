import 'package:app_boilerplate/core/theme/app_spacing.dart';
import 'package:flutter/material.dart';

import 'app_button.dart';

class AppErrorWidget extends StatelessWidget {
  final String message;

  final VoidCallback? onRetry;

  const AppErrorWidget({super.key, required this.message, this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(AppSpacing.lg),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error_outline, size: 64),

            const SizedBox(height: 16),

            Text(message, textAlign: TextAlign.center),

            if (onRetry != null) ...[
              const SizedBox(height: 24),

              AppButton.primary(label: 'Retry', onPressed: onRetry),
            ],
          ],
        ),
      ),
    );
  }
}
