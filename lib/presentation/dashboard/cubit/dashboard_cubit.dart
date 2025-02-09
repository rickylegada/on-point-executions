

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_point_executions/domain/models/event_model.dart';

import 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(DashboardState());

  void login(bool isAdmin) {
    emit(state.copyWith(isAdmin: isAdmin));
  }

  void selectEvent(EventModel eventModel, int selectedIndex){
    emit(state.copyWith(eventModel: eventModel,focusedIndex:  selectedIndex));
  }


}
