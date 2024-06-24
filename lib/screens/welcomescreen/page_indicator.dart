// The PageIndicator is a small circle that shows the current page of the
// PageView. It is triggered by a swipe or by tapping the indicator.

import 'package:flutter/material.dart';
import 'package:plotsfolio/utils/utils.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator({
    required this.pageIndex,
    required this.currentPage,
    required this.pageController,
    super.key,
  });

  final int pageIndex;
  final int currentPage;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        pageController.animateToPage(
          pageIndex,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        );
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 16,
        height: 16,
        decoration: BoxDecoration(
          color: currentPage == pageIndex ? Utils.flame : Utils.gunMetal,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
