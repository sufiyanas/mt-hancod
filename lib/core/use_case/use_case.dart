import 'package:fpdart/fpdart.dart';
import 'package:mt_hancod/core/errors/failures.dart';

abstract interface class Usecase<SuccessType, Params> {
  Future<Either<Failure, SuccessType>> call(Params params);
}
