import 'package:pas_mobile_xi_2/app/models/api_model.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'dart:convert';

import 'package:pas_mobile_xi_2/app/pages/wishlist_page/wishlist_page_controller.dart';

class DetailPageController extends GetxController {
  Rx<Product> data = Product(
    id: 0,
    title: '',
    description: '',
    price: 0,
    discountPercentage: 0,
    rating: 0,
    stock: 0,
    brand: '',
    category: '',
    thumbnail: '',
    images: [],
  ).obs;
  int idData = Get.arguments;
  RxBool load = false.obs;

  RxBool liked = false.obs;
  final WishlistPageController wishlistPageController =
      Get.put(WishlistPageController());

  @override
  void onInit() {
    super.onInit();
    loadData();
    print("Detail di buat");
    checkLiked();
  }

  loadData() async {
    try {
      final response =
          await http.get(Uri.parse('https://dummyjson.com/products/$idData'));

      if (response.statusCode == 200) {
        load.value = true;
        var responseData = json.decode(response.body) as Map<String, dynamic>;
        data.value = Product.fromJson(responseData);
        print("DETAIL PRODUCT: ${data.value.title}");
        checkLiked();
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  void checkLiked() {
    List<String> productTitles = wishlistPageController.getProductTitles();
    String productTitle = data.value.title;
    try {
      print('Product Titles: $productTitles');
      liked.value = false;
      for (var product in productTitles) {
        if (product == productTitle) {
          liked.value = true;
        } else {
          print("tidak ada data yang sama");
        }
      }

      if (liked.value == true) {
        print("Liked");
      } else {
        print("Not Liked");
      }
    } catch (e) {
      print("Error: $e");
    }
  }
}
