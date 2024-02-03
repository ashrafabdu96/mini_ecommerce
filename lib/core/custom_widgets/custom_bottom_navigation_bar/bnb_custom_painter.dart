import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_ecommerce/core/constants/app_colors.dart';
import 'package:mini_ecommerce/features/home/home/presentation/cubit/base_home_cubit/base_home_cubit.dart';

class BnBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = const Color(0xfff69b7a)
      ..style = PaintingStyle.fill
      ..colorFilter;
    // jump to the first point
    Path path = Path()..moveTo(0, size.height * 0.20);
    path.quadraticBezierTo(
        size.width * 0.20, size.height * 0, size.width * 0.35, size.height * 0);
    path.quadraticBezierTo(size.width * 0.40, size.height * 0,
        size.width * 0.410, size.height * 0.20);
    path.arcToPoint(
      Offset(size.width * 0.59, size.height * 0.20),
      radius: Radius.circular(size.height * 0.1),
      clockwise: false,
    );
    path.quadraticBezierTo(
        size.width * 0.60, size.height * 0, size.width * 0.65, size.height * 0);
    path.quadraticBezierTo(
        size.width * 0.80, size.height * 0, size.width, size.height * 0.20);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width * 0, size.height);
    path.close();
    canvas.drawShadow(path, AppColors.black, 250, false);

    ///this function collect all the points from the path and draw the shape
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

///*******************************
class CustomFAB extends StatelessWidget {
  const CustomFAB(
      {Key? key, required this.height, required this.width, this.onPressed})
      : super(key: key);
  final double height;
  final double width;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width * 0.2,
      height: height * 0.07,
      child: FloatingActionButton(
        elevation: 2,
        onPressed: onPressed,
        backgroundColor: AppColors.kShapesColor,
        shape: const CircleBorder(
          side: BorderSide(color: AppColors.grey2800, width: 2),
        ),
        child: Icon(
          Icons.shopping_cart_outlined,
          size: width * 0.07,
          color: AppColors.white,
        ),
      ),
    );
  }
}

class CustomBnBItems extends StatelessWidget {
  const CustomBnBItems({Key? key, required this.height, required this.width})
      : super(key: key);
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height * 0.08,
      child: BlocBuilder<BaseHomeCubit, BaseHomeState>(
        buildWhen: (p, c) {
          if (p is BaseHomeInitial || c is BaseHomeInitial) {
            return true;
          }
          return true;
        },
        builder: (context, state) {
          return state is BaseHomeInitial
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                      ...List.generate(
                        state.pages.length + 1,
                        (index) {
                          int i = index > 2 ? index - 1 /*2*/ : index;
                          return index == 2
                              ? const Spacer()
                              : CustomButtonNavigationBar(
                                  title: state.bottomAppBarTitleList[i],
                                  icon: state.bottomAppBarIconList[i],
                                  onPressed: () {
                                    BlocProvider.of<BaseHomeCubit>(context)
                                        .changePage(i);
                                    // Navigator.push(
                                    //     context, MaterialPageRoute(builder: (_) => pages[i],),);
                                  },
                                  active:
                                      state.currentIndex == i ? true : false,
                                  height: height,
                                  width: width,
                                );
                        },
                      ),
                    ])
              : const SizedBox();
        },
      ),
    );
  }
}

class CustomButtonNavigationBar extends StatelessWidget {
  const CustomButtonNavigationBar(
      {Key? key,
      required this.title,
      required this.icon,
      this.onPressed,
      this.active,
      required this.height,
      required this.width})
      : super(key: key);
  final double height;
  final double width;
  final String title;
  final IconData icon;
  final bool? active;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color:
                active == true ? AppColors.kOrangeFontColor : AppColors.white,
          ),
          Text(
            title,
            style: TextStyle(
              color:
                  active == true ? AppColors.kOrangeFontColor : AppColors.white,
              fontWeight: FontWeight.bold,
              fontSize: width * 0.024,
            ),
          ),
        ],
      ),
    );
  }
}

class MyCustomBottomNavigationBar2 extends StatelessWidget {
  final double height;
  final double width;

  const MyCustomBottomNavigationBar2(
      {super.key, required this.height, required this.width});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomPaint(
          size: Size(width, height * 0.08),
          painter: BnBCustomPainter(),
          // child: SizedBox(),

          // child: ,
        ),
        Center(
          heightFactor: 0.5,
          // widthFactor: 0.1,
          child: CustomFAB(height: height, width: width),
        ),
        CustomBnBItems(height: height, width: width),
      ],
    );
  }
}
