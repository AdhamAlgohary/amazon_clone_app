import 'package:amazon_clone_app/features/auth/presentaion/bloc/hold_changable_data/hold_changable_data_events.dart';
import 'package:amazon_clone_app/features/auth/presentaion/bloc/hold_changable_data/hold_changable_data_states.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class HoldChangableDataBloc
    extends Bloc<HoldChangableDataEvents, HoldChangableDataStates> {
  HoldChangableDataBloc() : super(const HoldChangableDataStates()) {
    on<HoldChangableDataEvents>((event, emit) async {
      if (event is SelectedOrNotSelectedEvent) {
        emit(HoldChangableDataStates(
              selectedSignInOrSignUp: event.selectedSignUpOrSignInValue,
              selectedShowPasswordOrNot: event.selectedShowPasswordOrNotValue));
      }
      
    });
  }
}
