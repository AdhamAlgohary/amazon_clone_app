class ServerException implements Exception {}

class EmptyCacheException implements Exception {}

class OfflineException implements Exception {}

class ClientException implements Exception {
  final String _msg;
  const ClientException(this._msg);
  String get clientErrorMsg => _msg;
}
