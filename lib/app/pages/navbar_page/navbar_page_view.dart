import 'package:flutter/material.dart';
import 'package:pas_mobile_xi_2/app/pages/cart_page/cart_page_view.dart';
import 'package:pas_mobile_xi_2/app/pages/home_page/home_page_view.dart';
import 'package:pas_mobile_xi_2/app/pages/profile_page/profile_page_view.dart';
import 'package:pas_mobile_xi_2/app/pages/wishlist_page/wishlist_page_view.dart';
import 'package:pas_mobile_xi_2/common/theme/color_theme.dart';

class NavbarPageView extends StatelessWidget {
  const NavbarPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: Column(
          children: [
            Flexible(
              child: TabBarView(
                children: <Widget>[
                  Center(
                    child: HomePageView(),
                  ),
                  const Center(
                    child: WishlistPageView(),
                  ),
                  const Center(
                    child: CartPageView(),
                  ),
                  const Center(
                    child: ProfilePageView(),
                  ),
                ],
              ),
            ),
            const TabBar(
              labelColor: primary,
              unselectedLabelColor: gray,
              padding: EdgeInsets.all(5),
              dividerColor: Colors.transparent,
              tabs: <Widget>[
                Tab(child: Icon(Icons.home, size: 30)),
                Tab(child: Icon(Icons.favorite, size: 30)),
                Tab(child: Icon(Icons.shopping_cart, size: 30)),
                Tab(child: Icon(Icons.person, size: 30)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
