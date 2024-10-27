import 'package:amazon_clone_app/core/core_import_packages.dart';
import 'package:amazon_clone_app/features/auth/domain/domain_import_packages.dart';
import 'package:amazon_clone_app/features/auth/presentation/presentation_import_packages.dart';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvents, AuthStates> {
  final SignUpNewUserUseCase signUpNewUserUseCase;
  final SignInUseCase signInUseCase;
  final GetUserDataUseCase getUserDataUseCase;

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
            await getUserDataUseCase(userToken:event.userToken );

            break;
          }
          
      }
    });
  }
}

AuthStates _eitherSuccessfulStateOrErrorState<T>(Either<Failure, T> either,
    AuthStates Function(T responseFromApi) successfulState) {
  return either.fold(

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
