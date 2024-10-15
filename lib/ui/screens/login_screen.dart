import 'package:flutter/material.dart';
import 'package:hrms/ui/widgets/buttons/default_btn.dart';
import 'package:hrms/ui/widgets/buttons/icon_btn.dart';
import 'package:hrms/ui/widgets/text_forms/default_textfields.dart';
import 'package:hrms/utils/color.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  DefaultIconButton(
                    label: 'Butuh Bantuan',
                    icon: Icons.headset_mic_outlined,
                    onPressed: () {},
                    bgColor: AppColors.primarySwatch.shade50,
                    fgColor: AppColors.primarySwatch.shade500,
                  ),
                ],
              ),
            ),
            Image.asset(
              'assets/logo/logo_primary.png',
              width: 183,
              height: 183,
            ),
            FormsApp()
          ],
        ),
      ),
    );
  }
}

class FormsApp extends StatelessWidget {
  const FormsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InputFields(
            label: 'Email',
            isPasswordField: false,
          ),
          SizedBox(height: 16,),
          InputFields(
            label: 'Password',
            isPasswordField: true,
          ),
          SizedBox(
            height: 4,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                child: Text(
                  'Lupa Password?',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.primaryColor,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 16,
          ),
          SizedBox(
            width: double.infinity,
            child: DefaultButton(
              label: 'Masuk',
              onPressed: () {},
              bgColor: AppColors.primaryColor,
              fgColor: AppColors.backgroundColor
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            'App v1.0',
            style: TextStyle(
              color: AppColors.greyColor
            ),
          ),
        ],
      ),
    );
  }
}