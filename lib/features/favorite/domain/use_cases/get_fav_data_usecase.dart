import 'package:dartz/dartz.dart';
import 'package:mini_ecommerce/core/error/failures.dart';
import 'package:mini_ecommerce/features/favorite/domain/entities/favorite_entity.dart';
import 'package:mini_ecommerce/features/favorite/domain/repositories/base_favorite_repository.dart';

class GetFavDataUseCase {
  final BaseFavoriteRepository baseFavoriteRepository;

  GetFavDataUseCase({required this.baseFavoriteRepository});
  Future<Either<Failure, FavoriteEntity>> call(int userId) async {
    return await baseFavoriteRepository.getFavoriteData(userId);
  }
}
