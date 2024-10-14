import 'package:flutter/material.dart';
import 'package:hrms/domain/providers/splash_provider.dart';
import 'package:hrms/utils/color.dart';
import 'package:provider/provider.dart';

class SplashScreens extends StatelessWidget {
  const SplashScreens({super.key});

  @override
  Widget build(BuildContext context) {
    final splashProvider = Provider.of<SplashProvider>(context);

    if (splashProvider.isLoading) {
      Future.microtask(() => splashProvider.loadData(context));
    }

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: splashProvider.isLoading
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage('assets/logo/logo_primary.png'),
                    width: 200,
                    height: 200,
                  ),
                  SizedBox(height: 16,),
                  CircularProgressIndicator(
                    color:AppColors.primaryColor,
                  ),
                ],
              )
            : Container(),
      ),
    );
  }
}
