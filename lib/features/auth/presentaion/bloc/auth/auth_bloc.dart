import 'package:amazon_clone_app/core/strings/failures_msg.dart';
import 'package:amazon_clone_app/features/auth/domian/usecases/sign_up_new_user_use_case.dart';
import 'package:amazon_clone_app/features/auth/presentaion/bloc/auth/auth_events.dart';
import 'package:amazon_clone_app/features/auth/presentaion/bloc/auth/auth_states/auth_states.dart';
import 'package:amazon_clone_app/features/auth/presentaion/bloc/auth/auth_states/sign_up_states.dart';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/error/failure.dart';

class AuthBloc extends Bloc<AuthEvents, AuthStates> {
  final SignUpNewUserUseCase signUpNewUserUseCase;

  AuthBloc({required this.signUpNewUserUseCase}) : super(InitialState()) {
    on<AuthEvents>((event, emit) async {
      switch (event) {
        case SignUpEvent _:
          {
            emit(LoadingState());
            final userOrFailure = await signUpNewUserUseCase(event.user);
            emit(_eitherDoneMessageOrErrorState(userOrFailure));
            break;
          }
      }
    });
  }
}

SignUpStates _eitherDoneMessageOrErrorState(Either<Failure, String> either) {
  return either.fold(
      (failure) =>
          ErrorCreateUserState(failedMsg: _mapFailureToMessage(failure)),
      (msg) => MessageCreateUserState(msgFromApi: msg));
}

String _mapFailureToMessage(Failure failure) {
  switch (failure) {
    case OffLineFailure():
      return FailuresMsg.offLineFailureMsg;
    case ServerFailure():
      return FailuresMsg.serverFailureMsg;
    case ClientFailure():
      return FailuresMsg.clientFailureMsg;
    default:
      return "Unexpected error ,Please try again later";
  }
}
