import 'package:flutter/material.dart';

class FavoriteImageProduct extends StatelessWidget {
  const FavoriteImageProduct({
    Key? key,
    required this.height,
    required this.width,
    required this.imageUrl,
  }) : super(key: key);

  final double height;
  final double width;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * 0.8,
      width: width * 0.8,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.0),

          // color: Colors.black.withOpacity(0.06),
          borderRadius: BorderRadius.circular(width * 0.05),
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            alignment: Alignment.center,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
