import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_xi_2/app/pages/profile_page/profile_page_controller.dart';
import 'package:pas_mobile_xi_2/app/pages/profile_page/widget/build_list_tile.dart';
import 'package:pas_mobile_xi_2/common/theme/color_theme.dart';

class ProfilePageView extends GetView<ProfilePageController> {
  const ProfilePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double containerHeight = MediaQuery.of(context).size.height * 0.1;
    double containerWidth = MediaQuery.of(context).size.width * 0.2;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 6.0,
                    horizontal: 16.0,
                  ),
                  width: containerWidth,
                  height: containerHeight,
                  color: Colors.white,
                  child: ClipOval(
                    child: Image.asset(
                      'assets/image_sample.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 6.0,
                    horizontal: 16.0,
                  ),
                  child: Text(
                    'Your Username',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: black,
                    ),
                  ),
                ),
              ],
            ),
          ),
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
              text: 'Log Out',
              onPressed: () {},
              iconColor: red,
              textColor: red,
            ),
          ),
        ],
      ),
    );
  }
}