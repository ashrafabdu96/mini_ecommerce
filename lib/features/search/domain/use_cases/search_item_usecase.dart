import 'package:dartz/dartz.dart';
import 'package:mini_ecommerce/core/error/failures.dart';
import 'package:mini_ecommerce/features/search/domain/entities/search_item_entity.dart';
import 'package:mini_ecommerce/features/search/domain/repositories/base_search_repository.dart';

class SearchItemUseCase {
  final BaseSearchRepository baseSearchRepository;

  SearchItemUseCase({required this.baseSearchRepository});
  Future<Either<Failure, SearchItemEntity>> call(
      {required String query}) async {
    return await baseSearchRepository.searchForProduct(query: query);
  }

  Future<Either<Failure, SearchItemEntity>> getSuggestion() async {
    return await baseSearchRepository.suggestion();
  }
}
