import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'add_product_event.dart';
part 'add_product_state.dart';

class AddProductBloc extends Bloc<AddProductEvent, AddPostState> {
  AddProductBloc() : super(AddPostInitial()) {
    on<AddProductEvent>((event, emit) {
    });
  }
}
