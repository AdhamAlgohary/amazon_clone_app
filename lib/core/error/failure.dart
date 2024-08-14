abstract class Failure {
  const Failure();
}

class OffLineFailure extends Failure {
  const OffLineFailure();
}

class ServerFailure extends Failure {
  const ServerFailure();
}

class EmptyCacheFailure extends Failure {
  const EmptyCacheFailure();
}

class ClientFailure extends Failure {
  const ClientFailure();
}
