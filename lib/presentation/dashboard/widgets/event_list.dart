import 'package:flutter/material.dart';
import 'package:on_point_executions/common/widgets/index.dart';
import 'package:on_point_executions/domain/models/event_model.dart';
import 'package:on_point_executions/presentation/dashboard/widgets/event_card.dart';

class EventList extends StatelessWidget {
  final List<EventModel> events;
  final Function(EventModel, int) onEventTap;
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
            child: BasePadding(
              verticalPadding: 5,
              child: EventCard(
                eventName: event.eventName,
                isActive: event.isActive,
                backgroundColor: isFocused ? Colors.blue[50] : Colors.white,
              ),
            ),
          );
        },
      ),
    );
  }
}
