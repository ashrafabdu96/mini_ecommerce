import 'package:dartz/dartz.dart';
import 'package:mini_ecommerce/core/error/failures.dart';
import 'package:mini_ecommerce/features/product_details/domain/entities/item_details_entity.dart';
import 'package:mini_ecommerce/features/product_details/domain/repositories/base_item_detail_repository.dart';

class GetDataItemDetailsUseCase {
  final BaseItemDetailsRepository baseItemDetailsRepository;

  GetDataItemDetailsUseCase({
    required this.baseItemDetailsRepository,
  });

  Future<Either<Failure, ItemDetailEntity>> call(int itemId) async {
    return await baseItemDetailsRepository.getData(itemId);
  }
}
