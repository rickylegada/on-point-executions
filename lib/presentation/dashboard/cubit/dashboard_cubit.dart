

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_point_executions/domain/models/admin_dashboard_model.dart';

import 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(DashboardState());

  void login(bool isAdmin) {
    emit(state.copyWith(isAdmin: isAdmin));
  }

  void selectEvent(AdminDashboardModel adminDashboardModel){
    emit(state.copyWith(adminDashboardModel: adminDashboardModel));
  }


}
