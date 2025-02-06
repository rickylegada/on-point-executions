import 'package:flutter/material.dart';
import 'package:on_point_executions/domain/models/admin_dashboard_model.dart';
import 'package:on_point_executions/presentation/dashboard/widgets/event_card.dart';

class EventList extends StatelessWidget {
  final List<AdminDashboardModel> events;
  final Function(AdminDashboardModel, int) onEventTap;
  final int? focusedEventIndex;

  const EventList({
    super.key,
    required this.events,
    required this.onEventTap,
    this.focusedEventIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: events.length,
        itemBuilder: (context, index) {
          final event = events[index];
          final isFocused = focusedEventIndex == index;

          return GestureDetector(
            onTap: () => onEventTap(event, index),
            child: EventCard(
              eventName: event.eventName,
              isActive: event.isActive,
              backgroundColor: isFocused ? Colors.blue[50] : Colors.white,
            ),
          );
        },
      ),
    );
  }
}
