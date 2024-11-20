import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:maca/screen/home_screen.dart';
import 'package:maca/screen/login_screen.dart';
import 'package:maca/styles/colors/app_colors.dart';

class StartUpScreen extends StatefulWidget {
  const StartUpScreen({super.key});

  @override
  State<StartUpScreen> createState() => _StartUpScreenState();
}

class _StartUpScreenState extends State<StartUpScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        color: AppColors.theme,
        child: SvgPicture.asset(
          'assets/APPSVGICON/maca.svg',
          width: 50,
          height: 50,
        ),
      ),
    );
  }
}
