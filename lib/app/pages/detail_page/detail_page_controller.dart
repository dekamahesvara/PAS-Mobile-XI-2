import 'package:pas_mobile_xi_2/app/models/api_model.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'dart:convert';

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
  String idData = Get.arguments;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  loadData() async {
    try {
      print('https://dummyjson.com/products/$idData');
      final response =
          await http.get(Uri.parse('https://dummyjson.com/products/$idData'));
      if (response.statusCode == 200) {
        var responses = json.decode(response.body) as Map<String, dynamic>;
        data.value = Product.fromJson(responses);
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      print("error: $e");
    }
  }
}
