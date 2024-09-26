import 'package:fpdart/fpdart.dart';
import 'package:mt_hancod/core/errors/failures.dart';
import 'package:mt_hancod/core/use_case/use_case.dart';
import 'package:mt_hancod/feature/searvice_item/data/model/service_subset_model.dart';
import 'package:mt_hancod/feature/searvice_item/domain/repository/i_searvice_repo.dart';

class GetSubsetServiceUsecase
    implements
        Usecase<List<ServiceSubsetModel>, UseCaseGetSubsetServiceParams> {
  final ISearveRepo repo;

  GetSubsetServiceUsecase({required this.repo});

  @override
  Future<Either<Failure, List<ServiceSubsetModel>>> call(
      UseCaseGetSubsetServiceParams params) async {
    return await repo.getSubset(params.id);
  }
}

class UseCaseGetSubsetServiceParams {
  final String id;

  UseCaseGetSubsetServiceParams({required this.id});
}
