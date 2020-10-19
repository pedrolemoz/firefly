import 'dart:async';

import 'package:WolfBeat/app/modules/welcome/pages/welcome_page.dart';
import 'package:WolfBeat/core/helpers/assets_helper.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static final String id = 'splash_screen_page';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Timer(Duration(seconds: 3),
        () => Navigator.pushNamed(context, WelcomePage.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                AssetsHelper.wolfBeatLogo,
                height: 180.0,
              ),
            ),
            FadeAnimatedTextKit(
              text: ['WolfBeat'],
              textStyle: Theme.of(context).textTheme.headline4,
            ),
            TyperAnimatedTextKit(
              text: ['Músicas que inspiram sua vida'],
              textStyle: Theme.of(context)
                  .textTheme
                  .subtitle1
                  .copyWith(fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
