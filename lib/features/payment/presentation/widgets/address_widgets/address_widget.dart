import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_ecommerce/core/constants/app_colors.dart';
import 'package:mini_ecommerce/core/localization/app_localizations.dart';
import 'package:mini_ecommerce/features/payment/domain/entities/address_entities/address_entity.dart';
import 'package:mini_ecommerce/features/payment/presentation/cubits/address_cubits/payment_address_cubit.dart';
import 'package:mini_ecommerce/features/payment/presentation/cubits/address_cubits/region_cubit.dart';
import 'package:mini_ecommerce/features/payment/presentation/widgets/address_widgets/custom_text_form_address.dart';
import 'package:mini_ecommerce/features/payment/presentation/widgets/custom_dropdown_button_form_field.dart';
import 'package:mini_ecommerce/injection_container.dart';

class AddressWidget extends StatefulWidget {
  const AddressWidget(
      {Key? key,
      required this.size,
      this.addressEntity,
      required this.isUpdate})
      : super(key: key);
  final Size size;
  // int? region;
  final AddressEntity? addressEntity;
  final bool isUpdate;

  @override
  State<AddressWidget> createState() => _AddressWidgetState();
}

class _AddressWidgetState extends State<AddressWidget> {
  final TextEditingController _streetNameController = TextEditingController();
  final TextEditingController _neighborhoodController = TextEditingController();
  final TextEditingController _nearestController = TextEditingController();
  int? _region;
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _secondNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  List<CityEntity>? _cities;
  @override
  initState() {
    print(widget.isUpdate);
    print('**__ ${widget.addressEntity} __**');
    _streetNameController.text =
        widget.isUpdate ? widget.addressEntity!.streetName.toString() : "";
    _firstNameController.text =
        widget.isUpdate ? widget.addressEntity!.firstName.toString() : "";
    _secondNameController.text =
        widget.isUpdate ? widget.addressEntity!.secondName.toString() : "";
    _phoneNumberController.text =
        widget.isUpdate ? widget.addressEntity!.phoneNumber.toString() : "";
    _lastNameController.text =
        widget.isUpdate ? widget.addressEntity!.lastName.toString() : "";
    _neighborhoodController.text =
        widget.isUpdate ? widget.addressEntity!.neighborhood.toString() : "";
    _nearestController.text =
        widget.isUpdate ? widget.addressEntity!.nearestPlace.toString() : "";
    _region = widget.isUpdate
        ? int.parse(widget.addressEntity!.addressId.toString())
        : null;
    _cities = widget.addressEntity!.cities ?? [];
    // print(widget.addressEntity!.firstName.toString());

    super.initState();
  }

