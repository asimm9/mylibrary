import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:mylibrary/companants/colors.dart';
import 'package:mylibrary/companants/text_style.dart';
import 'package:mylibrary/pages/splash_screen_page/after_splash_screen.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    super.initState();

    startTime();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  startTime() {
    Duration duration = const Duration(milliseconds: 3110);
    return Timer(duration, routePage);
  }

  routePage() {
    return Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          const begin = Offset(0.0, 1.0);
          const end = Offset.zero;
          const curve = Curves.ease;
          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          return SlideTransition(
              position: animation.drive(tween),
              child: const AfterSplashScreen());
        },
      ),
    ).onError((error, stackTrace) =>
        const Center(child: CircularProgressIndicator()));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: Colors.black),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: size.height * 0.06,
              child: TweenAnimationBuilder(
                tween: Tween<double>(begin: 0.0, end: 0.6),
                duration: const Duration(seconds: 2),
                builder: (context, value, child) {
                  return SizedBox(
                    width: size.width * 0.7,
                    height: size.height * 0.7,
                    child: Opacity(
                      opacity: value,
                      child: LottieBuilder.asset(
                        'assets/animations/splash-scren-animation.json',
                        filterQuality: FilterQuality.high,
                        frameRate: FrameRate.max,
                      ),
                    ),
                  );
                },
              ),
            ),
            // Positioned(
            //   bottom: size.height * 0.12,
            //   child: TextLiquidFill(
            //     text: 'myLibrary',
            //     textStyle: splashScreenTextStyle,
            //     boxBackgroundColor: backgroundColor,
            //     waveColor: Colors.blueGrey.shade800,
            //     loadDuration: Duration(seconds: 4),
            //   ),
            // )
            Positioned(
              bottom: size.height * 0.33,
              child: AnimatedTextKit(
                pause: const Duration(microseconds: 1000),
                animatedTexts: [
                  TyperAnimatedText('myLibrary',
                      textStyle: splashScreenTextStyle,
                      speed: const Duration(milliseconds: 200)),
                  ColorizeAnimatedText(
                    'myLibrary',
                    textStyle: splashScreenTextStyle,
                    colors: colorizeColors,
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
