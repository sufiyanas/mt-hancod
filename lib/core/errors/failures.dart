abstract class Failure {
  final String message;

  Failure(this.message);

  @override
  String toString() => message;
}

class ServerFailure extends Failure {
  ServerFailure({String message = 'Server Failure'}) : super(message);
}

class NetworkFailure extends Failure {
  NetworkFailure({String message = 'Network Failure'}) : super(message);
}