  Future<void> _validateFormThenUpdateOrAdd() async {
    if (_formState.currentState!.validate()) {
      print("${_region.toString()} from -> _validateFormThenUpdateOrAdd");
      final AddressEntity addressEntity = AddressEntity(
        userId: getUserId(),
        firstName: _firstNameController.text,
        secondName: _secondNameController.text,
        phoneNumber: _phoneNumberController.text,
        streetName: _streetNameController.text,
        neighborhood: _neighborhoodController.text,
        nearestPlace: _nearestController.text,
        addressId: _region.toString(),
        lastName: _lastNameController.text,
        cities: _cities,
      );
      widget.isUpdate
          ? BlocProvider.of<PaymentAddressCubit>(context)
              .updateUserAddress(addressEntity: addressEntity, context: context)
          : BlocProvider.of<PaymentAddressCubit>(context).addUserAddress(
              context: context,
              addressEntity: addressEntity,
            );
    } else {
      print("not Valid");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formState,
      child: Stack(
        children: [
          ListView(
            // physics: const NeverScrollableScrollPhysics(),
            // shrinkWrap: true,
            padding: EdgeInsets.only(
              bottom: widget.size.height * 0.1,
            ),
            children: [
              Text(
                "location_information".tr(context),
                style: Theme.of(context).textTheme.headline1!.copyWith(
                      fontSize: widget.size.width * 0.035,
                    ),
              ),
              CustomTextFieldAddress(
                size: widget.size,
                label: "street_name".tr(context),
                controller: _streetNameController,
                maxLength: 35,
                maxLines: 2,
              ),
              CustomTextFieldAddress(
                size: widget.size,
                label: "neighborhood_name".tr(context),
                controller: _neighborhoodController,
                maxLength: 35,
                maxLines: 2,
              ),
              CustomTextFieldAddress(
                size: widget.size,
                label: "nearest_place".tr(context),
                controller: _nearestController,
                maxLength: 35,
                maxLines: 2,
              ),
              Text(
                'required'.tr(context),
                style: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),

              ///city
              CustomDropdownButtonFormField(
                value: widget.addressEntity!.cityNumber.toString(),
                onChange: (c) {
                  print(c);

                  BlocProvider.of<RegionCubit>(context).getRegion(
                    int.parse(
                      c.toString(),
                    ),
                    context,
                  );
                  print(c);
                },
                // cityOrRegion: widget.addressEntity!.cities!.toList(),
                cityOrRegion: _cities!.toList(),
                size: widget.size,
                hint: 'city'.tr(context),
                isCity: true,
              ),
              SizedBox(
                height: widget.size.height * 0.015,
              ),
              BlocBuilder<RegionCubit, RegionState>(
                builder: (context, state) {
                  if (state is RegionSuccessState) {
                    return CustomDropdownButtonFormField(
                      value: widget.addressEntity!.addressId.toString(),
                      onChange: (c) {},
                      cityOrRegion: state
                          .regionEntity.addressRegionDataEntityList!
                          .toList(),
                      size: widget.size,
                      hint: 'region'.tr(context),
                      isCity: false,
                    );
                  }
                  return CustomDropdownButtonFormField(
                    value: widget.addressEntity!.addressId.toString(),
                    onChange: (c) {},
                    cityOrRegion: [],
                    size: widget.size,
                    hint: 'region'.tr(context),
                    isCity: false,
                  );
                },
              ),
              Text(
                "personal_information".tr(context),
                style: Theme.of(context).textTheme.headline1!.copyWith(
                      fontSize: widget.size.width * 0.035,
                    ),
              ),
              SizedBox(
                height: widget.size.height * 0.01,
              ),
              CustomTextFieldAddress(
                size: widget.size,
                label: "first_name".tr(context),
                controller: _firstNameController,
                maxLength: 35,
                maxLines: 2,
              ),
              CustomTextFieldAddress(
                size: widget.size,
                label: "second_name".tr(context),
                controller: _secondNameController,
                maxLength: 35,
                maxLines: 2,
              ),
              CustomTextFieldAddress(
                size: widget.size,
                label: "last_name".tr(context),
                controller: _lastNameController,
                maxLength: 35,
                maxLines: 2,
              ),
              CustomTextFieldAddress(
                size: widget.size,
                label: "phone_number".tr(context),
                controller: _phoneNumberController,
                maxLength: 35,
                maxLines: 2,
                textInputType: TextInputType.phone,
              ),
              SizedBox(
                height: widget.size.height * 0.01,
              ),
            ],
          ),
          Positioned(
            bottom: widget.size.height * 0.1,
            right: widget.size.width * 0.02,
            left: widget.size.width * 0.02,
            child: InkWell(
              onTap: () {
                _validateFormThenUpdateOrAdd();
              },
              child: Container(
                color: AppColors.kShapesColor,
                height: widget.size.height * 0.05,
                width: widget.size.width * 0.8,
                child: Center(
                  child: Text(
                    'confirm'.tr(context),
                    style: TextStyle(
                        color: AppColors.kWhiteFonts,
                        fontSize: widget.size.width * 0.04,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
