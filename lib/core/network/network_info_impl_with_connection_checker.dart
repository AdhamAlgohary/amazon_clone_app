import 'package:amazon_clone_app/core/core_import_packages.dart';

import 'package:internet_connection_checker/internet_connection_checker.dart';

class NetworkInfoImplWithConnectionChecker implements NetworkInfo {
  final InternetConnectionChecker internetConnectionChecker;
  
  const NetworkInfoImplWithConnectionChecker(
      {required this.internetConnectionChecker});

  @override
  Future<bool>  get isConnected => internetConnectionChecker.hasConnection;
}
