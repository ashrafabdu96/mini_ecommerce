import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_ecommerce/features/auth/presentation/cubit/local/locale_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_routes.dart';
import 'core/app_theme.dart';
import 'core/localization/localizations_contents.dart';
import 'injection_container.dart';

// String _mapFailureToMessage(Failure failure) {
//   switch (failure.runtimeType) {
//     case ServerFailure:
//       return "serverFailure";
//     case OfflineFailure:
//       return "offlineFailure";
//     case NotFoundFailure:
//       return "no_data_found";
//     default:
//       return "unExpectedFailure";
//   }
// }

// List? cartList;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  // LocalProfileDataSourceImpl ob = LocalProfileDataSourceImpl();
  // print(getUserInfo().imageUrl);

  ///test repo impl**************

  ///test repo impl**************

  // ItemDetailRemoteDataSourceImpl ob = ItemDetailRemoteDataSourceImpl();
  // await ob.getItemReviews(itemId: 1);

  // SearchRemoteDataSourceImpl ob = SearchRemoteDataSourceImpl();
  // await ob.searchForProduct(query: "laptop acer E5-73G");
  // print(getUserEmail());
  // ItemDetailRemoteDataSourceImpl ob = ItemDetailRemoteDataSourceImpl();
  // ob.getItemDetailData(1);

  // OrderRemoteDataSourceImpl ob = OrderRemoteDataSourceImpl();
  // await ob.getOrderDetails(orderId: 1);

  // "userId": paymentEntity.userIdPay,
  // "senderName": paymentEntity.senderName,
  // "paymentTypeId": paymentEntity.payTypeId,
  // "accountNumber": paymentEntity.accountNumber,
  // "amount": paymentEntity.amount,
  // "phoneNumber": paymentEntity.phoneNumber,
  // "remittanceNumber": paymentEntity.remittanceNumber
  // PaymentEntity paymentEntity = PaymentEntity(
  //   phoneNumber: "735739008",
  //   accountNumber: "12366",
  //   amount: "2500",
  //   payTypeId: '4',
  //   remittanceNumber: '040550',
  //   senderName: "aya ali",
  //   userIdPay: "58",
  // );

  // await ob.addPaymentInfo(paymentEntity: paymentEntity);
  // UserAddressEntity user = UserAddressEntity(
  //   addressId: '1',
  //   nearestPlace: 'haddaa',
  //   streetName: 'sssss',
  //   neighborhood: 'llpskk',
  //   phoneNumber: '4444444',
  //   secondName: 'lllllllll',
  //   firstName: 'llllllll',
  //   userId: getUserId(),
  //   lastName: 'kkkkkkkkkkk',
  //   cityName: 'llsss',
  // );
  // AddressRemoteDataSourceImpl ob = AddressRemoteDataSourceImpl();
  // await ob.updateUserAddress(user);
  // RemoteFavoriteDataSourceImpl ob = RemoteFavoriteDataSourceImpl();
  // // await ob.getFavoriteData(int.parse(getUserId()));
  // await ob.addToCartFromFavorite(int.parse(getUserId()), 4);
  // ItemDetailRemoteDataSourceImpl ob = ItemDetailRemoteDataSourceImpl();
  // ob.getItemVariation(4);
  // print(sl<SharedPreferences>().getString("CACHED_USER"));
  // final x = jsonDecode(
  // sl<SharedPreferences>().clear();
  // print(await getLang());
  // AuthRemoteDataSourceImp ob = AuthRemoteDataSourceImp();
  // await ob.changePassword(
  //     email: 'ashrafabdo6622@gmail.com',
  //     oldPassword: '12345678',
  //     newPassword: '123456789');
  // runApp(DevicePreview(
  //   builder: (context) => const MyApp(),
  //   enabled: !kReleaseMode,
  // ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // final locale = .currentLocale;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              sl<LocaleCubit>(instanceName: "LocaleCubit")..getSavedLanguage(),
        ),
      ],
      child: BlocBuilder<LocaleCubit, LocaleState>(
        builder: (context, state) {
          print(sl<SharedPreferences>().getString("step"));
          if (state is ChangeLocaleState) {
            return MaterialApp(
              useInheritedMediaQuery: true,
              //device preview
              builder: DevicePreview.appBuilder,
              onGenerateRoute: AppRoute.generateRoute,
              locale: state.locale,
              title: 'mini_ecommerce',

              theme: appTheme,
              supportedLocales: supportedLocales,
              localizationsDelegates: localizationsDelegates,
              localeResolutionCallback: localeResolutionCallback,
              debugShowCheckedModeBanner: false,
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
