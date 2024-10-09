import 'package:amazon_clone_app/features/auth/presentaion/bloc/auth/auth_states/auth_states.dart';

abstract class SignInStates extends AuthStates {
  const SignInStates();
}

class SuccessfulLoginState extends SignInStates {

  const SuccessfulLoginState();
  
  @override
  List<Object?> get props => [];
}


<<<<<<< HEAD

=======
>>>>>>> refactor-code-and-architcture-branch
