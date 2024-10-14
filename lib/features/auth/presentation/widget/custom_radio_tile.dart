import 'package:amazon_clone_app/features/auth/presentation/presentation_import_packages.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomRadioTile extends StatelessWidget {
  final String text;
  final String value;
  final HoldChangableDataStates state;

  const CustomRadioTile(
      {super.key,
      required this.text,
      required this.state,
      required this.value});

  @override
  Widget build(BuildContext context) {
    return RadioListTile(
        contentPadding: const EdgeInsets.only(left: 0),
        value: value,
        groupValue: state.selectedSignInOrSignUp,
        title: Text(text),

        onChanged: (val) => context
            .read<HoldChangableDataBloc>()
            .add(SelectedOrNotSelectedEvent(
              selectedSignUpOrSignInValue: val!,
              selectedShowPasswordOrNotValue: state.selectedShowPasswordOrNot
            )));
  }
}
