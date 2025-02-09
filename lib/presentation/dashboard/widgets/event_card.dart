import 'package:flutter/material.dart';
import 'package:on_point_executions/common/widgets/base_text.dart';

// ignore: must_be_immutable
class EventCard extends StatelessWidget {
  final String eventName;
  final bool isActive;
  Color? backgroundColor;

  EventCard({
    super.key,
    required this.eventName,
    required this.isActive,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Card(
      color: backgroundColor,
      elevation: 8.0,
      margin: const EdgeInsets.symmetric(vertical: 12.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(
                isActive ? Icons.check_circle : Icons.cancel,
                color: isActive
                    ? Colors.green
                    : Colors.red, // Icon color matches the text
                size: 24.0,
              ),
              SizedBox(
                width: 15,
              ),
              Expanded(
                child: BaseText(
                  eventName,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
