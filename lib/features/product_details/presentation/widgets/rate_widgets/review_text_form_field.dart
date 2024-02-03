import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_ecommerce/features/product_details/presentation/cubit/rate_cubit/rate_cubit.dart';

class ReviewTextFormField extends StatelessWidget {
  const ReviewTextFormField({Key? key, required this.size}) : super(key: key);
  final Size size;
  @override
  Widget build(BuildContext context) {
    return Form(
        key: BlocProvider.of<RateCubit>(context).formKey,
        child: SizedBox(
          child: TextFormField(
            controller: BlocProvider.of<RateCubit>(context).contentController,
            decoration: InputDecoration(
              hintText: 'Describe your experience',
              hintStyle: Theme.of(context).textTheme.headline1!.copyWith(
                    fontSize: size.width * 0.04,
                    color: Colors.black38,
                  ),
              // labelText: 'Describe your experience',
            ),
            maxLines: 4,
          ),
        ));
  }
}
