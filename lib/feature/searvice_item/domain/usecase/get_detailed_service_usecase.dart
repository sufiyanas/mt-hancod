import 'package:fpdart/fpdart.dart';
import 'package:mt_hancod/core/errors/failures.dart';
import 'package:mt_hancod/core/use_case/use_case.dart';
import 'package:mt_hancod/feature/searvice_item/data/model/service_detail_model.dart';
import 'package:mt_hancod/feature/searvice_item/domain/repository/i_searvice_repo.dart';

class GetDetailedServiceUsecase
    implements
        Usecase<List<ServiceDetailModel>, UseCaseGetDetailedServiceParams> {
  final ISearveRepo repo;

  GetDetailedServiceUsecase({required this.repo});

  @override
  Future<Either<Failure, List<ServiceDetailModel>>> call(
      UseCaseGetDetailedServiceParams params) async {
    return await repo.getSearviceDetail(params.id);
  }
}

class UseCaseGetDetailedServiceParams {
  final String id;

  UseCaseGetDetailedServiceParams({required this.id});
}
