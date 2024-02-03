import 'package:dartz/dartz.dart';
import 'package:mini_ecommerce/core/error/failures.dart';
import 'package:mini_ecommerce/features/home/home/domain/entities/CategoryItemsEntity.dart';
import 'package:mini_ecommerce/features/home/home/domain/entities/home_entity.dart';

abstract class BaseHomeRepository {
  Future<Either<Failure, HomeEntity>> getData(String userId);
  Future<Either<Failure, CategoryItemsEntity>> getAllCategories();
}
