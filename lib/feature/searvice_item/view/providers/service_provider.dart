import 'package:mt_hancod/feature/searvice_item/data/data_source/searvice_data_source.dart';
import 'package:mt_hancod/feature/searvice_item/data/repository/searvice_repo_impli.dart';
import 'package:mt_hancod/feature/searvice_item/domain/repository/i_searvice_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:mt_hancod/feature/searvice_item/domain/usecase/get_service_usecase.dart';
import 'package:mt_hancod/feature/searvice_item/domain/usecase/get_subset_service.dart';
import 'package:mt_hancod/feature/searvice_item/domain/usecase/get_detailed_service_usecase.dart';
import 'package:mt_hancod/feature/searvice_item/data/model/service_models.dart';
import 'package:mt_hancod/feature/searvice_item/data/model/service_subset_model.dart';
import 'package:mt_hancod/feature/searvice_item/data/model/service_detail_model.dart';

part 'service_provider.g.dart';

@riverpod
class ServiceNotifier extends _$ServiceNotifier {
  @override
  FutureOr<List<ServiceModel>> build() async {
    final getServiceUsecase = ref.read(getServiceUsecaseProvider);
    final result = await getServiceUsecase(UseCaseGetServiceParams());
    print(result);
    return result.fold(
      (failure) => throw Exception(failure.toString()),
      (services) => services,
    );
  }

  Future<List<ServiceSubsetModel>> getSubsets(String serviceId) async {
    final getSubsetServiceUsecase = ref.read(getSubsetServiceUsecaseProvider);
    final result = await getSubsetServiceUsecase(
        UseCaseGetSubsetServiceParams(id: serviceId));
    return result.fold(
      (failure) => throw Exception(failure.toString()),
      (subsets) => subsets,
    );
  }

  Future<List<ServiceDetailModel>> getServiceDetails(String subsetId) async {
    final getDetailedServiceUsecase =
        ref.read(getDetailedServiceUsecaseProvider);
    final result = await getDetailedServiceUsecase(
        UseCaseGetDetailedServiceParams(id: subsetId));
    return result.fold(
      (failure) => throw Exception(failure.toString()),
      (details) => details,
    );
  }
}

@riverpod
GetServiceUsecase getServiceUsecase(GetServiceUsecaseRef ref) {
  return GetServiceUsecase(repo: ref.watch(serviceRepoProvider));
}

@riverpod
GetSubsetServiceUsecase getSubsetServiceUsecase(
    GetSubsetServiceUsecaseRef ref) {
  return GetSubsetServiceUsecase(repo: ref.watch(serviceRepoProvider));
}

@riverpod
GetDetailedServiceUsecase getDetailedServiceUsecase(
    GetDetailedServiceUsecaseRef ref) {
  return GetDetailedServiceUsecase(repo: ref.watch(serviceRepoProvider));
}

//dependency injection
final serviceRepoProvider = Provider<ISearveRepo>((ref) {
  return SearviceRepoImpl(remoteDataSource: ServiceRemoteDataSourceImpl());
});
