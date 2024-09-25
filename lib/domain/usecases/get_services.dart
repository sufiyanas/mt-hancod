import 'package:dartz/dartz.dart';
import '../../core/errors/failures.dart';
import '../entities/service.dart';
import '../repositories/service_repository.dart';

class GetServices {
  final ServiceRepository repository;

  GetServices(this.repository);

  Future<Either<Failure, List<Service>>> call() async {
    return await repository.getServices();
  }
}
