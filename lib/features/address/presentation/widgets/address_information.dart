import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_ecommerce/core/constants/app_colors.dart';
import 'package:mini_ecommerce/core/custom_widgets/custom_button.dart';
import 'package:mini_ecommerce/core/custom_widgets/snack_bar_message.dart';
import 'package:mini_ecommerce/features/address/domain/entities/user_address_entity.dart';
import 'package:mini_ecommerce/features/address/presentation/cubit/address_cubit.dart';
import 'package:mini_ecommerce/features/address/presentation/screens/hh.dart';
import 'package:mini_ecommerce/features/address/presentation/widgets/custom_address_field.dart';
import 'package:mini_ecommerce/features/address/presentation/widgets/custom_dropdown_city.dart';
import 'package:mini_ecommerce/injection_container.dart';

import 'custom_dropdown_region.dart';

class AddressInformation extends StatefulWidget {
  const AddressInformation({
    Key? key,
    required this.size,
    required this.isUpdate,
    this.userAddressEntity,
  }) : super(key: key);
  final Size size;
  // int? region;
  final UserAddressEntity? userAddressEntity;
  final bool isUpdate;
  @override
  State<AddressInformation> createState() => _AddressInformationState();
}

class _AddressInformationState extends State<AddressInformation> {
  final TextEditingController _streetNameController = TextEditingController();
  final TextEditingController _neighborhoodController = TextEditingController();
  final TextEditingController _nearestController = TextEditingController();
  int? _region;
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _secondNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();

  @override
  initState() {
    print(widget.isUpdate);
    print('**__ ${widget.userAddressEntity} __**');

    _streetNameController.text =
        widget.isUpdate ? widget.userAddressEntity!.streetName.toString() : "";
    _firstNameController.text =
        widget.isUpdate ? widget.userAddressEntity!.firstName.toString() : "";
    _secondNameController.text =
        widget.isUpdate ? widget.userAddressEntity!.secondName.toString() : "";
    _phoneNumberController.text =
        widget.isUpdate ? widget.userAddressEntity!.phoneNumber.toString() : "";
    _lastNameController.text =
        widget.isUpdate ? widget.userAddressEntity!.lastName.toString() : "";
    _neighborhoodController.text = widget.isUpdate
        ? widget.userAddressEntity!.neighborhood.toString()
        : "";
    _nearestController.text = widget.isUpdate
        ? widget.userAddressEntity!.nearestPlace.toString()
        : "";
    _region = widget.isUpdate
        ? int.parse(widget.userAddressEntity!.addressId.toString())
        : null;
    // print(widget.userAddressEntity!.firstName.toString());

    super.initState();
  }

  Future<void> _validateFormThenUpdateOrAdd() async {
    if (_formState.currentState!.validate()) {
      print("${_region.toString()} from -> _validateFormThenUpdateOrAdd");
      final UserAddressEntity userAddressEntity = UserAddressEntity(
        userId: getUserId(),
        firstName: _firstNameController.text,
        secondName: _secondNameController.text,
        phoneNumber: _phoneNumberController.text,
        streetName: _streetNameController.text,
        neighborhood: _neighborhoodController.text,
        nearestPlace: _nearestController.text,
        addressId: BlocProvider.of<AddressCubit>(context).region.toString(),
        lastName: _lastNameController.text,
      );
      widget.isUpdate
          ? BlocProvider.of<AddressCubit>(context).updateUserAddress(
              userAddressEntity: userAddressEntity, context: context)
          : await BlocProvider.of<AddressCubit>(context).addUserAddress(
              userAddressEntity: userAddressEntity, context: context);
    } else {
      print("not Valid");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formState,
      child: ListView(
        padding: EdgeInsets.only(
            left: widget.size.width * 0.04,
            right: widget.size.width * 0.04,
            bottom: widget.size.height * 0.04),
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///"Location Information",
          Text(
            "Location Information",
            style: Theme.of(context).textTheme.headline1!.copyWith(
                  fontSize: widget.size.width * 0.035,
                ),
          ),
          SizedBox(
            height: widget.size.height * 0.01,
          ),
          CustomTextFormAddressField(
            size: widget.size,
            label: "Street Name",
            controller: _streetNameController,
            maxLength: 35,
            maxLines: 2,
          ),
          CustomTextFormAddressField(
            size: widget.size,
            label: "Neighborhood Name",
            controller: _neighborhoodController,
            maxLength: 35,
            maxLines: 2,
          ),
          CustomTextFormAddressField(
            size: widget.size,
            label: "Nearest Place Name",
            controller: _nearestController,
            maxLength: 35,
            maxLines: 2,
          ),
          const Text(
            'Required',
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: widget.size.height * 0.01,
          ),
          CustomDropDownButtonCityField(
            size: widget.size,
            hint: "City",
            // key: _formState,
          ),
          SizedBox(
            height: widget.size.height * 0.01,
          ),
          CustomDropDownButtonRegionField(
            size: widget.size,
            hint: "Region",
          ),

          ///      "Personal Information",
          Text(
            "Personal Information",
            style: Theme.of(context).textTheme.headline1!.copyWith(
                  fontSize: widget.size.width * 0.035,
                ),
          ),
          SizedBox(
            height: widget.size.height * 0.01,
          ),
          CustomTextFormAddressField(
            size: widget.size,
            label: "First Name",
            controller: _firstNameController,
            maxLength: 35,
            maxLines: 2,
          ),
          CustomTextFormAddressField(
            size: widget.size,
            label: "Second Name",
            controller: _secondNameController,
            maxLength: 35,
            maxLines: 2,
          ),
          CustomTextFormAddressField(
            size: widget.size,
            label: "Last Name",
            controller: _lastNameController,
            maxLength: 35,
            maxLines: 2,
          ),
          CustomTextFormAddressField(
            size: widget.size,
            label: "Phone Number",
            controller: _phoneNumberController,
            maxLength: 35,
            maxLines: 2,
            textInputType: TextInputType.phone,
          ),
          SizedBox(
            height: widget.size.height * 0.01,
          ),

          BlocListener<AddressCubit, AddressState>(
            listener: (context, state) {
              if (state is AddressAddedSuccessState) {
                showSnackMessage(
                  context: context,
                  message: widget.isUpdate
                      ? "updated Successfully"
                      : "Address Added Successfully",
                  textColor: AppColors.white,
                  bkgColor: AppColors.kShapesColor,
                );
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => HnH()));
              } else if (state is AddressAddedFailState) {
                showSnackMessage(
                  context: context,
                  message: widget.isUpdate ? "udated fail" : "Fail add Address",
                  textColor: AppColors.white,
                  bkgColor: AppColors.kShapesColor,
                );
              }
            },
            child: Center(
              child: CustomButton(
                text: "Continue The Purchase",
                height: widget.size.height * 0.045,
                width: widget.size.width * 0.5,
                onTap: () async {
                  await _validateFormThenUpdateOrAdd();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
