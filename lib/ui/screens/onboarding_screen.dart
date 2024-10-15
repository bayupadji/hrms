import 'package:flutter/material.dart';
import 'package:hrms/data/repositories/onboarding_repository.dart';
import 'package:hrms/providers/onboarding/onboarding_provider.dart';
import 'package:hrms/ui/widgets/buttons/default_btn.dart';
import 'package:hrms/ui/widgets/indicator/dots_indicator.dart';
import 'package:hrms/ui/widgets/onboarding/content_onboarding.dart';
import 'package:hrms/utils/color.dart';
import 'package:provider/provider.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final onBoardingProvider = Provider.of<OnboardingProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                onBoardingProvider.onMove(context);
              },
              child: Container(
                padding: EdgeInsets.all(24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'skip',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primarySwatch.shade500),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Icon(
                      Icons.chevron_right,
                      size: 24,
                      color: AppColors.primarySwatch.shade500,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16,),
            Expanded(child: PageView.builder(
              controller: onBoardingProvider.pageController,
              onPageChanged: onBoardingProvider.setCurrentPage,
              itemCount: onboardingPages.length,
              itemBuilder: (context, index) {
                return OnboardingContent(
                  onboardingData: onboardingPages[index]
                );
              }),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DotsIndicator(),
                  DefaultButton(
                    label: 'Masuk',
                    bgColor: AppColors.primarySwatch.shade500,
                    fgColor: AppColors.backgroundColor,
                    onPressed: () {
                      onBoardingProvider.onMove(context);
                    }
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
