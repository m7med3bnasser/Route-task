import 'dart:math';

import 'package:flutter/material.dart';
import 'package:task_route/pages/home/home_screen.dart';
import 'package:task_route/shared/custom_extension.dart';
import 'package:shimmer/shimmer.dart';
import 'package:task_route/shared/custom_extension.dart';

class ShimmerProductScreen extends StatefulWidget {
  static const String routeName = "LoadingAnimation";

  const ShimmerProductScreen({super.key});
  @override
  State<ShimmerProductScreen> createState() => _ShimmerProductScreenState();
}

class _ShimmerProductScreenState extends State<ShimmerProductScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.812,
      child: GridView.builder(
        padding: EdgeInsets.symmetric(vertical: 20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 13,
          crossAxisSpacing: 13,
          childAspectRatio: 0.77,
        ),
        itemBuilder: (context, index) => Shimmer.fromColors(
          baseColor: Color.fromARGB(255, 207, 207, 207),
          highlightColor: Color.fromARGB(255, 255, 255, 255),
          child: Container(
            height: 240,
            width: 175,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: Colors.grey,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Container(
                    height: 120,
                    width: double.infinity,
                    color: Colors.grey.shade200,
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 5,
                  ),
                  child: Container(
                    height: 17,
                    width: 80,
                    color: Colors.grey.shade200,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 17,
                        width: 50,
                        color: Colors.grey.shade200,
                      ),
                      Spacer(),
                      Container(
                        height: 38,
                        width: 38,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey.shade200,
                        ),
                      ),
                    ],
                  ),
                ),
                10.height,
              ],
            ),
          ),
        ),
        itemCount: 6,
      ),
    );
  }
}