import 'package:flutter/material.dart';
import 'package:pas_mobile_xi_2/app/data/wishlist_data.dart';
import 'package:pas_mobile_xi_2/app/pages/wishlist_page/widget/build_product_card.dart';
import 'package:pas_mobile_xi_2/common/theme/text_theme.dart';

class WishlistPageView extends StatelessWidget {
  const WishlistPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double height = mediaQuery.height;

    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'Wishlist',
          style: textBlack600,
        )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    mainAxisExtent: height * 0.35),
                itemCount: wishlistItems.length,
                itemBuilder: (BuildContext context, int index) {
                  return BuildProductCard(
                    image: wishlistItems[index].productImage,
                    name: wishlistItems[index].productName,
                    price: wishlistItems[index].productPrice,
                  );
                },
              ),
            ),
            const SizedBox(
              height: 80,
            )
          ],
        ),
      ),
    );
  }
}
