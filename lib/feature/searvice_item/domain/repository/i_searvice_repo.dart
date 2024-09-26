import 'package:fpdart/fpdart.dart';
import 'package:mt_hancod/core/errors/failures.dart';
import 'package:mt_hancod/feature/searvice_item/data/model/service_detail_model.dart';
import 'package:mt_hancod/feature/searvice_item/data/model/service_models.dart';
import 'package:mt_hancod/feature/searvice_item/data/model/service_subset_model.dart';

abstract interface class ISearveRepo {
  Future<Either<Failure, List<ServiceSubsetModel>>> getSubset(String id);
  Future<Either<Failure, List<ServiceDetailModel>>> getSearviceDetail(
      String id);
  Future<Either<Failure, List<ServiceModel>>> getServices();
}
