import 'package:on_point_executions/domain/models/admin_dashboard_model.dart';

class DashboardState {
  final bool isAdmin;
  final AdminDashboardModel? adminDashboardModel;

  DashboardState({this.isAdmin = false, this.adminDashboardModel,});

  DashboardState copyWith({bool? isAdmin, AdminDashboardModel? adminDashboardModel,}) {
    return DashboardState(
      isAdmin: isAdmin ?? this.isAdmin,
      adminDashboardModel: adminDashboardModel ?? this.adminDashboardModel,
    );
  }
}