import 'package:on_point_executions/domain/models/event_model.dart';

class DashboardState {
  final bool isAdmin;
  final EventModel? eventModel;
  final int? focusedIndex;

  DashboardState({
    this.isAdmin = false,
    this.eventModel,
    this.focusedIndex,
  });

  DashboardState copyWith({
    bool? isAdmin,
    EventModel? eventModel,
    int? focusedIndex,
  }) {
    return DashboardState(
      isAdmin: isAdmin ?? this.isAdmin,
      eventModel: eventModel ?? this.eventModel,
      focusedIndex: focusedIndex ?? this.focusedIndex,
    );
  }
}
