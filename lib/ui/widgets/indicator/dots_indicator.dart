import 'package:flutter/material.dart';
import 'package:hrms/data/repositories/onboarding_repository.dart';
import 'package:provider/provider.dart';
import 'package:hrms/domain/providers/onboarding_provider.dart';
import 'package:hrms/utils/color.dart';

class DotsIndicator extends StatelessWidget {
  const DotsIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final onboardingProvider = Provider.of<OnboardingProvider>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        onboardingPages.length,
        (index) => AnimatedContainer(
          duration: Duration(milliseconds: 300),
          margin: EdgeInsets.symmetric(horizontal: 5),
          height: 8,
          width: onboardingProvider.currentPage == index ? 24 : 8,
          decoration: BoxDecoration(
            color: onboardingProvider.currentPage == index
                ? AppColors.primarySwatch.shade500
                : AppColors.primarySwatch.shade100,
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}
