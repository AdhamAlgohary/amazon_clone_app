import 'package:amazon_clone_app/features/account/presentation/account_presentation_import_packages.dart';
import 'package:bloc/bloc.dart';



class AccountBloc extends Bloc<AccountEvent, AccountState> {
  AccountBloc() : super(AccountInitial()) {
    on<AccountEvent>((event, emit) {
    });
  }
}
