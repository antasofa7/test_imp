import 'package:flutter/material.dart';
import 'package:my_apps/theme.dart';
import 'package:shimmer/shimmer.dart';

class LoadingContainer extends StatelessWidget {
  final double width;
  final double height;
  final EdgeInsets margin;

  const LoadingContainer(
      {super.key,
      required this.width,
      required this.height,
      required this.margin});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: neutral300,
      highlightColor: neutral200,
      child: Container(
        width: width,
        height: height,
        margin: margin,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.0),
          color: neutral300,
        ),
      ),
    );
  }
}
