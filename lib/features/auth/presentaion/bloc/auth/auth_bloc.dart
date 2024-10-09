import 'package:amazon_clone_app/core/constants/failures_msgs.dart';
import 'package:amazon_clone_app/features/auth/domian/usecases/get_user_data_use_case.dart';
import 'package:amazon_clone_app/features/auth/domian/usecases/sign_up_new_user_use_case.dart';
import 'package:amazon_clone_app/features/auth/presentaion/bloc/auth/auth_events.dart';
import 'package:amazon_clone_app/features/auth/presentaion/bloc/auth/auth_states/auth_states.dart';
import 'package:amazon_clone_app/features/auth/presentaion/bloc/auth/auth_states/sign_in_states.dart';
import 'package:amazon_clone_app/features/auth/presentaion/bloc/auth/auth_states/sign_up_states.dart';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/error/failure.dart';
import '../../../domian/usecases/sign_in_use_case.dart';

class AuthBloc extends Bloc<AuthEvents, AuthStates> {
  final SignUpNewUserUseCase signUpNewUserUseCase;
  final SignInUseCase signInUseCase;
  final GetUserDataUseCase getUserDataUseCase;
 Object ? userToken;

  AuthBloc(
      {required this.signUpNewUserUseCase,
      required this.signInUseCase,
      required this.getUserDataUseCase})
      : super(InitialState()) {
    on<AuthEvents>((event, emit) async {
      switch (event) {
        case SignUpEvent():
          {
            emit(LoadingState());
            final responseOrFailure = await signUpNewUserUseCase(event.user);
            emit(_eitherSuccessfulStateOrErrorState<String>(responseOrFailure,
                (msg) => MessageCreateUserState(msgFromApi: msg)));

            break;
          }

        case SignInEvent():
          {
            emit(LoadingState());
            final responseOrFailure = await signInUseCase(event.user);
            emit(_eitherSuccessfulStateOrErrorState<Unit>(
                responseOrFailure, (_) => const SuccessfulLoginState()));

            break;
          }

        case GetUserDataEvent():
          {
            await getUserDataUseCase();

            break;
          }
          
      }
    });
  }
}

AuthStates _eitherSuccessfulStateOrErrorState<T>(Either<Failure, T> either,
    AuthStates Function(T responseFromApi) successfulState) {
  return either.fold(
<<<<<<< HEAD

=======
>>>>>>> refactor-code-and-architcture-branch
      (failure) => FailedState(failedMsg: _mapFailureToMessage(failure)),
      successfulState);
}

String _mapFailureToMessage(Failure failure) {
  switch (failure) {
    case OffLineFailure():
      return FailuresMsgs.offLineFailureMsg;

    case ServerFailure():
      return FailuresMsgs.serverFailureMsg;

    case ClientFailure():
      return FailuresMsgs.clientFailureMsg;

    default:
      return "Unexpected error ,Please try again later";
  }
}
