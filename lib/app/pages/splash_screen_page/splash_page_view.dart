import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pas_mobile_xi_2/app/pages/get_started_page/get_started_view.dart';
import 'package:pas_mobile_xi_2/common/theme/color_theme.dart';

class SplashScreenPageView extends StatelessWidget {
  const SplashScreenPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            primary,
            secondary,
          ],
        ),
      ),
      child: AnimatedSplashScreen(
        backgroundColor: Colors.transparent,
        splash: SvgPicture.asset(
          'assets/svg/app_logo.svg',
          width: width * 0.1,
          height: height * 0.1,
        ),
        nextScreen: const GetStartedView(),
        splashTransition: SplashTransition.fadeTransition,
        animationDuration: const Duration(milliseconds: 1000),
        pageTransitionType: PageTransitionType.fade,
        duration: 2700,
      ),
    );
  }
}
