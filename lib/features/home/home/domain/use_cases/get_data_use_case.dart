import 'package:dartz/dartz.dart';
import 'package:mini_ecommerce/core/error/failures.dart';
import 'package:mini_ecommerce/features/home/home/domain/entities/home_entity.dart';
import 'package:mini_ecommerce/features/home/home/domain/repositories/base_home_repository.dart';

class GetDataUseCase {
  final BaseHomeRepository baseHomeRepository;
  GetDataUseCase({required this.baseHomeRepository});
  Future<Either<Failure, HomeEntity>> call(String userId) async {
    return await baseHomeRepository.getData(userId);
  }
}
