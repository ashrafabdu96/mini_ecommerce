import 'package:dartz/dartz.dart';
import 'package:mini_ecommerce/core/error/failures.dart';
import 'package:mini_ecommerce/features/home/home/domain/entities/CategoryItemsEntity.dart';
import 'package:mini_ecommerce/features/home/home/domain/repositories/base_home_repository.dart';

class GetCategoriesUseCase {
  final BaseHomeRepository baseHomeRepository;
  GetCategoriesUseCase({required this.baseHomeRepository});
  Future<Either<Failure, CategoryItemsEntity>> call() async {
    return await baseHomeRepository.getAllCategories();
  }
}
