import 'package:dartz/dartz.dart';
import 'package:mini_ecommerce/core/error/exceptions.dart';
import 'package:mini_ecommerce/core/error/failures.dart';
import 'package:mini_ecommerce/core/helpers/network_info.dart';
import 'package:mini_ecommerce/features/search/data/data_sources/search_remote_data_source.dart';
import 'package:mini_ecommerce/features/search/data/models/search_item_model.dart';
import 'package:mini_ecommerce/features/search/domain/entities/search_item_entity.dart';
import 'package:mini_ecommerce/features/search/domain/repositories/base_search_repository.dart';

class SearchRepositoryImpl extends BaseSearchRepository {
  final NetworkInfoImpl networkInfo;
  final SearchRemoteDataSourceImpl searchRemoteDataSourceImpl;
  SearchRepositoryImpl(
      {required this.searchRemoteDataSourceImpl, required this.networkInfo});

  @override
  Future<Either<Failure, SearchItemEntity>> searchForProduct(
      {required String query}) async {
    if (await networkInfo.isConnected) {
      try {
        final SearchItemModel searchItemModel =
            await searchRemoteDataSourceImpl.searchForProduct(query: query);
        if (searchItemModel.status == "success") {
          print('==========>success');
          return Right(searchItemModel);
        } else {
          print('==========>ffffoooooo');
          return Left(NotFoundFailure());
        }
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, SearchItemEntity>> suggestion() async {
    if (await networkInfo.isConnected) {
      try {
        final SearchItemModel searchItemModel =
            await searchRemoteDataSourceImpl.getSuggestion();
        if (searchItemModel.status == "success") {
          print('==========>success');
          return Right(searchItemModel);
        } else {
          print('==========>ffffoooooo');
          return Left(NotFoundFailure());
        }
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
