import 'package:amazon_clone_app/core/strings/failures_msg.dart';
import 'package:amazon_clone_app/features/auth/domian/usecases/sign_up_new_user_use_case.dart';
import 'package:amazon_clone_app/features/auth/presentaion/bloc/sign_up/sign_up_events.dart';
import 'package:amazon_clone_app/features/auth/presentaion/bloc/sign_up/sign_up_states.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/error/failure.dart';
import '../../../domian/entities/user_entity.dart';

class SignUpBloc extends Bloc<SignUpEvents, SignUpStates> {
  final SignUpNewUserUseCase signUpNewUserUseCase;
  String name = "";
  String email = "";
  String password = "";

  SignUpBloc({required this.signUpNewUserUseCase}) : super(InitialState()) {
    on<SignUpEvents>((event, emit) async {
      switch (event) {
        case SignUpEvents _:
          {
            emit(LoadingState());
            final userOrFailure =
                await signUpNewUserUseCase(name, email, password);
            emit(_mapFailureOrUserToState(userOrFailure));
            break;
          }
      }
    });
  }
}

SignUpStates _mapFailureOrUserToState(Either<Failure, UserEntity> either) {
  return either.fold(
      (failure) => ErrorCreateUserState(msg: _mapFailureToMessage(failure)),
      (user) => CreateUserSuccessfullyState(user: user));
}

String _mapFailureToMessage(Failure failure) {
  switch (failure) {
    case OffLineFailure():
      return FailuresMsg.offLineFailureMsg;
    case ServerFailure():
      return FailuresMsg.serverFailureMsg;

    default:
      return "Unexpected error ,Please try again later";
  }
}
