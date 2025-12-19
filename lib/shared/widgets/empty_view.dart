import 'package:flutter/material.dart';

/// Empty state widget
/// Shows when a list/collection has no data
/// Provides friendly feedback to the user
class EmptyView extends StatelessWidget {
  final String message;
  final String? subtitle;
  final IconData icon;

  const EmptyView({
    super.key,
    required this.message,
    this.subtitle,
    this.icon = Icons.inbox_outlined,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Empty state icon
            Icon(
              icon,
              size: 80,
              color: Theme.of(context).textTheme.bodyMedium?.color?.withOpacity(0.5),
            ),
            const SizedBox(height: 24),
            
            // Main message
            Text(
              message,
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            
            // Optional subtitle
            if (subtitle != null) ...[
              const SizedBox(height: 12),
              Text(
                subtitle!,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
