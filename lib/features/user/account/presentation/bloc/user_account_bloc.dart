import 'package:amazon_clone_app/features/user/account/presentation/account_presentation_import_packages.dart';
import 'package:bloc/bloc.dart';



class AccountBloc extends Bloc<UserAccountEvent, UserAccountState> {
  AccountBloc() : super(UserAccountInitial()) {
    on<UserAccountEvent>((event, emit) {
    });
  }
}
