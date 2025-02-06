class AdminDashboardModel {
  final String eventName;
  final bool isActive;
  final int registeredUsers;
  final List<String> participantNames;

  AdminDashboardModel({
    required this.eventName,
    required this.isActive,
    required this.registeredUsers,
    required this.participantNames,
  });

  AdminDashboardModel.empty()
      : eventName = '',
        isActive = false,
        registeredUsers = 0,
        participantNames = [];

  AdminDashboardModel copyWith({
    String? eventName,
    bool? isActive,
    int? registeredUsers,
    List<String>? participantNames,
  }) {
    return AdminDashboardModel(
      eventName: eventName ?? this.eventName,
      isActive: isActive ?? this.isActive,
      registeredUsers: registeredUsers ?? this.registeredUsers,
      participantNames: participantNames ?? this.participantNames,
    );
  }
}
