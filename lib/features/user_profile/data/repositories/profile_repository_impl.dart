import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mini_ecommerce/core/error/exceptions.dart';
import 'package:mini_ecommerce/core/error/failures.dart';
import 'package:mini_ecommerce/core/helpers/network_info.dart';
import 'package:mini_ecommerce/features/user_profile/data/data_sources/local_profile_data_source.dart';
import 'package:mini_ecommerce/features/user_profile/data/data_sources/remote_profile_data_source.dart';
import 'package:mini_ecommerce/features/user_profile/domain/entities/user_entity.dart';
import 'package:mini_ecommerce/features/user_profile/domain/repositories/base_profile_repository.dart';

class ProfileRepositoryImpl extends BaseProfileRepository {
  final LocalProfileDataSourceImpl localProfileDataSourceImpl;
  final NetworkInfoImpl networkInfo;
  final RemoteProfileDataSourceImpl remoteProfileDataSourceImpl;

  ProfileRepositoryImpl(
      {required this.remoteProfileDataSourceImpl,
      required this.networkInfo,
      required this.localProfileDataSourceImpl});
  @override
  Future<UserEntity> getUserInformation() async {
    final UserEntity userInfo =
        await localProfileDataSourceImpl.getUserInformation();
    return userInfo;
  }

  @override
  Future<Either<Failure, UserEntity>> getUserImage(
      {required int userId}) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteData =
            await remoteProfileDataSourceImpl.getUserInfo(userId: userId);
        if (remoteData.status == "success") {
          await localProfileDataSourceImpl.cacheUser(remoteData);
          return Right(remoteData);
        } else {
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
  Future<Either<Failure, Map<String, dynamic>>> changeProfileImage(
      {required XFile? imageFilePath,
      required ImagePicker picker,
      required bool isGallery}) async {
    if (await networkInfo.isConnected) {
      try {
        final XFile? imagePicked = await picker.pickImage(
            source: isGallery ? ImageSource.gallery : ImageSource.camera);
        imageFilePath = imagePicked;
        if (imageFilePath != null) {
          final remoteData = await remoteProfileDataSourceImpl
              .changeProfileImage(imagePath: imageFilePath.path);
          if (remoteData['status'] == "success") {
            return Right(remoteData);
          } else {
            return Left(AddFailure());
          }
        } else {
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
