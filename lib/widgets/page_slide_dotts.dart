import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Dotts extends StatelessWidget {
  final int activeindex, count;
  const Dotts({super.key, required this.activeindex, required this.count});

  @override
  Widget build(BuildContext context) {
    return AnimatedSmoothIndicator(
      activeIndex: activeindex,
      count: count,
      effect: SlideEffect(
        dotColor: Colors.grey,
        dotHeight: 9,
        dotWidth: 9,
        activeDotColor: Colors.blue,
      ),
    );
  }
}
