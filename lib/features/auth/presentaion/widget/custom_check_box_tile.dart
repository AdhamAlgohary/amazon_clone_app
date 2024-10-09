import 'package:amazon_clone_app/core/constants/app_constant_text.dart';
import 'package:amazon_clone_app/features/auth/presentaion/bloc/hold_changable_data/hold_changable_data_bloc.dart';
import 'package:amazon_clone_app/features/auth/presentaion/bloc/hold_changable_data/hold_changable_data_events.dart';
import 'package:amazon_clone_app/features/auth/presentaion/bloc/hold_changable_data/hold_changable_data_states.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomCheckBoxTile extends StatelessWidget {
  final HoldChangableDataStates state;
  const CustomCheckBoxTile({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
        contentPadding: const EdgeInsets.only(left: 0),
        controlAffinity: ListTileControlAffinity.leading,
        title: const Text(AppConstantText.authPageShowPasswordTxt),
        value: state.selectedShowPasswordOrNot,

        onChanged: (val) => context
            .read<HoldChangableDataBloc>()
            .add(SelectedOrNotSelectedEvent( selectedShowPasswordOrNotValue: val!,selectedSignUpOrSignInValue: state.selectedSignInOrSignUp)));
  }
}
