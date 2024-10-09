import 'package:amazon_clone_app/core/cubit/bottom_bar_cubit/bottom_bar_cubit_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomBarCubitBloc extends Cubit<BottomBarCubitState> {
  BottomBarCubitBloc() : super( IntialState(pageIndex: 0));

  void bottomBarOnTapFunc({required int pageIndex}) {
    emit(ChangePageIndexState(pageIndex: pageIndex));
  }
  
}
