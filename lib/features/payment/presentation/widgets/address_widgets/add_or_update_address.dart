import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_ecommerce/core/custom_widgets/snack_bar_message.dart';
import 'package:mini_ecommerce/features/payment/presentation/cubits/address_cubits/payment_address_cubit.dart';
import 'package:mini_ecommerce/features/payment/presentation/cubits/address_cubits/region_cubit.dart';
import 'package:mini_ecommerce/features/payment/presentation/screen/payment_screen.dart';
import 'package:mini_ecommerce/features/payment/presentation/widgets/address_widgets/address_widget.dart';

class AddOrUpdateAddress extends StatelessWidget {
  const AddOrUpdateAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Builder(builder: (context) {
      return BlocConsumer<PaymentAddressCubit, PaymentAddressState>(
        listener: (context, state) {
          print('===>>$state<<===');
          if (state is PaymentAddOrUpdateAddressSuccessState) {
            // currentIndexStep++;
            //BlocProvider.of<PaymentAddressCubit>(context).currIndex++;

            showSnackMessage(
                context: context,
                message: 'success',
                bkgColor: Colors.black12,
                textColor: Colors.white);
            BlocProvider.of<PaymentAddressCubit>(context).getAddress(context);
            PaymentScreen.currentIndex.value = 1;
          } else if (state is PaymentAddOrUpdateAddressFailState) {
            showSnackMessage(
                context: context,
                message: 'Fail',
                bkgColor: Colors.black12,
                textColor: Colors.white);
            BlocProvider.of<PaymentAddressCubit>(context).getAddress(context);
            PaymentScreen.currentIndex.value = 0;
          }
          if (state is PaymentAddressSuccessState) {
            BlocProvider.of<RegionCubit>(context).getRegion(
              //     0,
              int.parse(state.addressEntity.cityNumber.toString()),
              context,
            );
          }
        },
        builder: (context, state) {
          if (state is PaymentAddressLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is PaymentAddressSuccessState) {
            return state.addressEntity.userId != null
                ? AddressWidget(
                    size: size,
                    isUpdate: true,
                    addressEntity: state.addressEntity,
                  )
                : AddressWidget(
                    size: size,
                    isUpdate: false,
                    addressEntity: state.addressEntity,
                  );
          } else if (state is PaymentAddressErrorState) {
            return Center(
              child: Text(state.status.toString()),
            );
          }
          return SizedBox();
        },
      );
    });
  }
}
