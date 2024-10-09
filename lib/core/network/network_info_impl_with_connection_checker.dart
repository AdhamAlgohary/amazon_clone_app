import 'package:amazon_clone_app/core/network/network_info.dart';

import 'package:internet_connection_checker/internet_connection_checker.dart';

class NetworkInfoImplWithConnectionChecker implements NetworkInfo {
  final InternetConnectionChecker internetConnectionChecker;
  
  const NetworkInfoImplWithConnectionChecker(
      {required this.internetConnectionChecker});

  @override
  Future<bool>  get isConnected => internetConnectionChecker.hasConnection;
}
