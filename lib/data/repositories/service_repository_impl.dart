import 'package:dartz/dartz.dart';
import '../../core/errors/failures.dart';
import '../../domain/entities/service.dart';
import '../../domain/repositories/service_repository.dart';
import '../datasources/service_remote_datasource.dart';
import 'dart:developer';

class ServiceRepositoryImpl implements ServiceRepository {
  final ServiceRemoteDataSource remoteDataSource;

  ServiceRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<Service>>> getServices() async {
    try {
      final remoteServices = await remoteDataSource.getServices();
      final services = remoteServices
          .map((serviceData) => Service(
                id: serviceData['id'].toString(),
                name: serviceData['name'].toString(),
                description: serviceData['description'].toString(),
                price: (serviceData['price'] as num).toDouble(),
              ))
          .toList();
      return Right(services);
    } catch (e) {
      log('Error in ServiceRepositoryImpl: $e');
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
