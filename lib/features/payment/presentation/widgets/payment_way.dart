import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_ecommerce/core/constants/app_colors.dart';
import 'package:mini_ecommerce/core/custom_widgets/custom_button.dart';
import 'package:mini_ecommerce/core/custom_widgets/custom_dialog.dart';
import 'package:mini_ecommerce/core/custom_widgets/snack_bar_message.dart';
import 'package:mini_ecommerce/core/localization/app_localizations.dart';
import 'package:mini_ecommerce/features/cart/domain/entities/cart_entity.dart';
import 'package:mini_ecommerce/features/payment/presentation/cubits/payment_cubits/payment_cubit.dart';
import 'package:mini_ecommerce/features/payment/presentation/screen/payment_screen.dart';
import 'package:mini_ecommerce/features/payment/presentation/widgets/address_widgets/custom_text_form_address.dart';
import 'package:mini_ecommerce/injection_container.dart';

class PaymentWay extends StatelessWidget {
  const PaymentWay(
      {Key? key, required this.size, required this.cartDataEntity, this.total})
      : super(key: key);
  // static currentValue=
  static ValueNotifier<int> currentValue = ValueNotifier<int>(0);
  // final List<BaseItemEntity> cartDataEntity;
  final List<CartDataEntity> cartDataEntity;
  final int? total;
  final Size size;
  @override
  Widget build(BuildContext context) {
    currentValue.value = 0;
    print('build');
    print(currentValue.value);

    return BlocProvider(
      create: (context) => sl<PaymentCubit>(),
      child: Builder(builder: (context) {
        final paymentCubit = BlocProvider.of<PaymentCubit>(context);

        return SizedBox(
          height: size.height * 0.95,
          child: ValueListenableBuilder(
            valueListenable: currentValue,
            builder: ((context, int value, child) {
              value = currentValue.value;
              return BlocListener<PaymentCubit, PaymentState>(
                listener: (context, state) {},
                child: ListView(
                  children: [
                    Text(
                      "total_amount".tr(context) + ":  $total \$",
                      style: TextStyle(
                        fontSize: size.width * 0.035,
                        color: AppColors.kShapesColor,
                      ),
                    ),
                    ...getRadios(),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    BlocBuilder<PaymentCubit, PaymentState>(
                      builder: (context, state) {
                        if (state is PaymentLoadingState) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          return CustomButton(
                            text: "confirm".tr(context),
                            height: size.height * 0.05,
                            width: size.width * 0.1,
                            onTap: () {
                              showDialogMessage(
                                  context: context,
                                  onPressedYes: () async {
                                    var message = await paymentCubit
                                        .addPaymentInformation(
                                      amount: total ?? 0,
                                      paymentTypeId: currentValue.value,
                                      context: context,
                                    );
                                    print(message);
                                    message ==
                                            "you have to select the payment method"
                                        ? showSnackMessage(
                                            context: context,
                                            message:
                                                "you have to select the payment method",
                                            bkgColor: Colors.redAccent,
                                            textColor: AppColors.kWhiteFonts,
                                          )
                                        : //to remove the dialog
                                        paymentCubit.addPaymentOrder(
                                            total: total!.toDouble(),
                                            cartDataEntityList: cartDataEntity,
                                            context: context);
                                    // ignore: use_build_context_synchronously
                                    Navigator.pop(context);
                                  });
                            },
                          );
                        }
                      },
                    ),
                  ],
                ),
              );
            }),
          ),
        );
      }),
    );
  }

  List<Widget> getRadios() {
    return getValues()
        .map(
          (e) => ValueListenableBuilder<int>(
            valueListenable: currentValue,
            builder: ((context, int value, child) {
              value = currentValue.value;
              return ListView(
                // physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  RadioListTile(
                    controlAffinity: ListTileControlAffinity.platform,
                    activeColor: AppColors.kShapesColor,
                    title: Text(getTitles(context)[e - 1]),
                    value: e,
                    groupValue: currentValue.value,
                    onChanged: (newValue) {
                      // newValue = e;
                      currentValue.value = e;
                      print(currentValue.value);
                    },
                  ),
                  e == currentValue.value && currentValue.value != 1
                      ? TransferForm(
                          paymentTypeId: e,
                          size: size,
                          amount: total,
                        )
                      : e == 1 && currentValue.value == 1
                          ? TransferForm(
                              paymentTypeId: e,
                              size: size,
                              amount: total,
                            )
                          : const SizedBox(),
                ],
              );
            }),
          ),
        )
        .toList();
  }

  List<String> getTitles(BuildContext context) => [
        "Payment when receiving".tr(context),
        "Transfer By Kuraimi".tr(context),
        "Transfer By Alnajm".tr(context),
        "Transfer By Al-qutaibi".tr(context),
        "Transfer By Kash".tr(context),
        "Transfer By Mobilee".tr(context),
      ];
  List<int> getValues() => [1, 2, 3, 4, 5, 6];
}

class TransferForm extends StatelessWidget {
  const TransferForm(
      {Key? key, required this.size, required this.paymentTypeId, this.amount})
      : super(key: key);
  final Size size;
  // final int value;
  final int? paymentTypeId;
  final int? amount;

  @override
  Widget build(BuildContext context) {
    final paymentCubit = BlocProvider.of<PaymentCubit>(context);
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentFailureState) {
          showSnackMessage(
            context: context,
            message: "fail",
            textColor: AppColors.kWhiteFonts,
            bkgColor: Colors.red,
          );
          PaymentScreen.currentIndex.value = 1;
        }
        if (state is PaymentSuccessState) {
          showSnackMessage(
            context: context,
            message: "success",
            textColor: AppColors.kWhiteFonts,
            bkgColor: AppColors.kShapesColor,
          );
          PaymentScreen.currentIndex.value = 2;
        }
      },
      builder: (context, state) {
        if (state is PaymentLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Form(
          key: paymentCubit.formKey,
          child: paymentTypeId == 1
              ? Column(
                  children: [
                    CustomTextFieldAddress(
                      size: size,
                      maxLines: 1,
                      textInputType: TextInputType.phone,
                      label: 'phone_number'.tr(context),
                      maxLength: 50,
                      controller: paymentCubit.phoneNumberController,
                    ),
                  ],
                )
              : Column(
                  children: [
                    Text(
                      "${"Our account number is".tr(context)} 5566892",
                      style: TextStyle(
                        fontSize: size.width * 0.035,
                        color: AppColors.kShapesColor,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    CustomTextFieldAddress(
                      size: size,
                      maxLines: 1,
                      label: 'Sender Name'.tr(context),
                      maxLength: 50,
                      controller: paymentCubit.senderNameController,
                    ),
                    CustomTextFieldAddress(
                      size: size,
                      maxLines: 1,
                      textInputType: TextInputType.phone,
                      label: 'phone_number'.tr(context),
                      maxLength: 50,
                      controller: paymentCubit.phoneNumberController,
                    ),
                    CustomTextFieldAddress(
                      size: size,
                      maxLines: 1,
                      label: 'remittance number'.tr(context),
                      maxLength: 50,
                      controller: paymentCubit.remittanceNumberController,
                    ),
                  ],
                ),
        );
      },
    );
  }
}

///***** https://youtu.be/vrMqFCj1gsw
