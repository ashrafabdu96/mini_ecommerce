import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:mini_ecommerce/core/error/failures.dart';
import 'package:mini_ecommerce/features/user_profile/domain/entities/user_entity.dart';
import 'package:mini_ecommerce/features/user_profile/domain/use_cases/get_user_image_usecase.dart';
import 'package:mini_ecommerce/injection_container.dart';

part 'chang_image_state.dart';

class ChangImageCubit extends Cubit<ChangImageState> {
  ChangImageCubit({
    required this.getUserImageUseCase,
    // required this.changeProfileImageUseCase
  }) : super(ChangImageInitialState());
  // final ChangeProfileImageUseCase changeProfileImageUseCase;
  final GetUserImageUseCase getUserImageUseCase;

  changeImage() async {
    try {
      final result = await getUserImageUseCase(userId: int.parse(getUserId()));
      emit(_mapFailureOrUserEntityToState(result));
    } catch (e) {
      emit(state);
    }
  }

  ///helper
  ChangImageState _mapFailureOrUserEntityToState(
    Either<Failure, UserEntity> either,
  ) {
    return either.fold((failure) => ChangImageFailureState(), (userEntity) {
      return ChangImageSuccessState(userEntity: userEntity);
      // return ProfileSuccessState(userEntity: userEntity);
    });
  }
}
