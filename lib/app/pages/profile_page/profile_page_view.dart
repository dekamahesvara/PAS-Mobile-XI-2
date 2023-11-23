import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_xi_2/app/pages/profile_page/profile_page_controller.dart';
import 'package:pas_mobile_xi_2/app/pages/profile_page/widget/build_list_tile.dart';
import 'package:pas_mobile_xi_2/common/theme/color_theme.dart';
import 'package:pas_mobile_xi_2/common/theme/text_theme.dart';

class ProfilePageView extends GetView<ProfilePageController> {
  ProfilePageView({Key? key}) : super(key: key);
  final ProfilePageController profilePageController =
      Get.put(ProfilePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'Profile',
          style: textBlack600,
        )),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildListTile(
            icon: Icons.info,
            text: 'Account Information',
            onPressed: () {},
            iconColor: black,
            textColor: black,
          ),
          buildListTile(
            icon: Icons.lock,
            text: 'Password',
            onPressed: () {},
            iconColor: black,
            textColor: black,
          ),
          buildListTile(
            icon: Icons.shopping_bag,
            text: 'Order',
            onPressed: () {},
            iconColor: black,
            textColor: black,
          ),
          buildListTile(
            icon: Icons.account_balance_wallet,
            text: 'My Card',
            onPressed: () {},
            iconColor: black,
            textColor: black,
          ),
          buildListTile(
            icon: Icons.favorite,
            text: 'Wishlist',
            onPressed: () {},
            iconColor: black,
            textColor: black,
          ),
          buildListTile(
            icon: Icons.settings,
            text: 'Settings',
            onPressed: () {},
            iconColor: black,
            textColor: black,
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: buildListTile(
              icon: Icons.logout,
              text: 'Sign Out',
              onPressed: () {
                profilePageController.clearToken();
              },
              iconColor: red,
              textColor: red,
            ),
          ),
        ],
      ),
    );
  }
}
