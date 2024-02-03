import 'package:dartz/dartz.dart';
import 'package:mini_ecommerce/core/error/failures.dart';
import 'package:mini_ecommerce/features/search/domain/entities/search_item_entity.dart';
import 'package:mini_ecommerce/features/search/domain/repositories/base_search_repository.dart';

class SuggestionItemUseCase {
  final BaseSearchRepository baseSearchRepository;

  SuggestionItemUseCase({required this.baseSearchRepository});
  Future<Either<Failure, SearchItemEntity>> call() async {
    return await baseSearchRepository.suggestion();
  }
}
