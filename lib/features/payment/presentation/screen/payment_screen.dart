import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_ecommerce/core/constants/app_colors.dart';
import 'package:mini_ecommerce/core/localization/app_localizations.dart';
import 'package:mini_ecommerce/features/cart/domain/entities/cart_entity.dart';
import 'package:mini_ecommerce/features/payment/presentation/cubits/address_cubits/payment_address_cubit.dart';
import 'package:mini_ecommerce/features/payment/presentation/cubits/address_cubits/region_cubit.dart';
import 'package:mini_ecommerce/features/payment/presentation/widgets/address_widgets/add_or_update_address.dart';
import 'package:mini_ecommerce/features/payment/presentation/widgets/payment_way.dart';
import 'package:mini_ecommerce/features/payment/presentation/widgets/summary/summary.dart';
import 'package:mini_ecommerce/injection_container.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key, required this.cartDataEntity, this.total})
      : super(key: key);
  // final List<BaseItemEntity> cartDataEntity;
  final List<CartDataEntity> cartDataEntity;
  final int? total;

  static ValueNotifier<int> currentIndex = ValueNotifier<int>(0);
  @override
  Widget build(BuildContext context) {
    // print('888888888888-------$cartDataEntity--------88888888888');
    final Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context);
        currentIndex.value = 0;
        return Future.value(false);
      },
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => sl<PaymentAddressCubit>()..getAddress(context),
          ),
          BlocProvider(
            create: (context) => sl<RegionCubit>(),
          ),
        ],
        child: Scaffold(
          backgroundColor: AppColors.kBackGroundColor,
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                  currentIndex.value = 0;
                },
                icon: const Icon(Icons.arrow_back_outlined)),
          ),
          body: ValueListenableBuilder<int>(
            valueListenable: currentIndex,
            builder: ((context, int value, child) {
              final addressCubit =
                  BlocProvider.of<PaymentAddressCubit>(context);
              // = value;
              return Stepper(
                controlsBuilder: (context, control) {
                  return const SizedBox();
                },
                steps: getSteps(size, context),
                type: StepperType.horizontal,
                onStepTapped: (newIndex) {
                  value = newIndex;
                  currentIndex.value = value;
                },
                currentStep: value,
              );
            }),
          ),
        ),
      ),
    );
  }

  //
  List<Step> getSteps(Size size, BuildContext context) {
    return [
      Step(
        subtitle: Text(
          "address".tr(context),
          style: const TextStyle(color: AppColors.kShapesColor),
        ),
        isActive: currentIndex.value >= 0,
        title: const Icon(Icons.location_on_outlined),
        content: SizedBox(
          height: size.height * 0.8,
          child: const AddOrUpdateAddress(),
        ),
        state: StepState.disabled,
      ),
      Step(
        subtitle: Text("payment".tr(context)),
        isActive: currentIndex.value >= 1,
        title: const Icon(Icons.currency_exchange_outlined),
        content: PaymentWay(
          cartDataEntity: cartDataEntity,
          size: size,
          total: total,
        ),
        state: StepState.disabled,
      ),
      Step(
        subtitle: Text("summary".tr(context)),
        isActive: currentIndex.value >= 2,
        title: const Icon(Icons.summarize_outlined),
        content: Center(
          child: Summary(
            total: total,
            addressEntity:
                BlocProvider.of<PaymentAddressCubit>(context).addressEntity,
            cartDataEntityList: cartDataEntity,
          ),
        ),
        state: StepState.disabled,
      ),
    ];
  }
}
