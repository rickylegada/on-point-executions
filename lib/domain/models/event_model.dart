class EventModel {
  final String eventName;
  final bool isActive;
  final int registeredUsers;
  final List<String> participantNames;

  EventModel({
    required this.eventName,
    required this.isActive,
    required this.registeredUsers,
    required this.participantNames,
  });

  EventModel.empty()
      : eventName = '',
        isActive = false,
        registeredUsers = 0,
        participantNames = [];

  EventModel copyWith({
    String? eventName,
    bool? isActive,
    int? registeredUsers,
    List<String>? participantNames,
  }) {
    return EventModel(
      eventName: eventName ?? this.eventName,
      isActive: isActive ?? this.isActive,
      registeredUsers: registeredUsers ?? this.registeredUsers,
      participantNames: participantNames ?? this.participantNames,
    );
  }
}
