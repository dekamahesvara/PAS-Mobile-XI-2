import 'package:get/get.dart';

import 'package:pas_mobile_xi_2/app/pages/payment_page/payment_page_binding.dart';
import 'package:pas_mobile_xi_2/app/pages/payment_page/payment_page_view.dart';

import 'package:pas_mobile_xi_2/app/pages/wishlist_page/wishlist_page_binding.dart';
import 'package:pas_mobile_xi_2/app/pages/wishlist_page/wishlist_page_view.dart';

import 'package:pas_mobile_xi_2/app/pages/cart_page/cart_page_binding.dart';
import 'package:pas_mobile_xi_2/app/pages/cart_page/cart_page_view.dart';

import 'package:pas_mobile_xi_2/app/pages/home_page/home_page_binding.dart';
import 'package:pas_mobile_xi_2/app/pages/home_page/home_page_view.dart';

import 'package:pas_mobile_xi_2/app/pages/sign_up_page/sign_up_binding.dart';
import 'package:pas_mobile_xi_2/app/pages/sign_up_page/sign_up_view.dart';

import 'package:pas_mobile_xi_2/app/pages/sign_in_page/sign_in_binding.dart';
import 'package:pas_mobile_xi_2/app/pages/sign_in_page/sign_in_view.dart';

import 'package:pas_mobile_xi_2/app/pages/get_started_page/get_started_binding.dart';
import 'package:pas_mobile_xi_2/app/pages/get_started_page/get_started_view.dart';

import 'package:pas_mobile_xi_2/app/pages/splash_screen_page/splash_page_binding.dart';
import 'package:pas_mobile_xi_2/app/pages/splash_screen_page/splash_page_view.dart';

import 'package:pas_mobile_xi_2/common/routes/app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.splashscreenpage;

  static final routes = [
    GetPage(
      name: Routes.splashscreenpage,
      page: () => const SplashScreenPageView(),
      binding: SplashScreenPageBinding(),
    ),
    GetPage(
      name: Routes.getstartedpage,
      page: () => const GetStartedView(),
      binding: GetStartedBinding(),
    ),
    GetPage(
      name: Routes.signinpage,
      page: () => const SignInPageView(),
      binding: SignInPageBinding(),
    ),
    GetPage(
      name: Routes.signuppage,
      page: () => const SignUpPageView(),
      binding: SignUpPageBinding(),
    ),
    GetPage(
      name: Routes.homepage,
      page: () => const HomePageView(),
      binding: HomePageBinding(),
    ),
    GetPage(
      name: Routes.cartpage,
      page: () => const CartPageView(),
      binding: CartPageBinding(),
    ),
    GetPage(
      name: Routes.wishlistpage,
      page: () => const WishlistPageView(),
      binding: WishlistPageBinding(),
    ),
    GetPage(
      name: Routes.paymentpage,
      page: () => const PaymentPageView(),
      binding: PaymentPageBinding(),
    ),
  ];
}
