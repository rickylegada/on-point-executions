import 'package:flutter/material.dart';
import 'package:on_point_executions/common/widgets/base_text.dart';

class EventCard extends StatelessWidget {
  final String eventName;
  final bool isActive;

  const EventCard({
    super.key,
    required this.eventName,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Card(
      elevation: 8.0,
      margin: const EdgeInsets.symmetric(vertical: 12.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          gradient: LinearGradient(
            colors: [
              theme.cardColor, // Default color (left)
              isActive
                  ? Colors.green.withValues(alpha: 20) // Active (green) with opacity
                  : Colors.red.withValues(alpha: 20), // Inactive (red) with opacity
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                child: BaseText(
                  eventName,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Icon(
                isActive ? Icons.check_circle : Icons.cancel,
                color: Colors.white, // Icon color matches the text
                size: 24.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}