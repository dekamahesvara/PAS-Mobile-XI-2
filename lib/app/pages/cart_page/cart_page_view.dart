import 'package:flutter/material.dart';
import 'package:pas_mobile_xi_2/app/data/cart_data.dart';
import 'package:pas_mobile_xi_2/app/pages/cart_page/widget/cart_item_container.dart';
import 'package:pas_mobile_xi_2/common/theme/color_theme.dart';
import 'package:pas_mobile_xi_2/common/theme/text_theme.dart';
import 'package:get/get.dart';

class CartPageView extends StatelessWidget {
  const CartPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: black.withOpacity(0.2),
                    spreadRadius: 4,
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (BuildContext context, int index) {
                  return CartItemContainer(
                    image: cartItems[index].productImage,
                    name: cartItems[index].productName,
                    price: cartItems[index].productPrice,
                  );
                },
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: black.withOpacity(0.2),
                  spreadRadius: 4,
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Delivery Address",
                      style: textBlack600,
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                        color: black,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 5),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: black,
                        size: 40,
                      ),
                      const SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("123 Main Street", style: textBlack500),
                          Text("New York City", style: textGray400),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "Payment Method",
                      style: textBlack600,
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                        color: black,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 5),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.payment,
                        color: Colors.black,
                        size: 40,
                      ),
                      const SizedBox(width: 15),
                      Text("Gopay", style: textBlack500),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Order Info",
                      style: textBlack600,
                    ),
                    Row(
                      children: [
                        Text(
                          "Subtotal",
                          style: textGray500,
                        ),
                        const Spacer(),
                        Text(
                            '\$${cartItems.map((e) => e.productPrice).reduce((value, element) => value + element)}',
                            style: textBlack500),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Shipping Fee",
                          style: textGray500,
                        ),
                        const Spacer(),
                        Text(
                            '\$${cartItems.map((e) => e.productPrice).reduce((value, element) => value + element)}',
                            style: textBlack500),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Total",
                          style: textGray500,
                        ),
                        const Spacer(),
                        Text(
                            '\$${cartItems.map((e) => e.productPrice).reduce((value, element) => value + element)}',
                            style: textBlack500),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          checkOutButton()
        ],
      ),
    );
  }
}

Container checkOutButton() {
  return Container(
    margin: const EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 15),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(50),
      color: white,
      boxShadow: [
        BoxShadow(
          color: black.withOpacity(0.2),
          spreadRadius: 4,
          blurRadius: 12,
          offset: const Offset(0, 6),
        ),
      ],
    ),
    child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            width: double.infinity,
            child: Text("CheckOut",
                style: textWhite500, textAlign: TextAlign.center))),
  );
}
