import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_ecommerce/core/constants/app_colors.dart';
import 'package:mini_ecommerce/features/address/presentation/cubit/address_cubit.dart';
import 'package:mini_ecommerce/features/address/presentation/widgets/address_information.dart';
import 'package:mini_ecommerce/features/address/presentation/widgets/user_address_information.dart';
import 'package:mini_ecommerce/features/cart/domain/entities/cart_entity.dart';
import 'package:mini_ecommerce/injection_container.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({Key? key, required this.cartDataEntity})
      : super(key: key);
  // final TextEditingController firstName = TextEditingController();
  //
  // final TextEditingController secondName = TextEditingController();
  //
  // final TextEditingController thirdName = TextEditingController();
  final List<CartDataEntity> cartDataEntity;

  @override
  Widget build(BuildContext context) {
    // cartDataEntity[0].itemsDiscount
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.kBackGroundColor,
      appBar: AppBar(),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => sl<AddressCubit>()..getUserAddress(context),
          ),
          BlocProvider(
            create: (context) => sl<AddressRegionCubit>(),
          ),
        ],
        child: Builder(
          builder: (context) {
            return BlocBuilder<AddressCubit, AddressState>(
              builder: (context, state) {
                print('State--==-->$state');
                if (state is AddressLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is AddressErrorState) {
                  // because if error that mean there's no address for the user so he has to add an address
                  return Center(
                    child: SizedBox(
                      height: size.height * 0.05,
                      width: size.width * 0.5,
                      child: ListTile(
                          dense: true,
                          // subtitle: Text(state.status),
                          title: const Text(" Please add an address"),
                          shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                color: AppColors.kShapesColor,
                              ),
                              borderRadius:
                                  BorderRadius.circular(size.width * 0.01)),
                          // leading: const Text(" Please add an address"),
                          trailing: const Icon(
                            Icons.add,
                            color: AppColors.kShapesColor,
                          ),
                          onTap: () async {
                            await BlocProvider.of<AddressCubit>(context)
                                .getCityInfo(context);
                          }),
                    ),
                  );
                  // return AddressInformation(size: size);
                } else if (state is AddressAlreadyExistState) {
                  return UserAddressInformationWidget(
                      userAddressEntity: state.userAddressEntity,
                      cartDataEntityList: cartDataEntity);
                } else if (state is AddressNotExistState) {
                  return AddressInformation(
                    isUpdate: false,
                    size: size,
                  );
                } else if (state is AddressUpdateState) {
                  return AddressInformation(
                    isUpdate: true,
                    size: size,
                    userAddressEntity: state.userAddressEntity,
                  );
                } else {
                  return AddressInformation(
                    isUpdate: false,
                    size: size,
                  );

                  ///when we create payment we will do counsumer and after add address successfully we will navigate
                }
              },
            );
          },
        ),
      ),
      // bottomSheet: Container(height: size.height*0.1,
      // width: size.width*0.5,
      //   color: AppColors.kShapesColor,
      // ),
    );
  }
}

// Widget build(BuildContext context) {
//   final Size size = MediaQuery.of(context).size;
//   return SafeArea(
//       child: Scaffold(
//     appBar: AppBar(),
//     body: Container(
//       height: size.height * 0.5,
//       child: GoogleMap(
//         mapType: MapType.hybrid,
//         initialCameraPosition: _kGooglePlex,
//         onMapCreated: (GoogleMapController controller) {
//           _controller.complete(controller);
//         },
//       ),
//     ),
//   ));
// }
