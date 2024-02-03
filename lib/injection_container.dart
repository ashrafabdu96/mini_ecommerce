import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:mini_ecommerce/core/helpers/network_info.dart';
import 'package:mini_ecommerce/features/address/data/data_sources/address_remote_data_source.dart';
import 'package:mini_ecommerce/features/address/data/repositories/address_repository_impl.dart';
import 'package:mini_ecommerce/features/address/domain/use_cases/get_city_usecase.dart';
import 'package:mini_ecommerce/features/address/domain/use_cases/get_user_address_usecase.dart';
import 'package:mini_ecommerce/features/address/presentation/cubit/address_cubit.dart';
import 'package:mini_ecommerce/features/auth/data/data_sources/auth_local_data_source.dart';
import 'package:mini_ecommerce/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:mini_ecommerce/features/auth/data/repositories/auth_reposintory_imp.dart';
import 'package:mini_ecommerce/features/auth/domain/use_cases/change_password_usecase.dart';
import 'package:mini_ecommerce/features/auth/domain/use_cases/forget_password_usecase.dart';
import 'package:mini_ecommerce/features/auth/domain/use_cases/forget_password_verify_usecase.dart';
import 'package:mini_ecommerce/features/auth/domain/use_cases/login_usecase.dart';
import 'package:mini_ecommerce/features/auth/domain/use_cases/reset_password_usecase.dart';
import 'package:mini_ecommerce/features/auth/domain/use_cases/signup_usecase.dart';
import 'package:mini_ecommerce/features/auth/domain/use_cases/verify_code_usecase.dart';
import 'package:mini_ecommerce/features/auth/presentation/cubit/authentication/auth_cubit.dart';
import 'package:mini_ecommerce/features/auth/presentation/cubit/authentication/forget_password/forget_password_cubit.dart';
import 'package:mini_ecommerce/features/auth/presentation/cubit/local/locale_cubit.dart';
import 'package:mini_ecommerce/features/cart/data/data_sources/cart_remote_data_source.dart';
import 'package:mini_ecommerce/features/cart/data/repositories/cart_repository_impl.dart';
import 'package:mini_ecommerce/features/cart/domain/use_cases/delete_cart_usecase.dart';
import 'package:mini_ecommerce/features/cart/domain/use_cases/get_cart_data_usecase.dart';
import 'package:mini_ecommerce/features/cart/domain/use_cases/update_cart_item_quantity_usecase.dart';
import 'package:mini_ecommerce/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:mini_ecommerce/features/favorite/data/data_sources/remote_favorite_data_source.dart';
import 'package:mini_ecommerce/features/favorite/data/repositories/favorite_repository_impl.dart';
import 'package:mini_ecommerce/features/favorite/domain/use_cases/add_to_cart_from_fav_usecase.dart';
import 'package:mini_ecommerce/features/favorite/domain/use_cases/delete_fav_usecase.dart';
import 'package:mini_ecommerce/features/favorite/domain/use_cases/get_fav_data_usecase.dart';
import 'package:mini_ecommerce/features/favorite/presentation/cubits/favorite_cubit.dart';
import 'package:mini_ecommerce/features/home/home/data/data_sources/home_remote_data_source.dart';
import 'package:mini_ecommerce/features/home/home/data/repositories/home_repository_impl.dart';
import 'package:mini_ecommerce/features/home/home/domain/use_cases/get_categories_usecase.dart';
import 'package:mini_ecommerce/features/home/home/domain/use_cases/get_data_use_case.dart';
import 'package:mini_ecommerce/features/home/home/presentation/cubit/base_home_cubit/categories_cubit/categories_cubit.dart';
import 'package:mini_ecommerce/features/home/home/presentation/cubit/home_cubit.dart';
import 'package:mini_ecommerce/features/orders/data/data_sources/order_remote_data_source.dart';
import 'package:mini_ecommerce/features/orders/data/repositories/order_repository_impl.dart';
import 'package:mini_ecommerce/features/orders/domain/use_cases/get_order_details_usecase.dart';
import 'package:mini_ecommerce/features/orders/domain/use_cases/get_orders_usecase.dart';
import 'package:mini_ecommerce/features/orders/presentation/cubit/order_cubit.dart';
import 'package:mini_ecommerce/features/orders/presentation/cubit/order_details_cubit/order_details_cubit.dart';
import 'package:mini_ecommerce/features/payment/data/data_sources/payment_remote_data_source.dart';
import 'package:mini_ecommerce/features/payment/data/repositories/payment_repositor_impl.dart';
import 'package:mini_ecommerce/features/payment/domain/use_cases/add_payment_info_usecase.dart';
import 'package:mini_ecommerce/features/payment/domain/use_cases/add_payment_order.dart';
import 'package:mini_ecommerce/features/payment/domain/use_cases/get_address_usecase.dart';
import 'package:mini_ecommerce/features/payment/domain/use_cases/get_region_usecase.dart';
import 'package:mini_ecommerce/features/payment/domain/use_cases/update_address_pay_usecase.dart';
import 'package:mini_ecommerce/features/payment/presentation/cubits/address_cubits/payment_address_cubit.dart';
import 'package:mini_ecommerce/features/payment/presentation/cubits/address_cubits/region_cubit.dart';
import 'package:mini_ecommerce/features/payment/presentation/cubits/payment_cubits/payment_cubit.dart';
import 'package:mini_ecommerce/features/product_details/data/data_sources/item_d_remote_data_source.dart';
import 'package:mini_ecommerce/features/product_details/data/repositories/item_detail_repository_impl.dart';
import 'package:mini_ecommerce/features/product_details/domain/use_cases/add_to_cart_use_case.dart';
import 'package:mini_ecommerce/features/product_details/domain/use_cases/add_to_favorite_use_case.dart';
import 'package:mini_ecommerce/features/product_details/domain/use_cases/check_before_rate_usecase.dart';
import 'package:mini_ecommerce/features/product_details/domain/use_cases/delet_from_cart_use_case.dart';
import 'package:mini_ecommerce/features/product_details/domain/use_cases/delete_from_favorite_use_case.dart';
import 'package:mini_ecommerce/features/product_details/domain/use_cases/get_data_item_details_use_case.dart';
import 'package:mini_ecommerce/features/product_details/domain/use_cases/get_item_reviews_usecase.dart';
import 'package:mini_ecommerce/features/product_details/domain/use_cases/get_item_variation_usecase.dart';
import 'package:mini_ecommerce/features/product_details/presentation/cubit/item_detail_cubit.dart';
import 'package:mini_ecommerce/features/product_details/presentation/cubit/item_variation/item_variation_cubit.dart';
import 'package:mini_ecommerce/features/product_details/presentation/cubit/operations/item_details_operation_cubit.dart';
import 'package:mini_ecommerce/features/product_details/presentation/cubit/rate_cubit/rate_cubit.dart';
import 'package:mini_ecommerce/features/product_details/presentation/cubit/rate_cubit/reviews_cubit.dart';
import 'package:mini_ecommerce/features/products_by_category/data/data_sources/remote_data_source.dart';
import 'package:mini_ecommerce/features/products_by_category/data/repositories/product_by_cat_repository_impl.dart';
import 'package:mini_ecommerce/features/products_by_category/domain/use_cases/get_data_by_cat_usecase.dart';
import 'package:mini_ecommerce/features/products_by_category/presentation/cubit/product_by_cat_cubit.dart';
import 'package:mini_ecommerce/features/search/data/data_sources/search_remote_data_source.dart';
import 'package:mini_ecommerce/features/search/data/repositories/search_repository_impl.dart';
import 'package:mini_ecommerce/features/search/domain/use_cases/search_item_usecase.dart';
import 'package:mini_ecommerce/features/search/presentation/cubit/search_cubit.dart';
import 'package:mini_ecommerce/features/user_profile/data/data_sources/local_profile_data_source.dart';
import 'package:mini_ecommerce/features/user_profile/data/data_sources/remote_profile_data_source.dart';
import 'package:mini_ecommerce/features/user_profile/data/models/user_model.dart';
import 'package:mini_ecommerce/features/user_profile/data/repositories/profile_repository_impl.dart';
import 'package:mini_ecommerce/features/user_profile/domain/entities/user_entity.dart';
import 'package:mini_ecommerce/features/user_profile/domain/use_cases/get_user_image_usecase.dart';
import 'package:mini_ecommerce/features/user_profile/domain/use_cases/get_user_info_usecase.dart';
import 'package:mini_ecommerce/features/user_profile/presentation/cubit/change_profile_image_cubit/chang_image_cubit.dart';
import 'package:mini_ecommerce/features/user_profile/presentation/cubit/profile_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/address/domain/use_cases/add_address_usecase.dart';
import 'features/address/domain/use_cases/get_address_region_usecase.dart';
import 'features/address/domain/use_cases/update_address_usecase.dart';
import 'features/payment/domain/use_cases/add_address_pay_usecase.dart';
import 'features/product_details/domain/use_cases/add_or_update_review_usecase.dart';

