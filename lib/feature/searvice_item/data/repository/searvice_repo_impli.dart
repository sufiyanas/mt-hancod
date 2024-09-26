import 'package:mt_hancod/core/errors/failures.dart';
import 'package:mt_hancod/feature/searvice_item/data/data_source/searvice_data_source.dart';
import 'package:mt_hancod/feature/searvice_item/data/model/service_detail_model.dart';
import 'package:mt_hancod/feature/searvice_item/data/model/service_models.dart';
import 'package:mt_hancod/feature/searvice_item/data/model/service_subset_model.dart';
import 'package:mt_hancod/feature/searvice_item/domain/repository/i_searvice_repo.dart';
import 'package:fpdart/fpdart.dart';

class SearviceRepoImpl implements ISearveRepo {
  final ServiceRemoteDataSource remoteDataSource;

  SearviceRepoImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<ServiceSubsetModel>>> getSubset(String id) async {
    try {
      final response = await remoteDataSource.getSubset(id);
      return right(response);
    } catch (e) {
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<ServiceDetailModel>>> getSearviceDetail(
      String id) async {
    try {
      final response = await remoteDataSource.getSearviceDetail(id);
      return right(response);
    } catch (e) {
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<ServiceModel>>> getServices() async {
    try {
      final response = await remoteDataSource.getServices();

      return right(response);
    } catch (e) {
      return left(ServerFailure());
    }
  }
}
