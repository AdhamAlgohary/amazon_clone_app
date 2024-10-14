import 'package:amazon_clone_app/core/core_import_packages.dart';
import 'package:amazon_clone_app/features/auth/presentation/presentation_import_packages.dart';

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