final sl = GetIt.instance;

Future<void> init() async {
  ///search cubits

  sl.registerFactory(
    () => SearchCubit(
      searchItemUseCase: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => SearchItemUseCase(
      baseSearchRepository: SearchRepositoryImpl(
        networkInfo: NetworkInfoImpl(),
        searchRemoteDataSourceImpl: SearchRemoteDataSourceImpl(),
      ),
    ),
  );

  ///orders
  //cubits

  sl.registerFactory(
    () => OrderDetailsCubit(
      getOrderDetailsUseCase: sl(),
    ),
  );
  sl.registerFactory(
    () => OrderCubit(
      getOrdersUseCase: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => GetOrderDetailsUseCase(
      baseOrderRepository: OrderRepositoryImpl(
        networkInfo: NetworkInfoImpl(),
        orderRemoteDataSourceImpl: OrderRemoteDataSourceImpl(),
      ),
    ),
  );

  sl.registerLazySingleton(() => GetOrdersUseCase(
      baseOrderRepository: OrderRepositoryImpl(
          networkInfo: NetworkInfoImpl(),
          orderRemoteDataSourceImpl: OrderRemoteDataSourceImpl())));

  ///payment & address
//cubits
  sl.registerFactory(
    () => PaymentAddressCubit(
      getAddressUseCase: sl(),
      updateAddressPayUseCase: sl(),
      addAddressPayUseCase: sl(),
    ),
  );
  sl.registerFactory(
    () => PaymentCubit(
      addPaymentInfoUseCase: sl(),
      addPaymentOrderUseCase: sl(),
    ),
  );

  sl.registerLazySingleton(() => AddPaymentOrderUseCase(
      basePaymentRepository: PaymentRepositoryImpl(
          networkInfo: NetworkInfoImpl(),
          paymentRemoteDataSourceImpl: PaymentRemoteDataSourceImpl())));

  sl.registerLazySingleton(() => AddPaymentInfoUseCase(
      basePaymentRepository: PaymentRepositoryImpl(
          networkInfo: NetworkInfoImpl(),
          paymentRemoteDataSourceImpl: PaymentRemoteDataSourceImpl())));
  sl.registerLazySingleton(() => GetAddressUseCase(
      basePaymentRepository: PaymentRepositoryImpl(
          networkInfo: NetworkInfoImpl(),
          paymentRemoteDataSourceImpl: PaymentRemoteDataSourceImpl())));
  sl.registerLazySingleton(() => AddAddressPayUseCase(
      basePaymentRepository: PaymentRepositoryImpl(
          networkInfo: NetworkInfoImpl(),
          paymentRemoteDataSourceImpl: PaymentRemoteDataSourceImpl())));
  sl.registerLazySingleton(() => UpdateAddressPayUseCase(
      basePaymentRepository: PaymentRepositoryImpl(
          networkInfo: NetworkInfoImpl(),
          paymentRemoteDataSourceImpl: PaymentRemoteDataSourceImpl())));

  sl.registerFactory(
    () => RegionCubit(
      getRegionUseCase: sl(),
    ),
  );
  sl.registerLazySingleton(() => GetRegionUseCase(
      basePaymentRepository: PaymentRepositoryImpl(
          networkInfo: NetworkInfoImpl(),
          paymentRemoteDataSourceImpl: PaymentRemoteDataSourceImpl())));

  ///address
  ///cubits

  sl.registerFactory(
    () => AddressRegionCubit(
      getAddressRegionUseCase: sl(),
    ),
  );
  sl.registerLazySingleton(() => GetAddressRegionUseCase(
      baseAddressRepository: AddressRepositoryImpl(
          networkInfo: NetworkInfoImpl(),
          addressRemoteDataSourceImpl: AddressRemoteDataSourceImpl())));

  sl.registerFactory(
    () => AddressCubit(
      getUserAddressUseCase: sl(),
      getCityUseCase: sl(),
      addUserAddressUseCase: sl(),
      updateUserAddressUseCase: sl(),
    ),
  );

  sl.registerLazySingleton(() => UpdateUserAddressUseCase(
      baseAddressRepository: AddressRepositoryImpl(
          networkInfo: NetworkInfoImpl(),
          addressRemoteDataSourceImpl: AddressRemoteDataSourceImpl())));
  sl.registerLazySingleton(() => AddUserAddressUseCase(
      baseAddressRepository: AddressRepositoryImpl(
          networkInfo: NetworkInfoImpl(),
          addressRemoteDataSourceImpl: AddressRemoteDataSourceImpl())));
  sl.registerLazySingleton(() => GetUserAddressUseCase(
      baseAddressRepository: AddressRepositoryImpl(
          networkInfo: NetworkInfoImpl(),
          addressRemoteDataSourceImpl: AddressRemoteDataSourceImpl())));

  sl.registerLazySingleton(() => GetCityUseCase(
      baseAddressRepository: AddressRepositoryImpl(
          networkInfo: NetworkInfoImpl(),
          addressRemoteDataSourceImpl: AddressRemoteDataSourceImpl())));

  ///Features-cart
  ///cubits
  sl.registerFactory(
    () => ProfileCubit(
      getUserImageUseCase: sl(),
      getUserInfoUseCase: sl(),
    ),
  );
  sl.registerFactory(
    () => ChangImageCubit(
      getUserImageUseCase: sl(),
      // getUserInfoUseCase: sl(),
    ),
  );

//use cases
  sl.registerLazySingleton(
    () => GetUserImageUseCase(
      baseProfileRepository: ProfileRepositoryImpl(
        networkInfo: NetworkInfoImpl(),
        remoteProfileDataSourceImpl: RemoteProfileDataSourceImpl(),
        localProfileDataSourceImpl: LocalProfileDataSourceImpl(),
      ),
    ),
  );
  sl.registerLazySingleton(
    () => GetUserInfoUseCase(
      baseProfileRepository: ProfileRepositoryImpl(
        networkInfo: NetworkInfoImpl(),
        remoteProfileDataSourceImpl: RemoteProfileDataSourceImpl(),
        localProfileDataSourceImpl: LocalProfileDataSourceImpl(),
      ),
    ),
  );

  ///Features-cart
  ///cubits
  sl.registerFactory(
    () => FavoriteCubit(
      getFavDataUseCase: sl(),
      deleteFavUseCase: sl(),
      addToCartFromFavUseCase: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => AddToCartFromFavUseCase(
      baseFavoriteRepository: FavoriteRepositoryImpl(
        networkInfo: NetworkInfoImpl(),
        remoteFavoriteDataSourceImpl: RemoteFavoriteDataSourceImpl(),
      ),
    ),
  );
  sl.registerLazySingleton(
    () => GetFavDataUseCase(
      baseFavoriteRepository: FavoriteRepositoryImpl(
        networkInfo: NetworkInfoImpl(),
        remoteFavoriteDataSourceImpl: RemoteFavoriteDataSourceImpl(),
      ),
    ),
  );
  sl.registerLazySingleton(
    () => DeleteFavUseCase(
      baseFavoriteRepository: FavoriteRepositoryImpl(
        networkInfo: NetworkInfoImpl(),
        remoteFavoriteDataSourceImpl: RemoteFavoriteDataSourceImpl(),
      ),
    ),
  );
  //***************
  ///Features-cart
  ///cubits
  sl.registerFactory(() => CartCubit(
      getCartDataUseCase: sl(),
      deleteCartUseCase: sl(),
      updateCartItemQuantityUseCase: sl()));
  // sl.registerFactory(() => CartOperationCubit(deleteCartUseCase: sl()));

  ///use Cases

  sl.registerLazySingleton(
    () => DeleteCartUseCase(
      baseCartRepository: CartRepositoryImpl(
        networkInfo: NetworkInfoImpl(),
        cartRemoteDataSourceImpl: CartRemoteDataSourceImpl(),
      ),
    ),
  );
  sl.registerLazySingleton(
    () => UpdateCartItemUseCase(
      baseCartRepository: CartRepositoryImpl(
        networkInfo: NetworkInfoImpl(),
        cartRemoteDataSourceImpl: CartRemoteDataSourceImpl(),
      ),
    ),
  );
  sl.registerLazySingleton(
    () => GetCartDataUseCase(
      baseCartRepository: CartRepositoryImpl(
        networkInfo: NetworkInfoImpl(),
        cartRemoteDataSourceImpl: CartRemoteDataSourceImpl(),
      ),
    ),
  );

  ///**************
  ///Features-productsByCat
  ///cubits
  sl.registerFactory(() => ProductByCatCubit(getDataByCatUseCase: sl()));

  ///use Cases

  sl.registerLazySingleton(
    () => GetDataByCatUseCase(
      baseProductByCatRepository: ProductByCatRepositoryImpl(
        networkInfo: NetworkInfoImpl(),
        productByCatRemoteDataSourceImpl: ProductByCatRemoteDataSourceImpl(),
      ),
    ),
  );

  ///Features-ItemDetail
  ///cubits

  sl.registerFactory(() {
    // print('crated');
    return RateCubit(
      addOrUpdateReviewUseCase: sl(),
      checkBeforeRateUseCase: sl(),
    );
  });
  sl.registerFactory(() {
    // print('crated');
    return ReviewsCubit(getItemReviewsUseCase: sl());
  });

  sl.registerFactory(() {
    // print('crated');
    return ItemDetailCubit(
      getDataItemDetailsUseCase: sl(),
    );
  });
  sl.registerFactory(
    () => ItemVariationCubit(
      getItemVariationUseCase: sl(),
    ),
  );

  sl.registerFactory(
    () => ItemDetailsOperationCubit(
      addToCartUseCase: sl(),
      deleteFromCartUseCase: sl(),
      addToFavoriteUseCase: sl(),
      deleteFromFavoriteUseCase: sl(),
    ),
  );

  ///use cases
  ///
  sl.registerLazySingleton(
    () => GetItemReviewsUseCase(
      baseItemDetailsRepository: ItemDetailRepositoryImp(
        networkInfo: NetworkInfoImpl(),
        itemDetailRemoteDataSourceImpl: ItemDetailRemoteDataSourceImpl(),
      ),
    ),
  );
  sl.registerLazySingleton(
    () => CheckBeforeRateUseCase(
      baseItemDetailsRepository: ItemDetailRepositoryImp(
        networkInfo: NetworkInfoImpl(),
        itemDetailRemoteDataSourceImpl: ItemDetailRemoteDataSourceImpl(),
      ),
    ),
  );
  sl.registerLazySingleton(
    () => AddOrUpdateReviewUseCase(
      baseItemDetailsRepository: ItemDetailRepositoryImp(
        networkInfo: NetworkInfoImpl(),
        itemDetailRemoteDataSourceImpl: ItemDetailRemoteDataSourceImpl(),
      ),
    ),
  );
  sl.registerLazySingleton(
    () => GetItemVariationUseCase(
      baseItemDetailsRepository: ItemDetailRepositoryImp(
        networkInfo: NetworkInfoImpl(),
        itemDetailRemoteDataSourceImpl: ItemDetailRemoteDataSourceImpl(),
      ),
    ),
  );
  sl.registerLazySingleton(
    () => AddToFavoriteUseCase(
      baseItemDetailsRepository: ItemDetailRepositoryImp(
        networkInfo: NetworkInfoImpl(),
        itemDetailRemoteDataSourceImpl: ItemDetailRemoteDataSourceImpl(),
      ),
    ),
  );
  sl.registerLazySingleton(
    () => DeleteFromFavoriteUseCase(
      baseItemDetailsRepository: ItemDetailRepositoryImp(
        networkInfo: NetworkInfoImpl(),
        itemDetailRemoteDataSourceImpl: ItemDetailRemoteDataSourceImpl(),
      ),
    ),
  );
  sl.registerLazySingleton(
    () => AddToCartUseCase(
      baseItemDetailsRepository: ItemDetailRepositoryImp(
        networkInfo: NetworkInfoImpl(),
        itemDetailRemoteDataSourceImpl: ItemDetailRemoteDataSourceImpl(),
      ),
    ),
  );
  sl.registerLazySingleton(
    () => DeleteFromCartUseCase(
      baseItemDetailsRepository: ItemDetailRepositoryImp(
        networkInfo: NetworkInfoImpl(),
        itemDetailRemoteDataSourceImpl: ItemDetailRemoteDataSourceImpl(),
      ),
    ),
  );
  sl.registerLazySingleton(
    () => GetDataItemDetailsUseCase(
      baseItemDetailsRepository: ItemDetailRepositoryImp(
        networkInfo: NetworkInfoImpl(),
        itemDetailRemoteDataSourceImpl: ItemDetailRemoteDataSourceImpl(),
      ),
    ),
  );

  ///Features-home
  ///cubits
  sl.registerFactory(
    () => CategoriesCubit(getCategoriesUseCase: sl()),
  );
  sl.registerFactory(() => HomeCubit(getDataUseCase: sl()));

  ///use cases
  sl.registerLazySingleton(
    () => GetCategoriesUseCase(
      baseHomeRepository: HomeRepositoryImpl(
        networkInfo: NetworkInfoImpl(),
        homeRemoteDataSourceImpl: HomeRemoteDataSourceImpl(),
      ),
    ),
  );
  sl.registerLazySingleton(
    () => GetDataUseCase(
      baseHomeRepository: HomeRepositoryImpl(
        networkInfo: NetworkInfoImpl(),
        homeRemoteDataSourceImpl: HomeRemoteDataSourceImpl(),
      ),
    ),
  );

  //*************************************
  ///Features-Auth
  ///cubits
  sl.registerFactory(() => LocaleCubit(), instanceName: "LocaleCubit");

  sl.registerFactory(() => AuthCubit(
        signupUseCase: sl(),
        loginUseCase: sl(),
        verifyCodeUseCase: sl(),
      ));

  sl.registerFactory(
    () => ForgetPasswordCubit(
      forgetPasswordUseCase: sl(),
      resetPasswordUseCase: sl(),
      forgetPasswordVerifyCodeUseCase: sl(),
      changePasswordUseCase: sl(),
    ),
  );

  ///useCases and Repositories
//forget password Use case
  sl.registerLazySingleton(
    () => ForgetPasswordVerifyCodeUseCase(
      baseAuthRepository: AuthRepositoryImp(
        networkInfo: NetworkInfoImpl(),
        authRemoteDataSourceImp: AuthRemoteDataSourceImp(),
      ),
    ),
  );
  sl.registerLazySingleton(
    () => ChangePasswordUseCase(
      baseAuthRepository: AuthRepositoryImp(
        networkInfo: NetworkInfoImpl(),
        authRemoteDataSourceImp: AuthRemoteDataSourceImp(),
      ),
    ),
  );
  sl.registerLazySingleton(
    () => ForgetPasswordUseCase(
      baseAuthRepository: AuthRepositoryImp(
        networkInfo: NetworkInfoImpl(),
        authRemoteDataSourceImp: AuthRemoteDataSourceImp(),
      ),
    ),
  );
  sl.registerLazySingleton(
    () => ResetPasswordUseCase(
      baseAuthRepository: AuthRepositoryImp(
        networkInfo: NetworkInfoImpl(),
        authRemoteDataSourceImp: AuthRemoteDataSourceImp(),
      ),
    ),
  );

  //**********login use case
  sl.registerLazySingleton(() => LoginUseCase(
        baseAuthRepository: AuthRepositoryImp(
          authRemoteDataSourceImp: AuthRemoteDataSourceImp(),
          networkInfo: NetworkInfoImpl(),
          authLocalDataSourceImp: AuthLocalDataSourceImp(
            sharedPreferences: sl(),
          ),
        ),
      ));
  //**********sign up use case

  sl.registerLazySingleton(() => SignupUseCase(
        baseAuthRepository: AuthRepositoryImp(
          authRemoteDataSourceImp: AuthRemoteDataSourceImp(),
          networkInfo: NetworkInfoImpl(),
          authLocalDataSourceImp: AuthLocalDataSourceImp(
            sharedPreferences: sl(),
          ),
        ),
      ));
  //**********sign up use case

  sl.registerLazySingleton(() => VerifyCodeUseCase(
        baseAuthRepository: AuthRepositoryImp(
          authRemoteDataSourceImp: AuthRemoteDataSourceImp(),
          networkInfo: NetworkInfoImpl(),
        ),
      ));

  //********************************
  ///External

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  // sl.registerLazySingleton(() => );
}

String getUserId() {
  final String userId = jsonDecode(
      sl<SharedPreferences>().getString("CACHED_USER").toString())["userId"];

  return userId;
}

String getUserEmail() {
  final String email = jsonDecode(
      sl<SharedPreferences>().getString("CACHED_USER").toString())["userEmail"];

  return email;
}

UserEntity getUserInfo() {
  final userDecoded =
      jsonDecode(sl<SharedPreferences>().getString("CACHED_USER").toString());
  // print(userDecoded);
  final UserEntity userInfo = UserModel.fromJson(userDecoded);
  return userInfo;
}

String getLang() {
  final String langCode = sl<SharedPreferences>().getString("lang").toString();

  return langCode;
}
// Future<void> init() async {
// /*****************************************/
//   ///Features-Local
//   ///************************* cubits
//   sl.registerFactory(() => LocaleCubit(), instanceName: "LocaleCubit");
//   //***************************************
//   ///Features-auth
//   //************************* cubits
//   sl.registerFactory(
//       () => AuthCubit(
//             signupUseCase: sl<SignupUseCase>(),
//             loginUseCase: sl<LoginUseCase>(),
//           ),
//       instanceName: "AuthCubit");
//   sl.registerFactory(() => ForgetPasswordCubit(),
//       instanceName: "ForgetPasswordCubit");
//
//   //************************* useCases
//   sl.registerLazySingleton(
//     () => SignupUseCase(
//       baseAuthRepository: sl<AuthRepositoryImp>(),
//     ),
//   );
//   sl.registerLazySingleton(
//     () => LoginUseCase(
//       baseAuthRepository: sl<AuthRepositoryImp>(),
//     ),
//   );
//   sl.registerLazySingleton(
//       () => ForgetPasswordUseCase(baseAuthRepository: sl<AuthRepositoryImp>()));
//   sl.registerLazySingleton(
//     () => VerifyCodeUseCase(
//       baseAuthRepository: sl<AuthRepositoryImp>(),
//     ),
//   );
//   //************************* repository
//   sl.registerLazySingleton<BaseAuthRepository>(
//     () => AuthRepositoryImp(
//       authLocalDataSourceImp: sl<AuthLocalDataSourceImp>(),
//       networkInfo: sl<NetworkInfoImpl>(),
//       authRemoteDataSourceImp: sl<AuthRemoteDataSourceImp>(),
//     ),
//   );
//
// //*************************** Data Sources
//   sl.registerLazySingleton<AuthRemoteDataSource>(
//     () => AuthRemoteDataSourceImp(),
//   );
//   sl.registerLazySingleton<AuthLocalDataSource>(
//     () => AuthLocalDataSourceImp(
//       sharedPreferences: sl<SharedPreferences>(),
//     ),
//   );
//   //***************************************
//
//   ///*************************Core
//   sl.registerLazySingleton<NetworkInfo>(
//     () => NetworkInfoImpl(
//       sl<InternetConnectionChecker>(),
//     ),
//   );
//
//   ///*************************External
//   final sharedPreferences = await SharedPreferences.getInstance();
//   sl.registerLazySingleton(() => sharedPreferences);
//   sl.registerLazySingleton(() => );
// }
// Future<void> init() async {
// /*****************************************/
//   ///Features-Local
//   ///************************* cubits
//   sl.registerFactory(() => LocaleCubit(), instanceName: "LocaleCubit");
//   //***************************************
//   ///Features-auth
//   //************************* cubits
//   sl.registerFactory<Cubit>(
//       () => AuthCubit(
//             signupUseCase: sl(),
//             loginUseCase: sl(),
//           ),
//       instanceName: "AuthCubit");
//   sl.registerFactory<Cubit>(() => ForgetPasswordCubit(),
//       instanceName: "ForgetPasswordCubit");
//
//   //************************* useCases
//   sl.registerLazySingleton(
//     () => SignupUseCase(
//       baseAuthRepository: sl<AuthRepositoryImp>(),
//     ),
//   );
//   sl.registerLazySingleton(
//     () => LoginUseCase(
//       baseAuthRepository: sl<AuthRepositoryImp>(),
//     ),
//   );
//   sl.registerLazySingleton(() => ForgetPasswordUseCase(
//         baseAuthRepository: sl<AuthRepositoryImp>(),
//       ));
//   sl.registerLazySingleton(
//     () => VerifyCodeUseCase(
//       baseAuthRepository: sl<AuthRepositoryImp>(),
//     ),
//   );
//   //************************* repository
//   sl.registerLazySingleton<BaseAuthRepository>(
//     () => AuthRepositoryImp(
//       authLocalDataSourceImp: sl<AuthLocalDataSourceImp>(),
//       networkInfo: sl<NetworkInfoImpl>(),
//       authRemoteDataSourceImp: sl<AuthRemoteDataSourceImp>(),
//     ),
//   );
//
// //*************************** Data Sources
//   sl.registerLazySingleton<AuthRemoteDataSource>(
//     () => AuthRemoteDataSourceImp(),
//   );
//   sl.registerLazySingleton<AuthLocalDataSource>(
//     () => AuthLocalDataSourceImp(
//       sharedPreferences: sl(),
//     ),
//   );
//   //***************************************
//
//   ///*************************Core
//   sl.registerLazySingleton<NetworkInfo>(
//     () => NetworkInfoImpl(
//       sl(),
//     ),
//   );
//
//   ///*************************External
//   final sharedPreferences = await SharedPreferences.getInstance();
//   sl.registerLazySingleton(() => sharedPreferences);
//   sl.registerLazySingleton(() => );
// }
