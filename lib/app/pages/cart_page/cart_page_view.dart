import 'package:flutter/material.dart';
import 'package:pas_mobile_xi_2/app/data/cart_data.dart';
import 'package:pas_mobile_xi_2/app/pages/cart_page/widget/cart_item_container.dart';
import 'package:pas_mobile_xi_2/common/theme/color_theme.dart';

class CartPageView extends StatelessWidget {
  const CartPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double height = mediaQuery.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Container(
            height: height * 0.3,
            child: ListView.builder(
              itemCount: cartItems.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return CartItemContainer(
                  image: cartItems[index].productImage,
                  name: cartItems[index].productName,
                  price: cartItems[index].productPrice,
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: black,
              height: height * 0.1,
            ),
          )
        ],
      ),
    );
  }
}
