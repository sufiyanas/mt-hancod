import 'package:fpdart/fpdart.dart';
import 'package:mt_hancod/core/errors/failures.dart';
import 'package:mt_hancod/feature/searvice_item/data/model/service_models.dart';
import 'package:mt_hancod/feature/searvice_item/domain/repository/i_searvice_repo.dart';
import 'package:mt_hancod/core/use_case/use_case.dart';

class GetServiceUsecase
    implements Usecase<List<ServiceModel>, UseCaseGetServiceParams> {
  final ISearveRepo repo;

  GetServiceUsecase({required this.repo});
  @override
  Future<Either<Failure, List<ServiceModel>>> call(
      UseCaseGetServiceParams params) async {
    return await repo.getServices();
  }
}

class UseCaseGetServiceParams {
  // final String id;

  // UseCaseGetServiceParams({required this.id});
}
