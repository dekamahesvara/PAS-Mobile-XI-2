import 'dart:convert';
import 'package:pas_mobile_xi_2/app/models/api_model.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePageController extends GetxController {
  late final SharedPreferences prefs;
  RxString username = ''.obs;
  RxBool successLoadAll = false.obs;
  RxBool successLoadSearch = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadDataAll();
  }

  Rx<ResponseModel> responseModel = ResponseModel(
    products: [],
    total: 0,
    skip: 0,
    limit: 0,
  ).obs;

  RxList<dynamic> responseCategoryModel = <dynamic>[].obs;

  loadDataAll() async {
    try {
      successLoadAll.value = false;
      final response =
          await http.get(Uri.parse('https://dummyjson.com/products?limit=100'));
      final responseCategory = await http
          .get(Uri.parse('https://dummyjson.com/products/categories'));
      final prefs = await SharedPreferences.getInstance();

      if (response.statusCode == 200) {
        responseModel.value = responseModelFromJson(response.body);
        responseCategoryModel.value = json.decode(responseCategory.body);
        successLoadAll.value = true;
        username.value = prefs.getString('username') ?? 'deka';
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      print("error: $e");
    }
  }

  loadDataByCategory(String categoryName) async {
    try {
      successLoadAll.value = false;
      final response = await http.get(
          Uri.parse('https://dummyjson.com/products/category/$categoryName'));
      print("Load data by category: $categoryName");

      if (response.statusCode == 200) {
        responseModel.value = responseModelFromJson(response.body);
        print("Load data by category: $categoryName TRUE");
        successLoadAll.value = true;
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      print("error: $e");
    }
  }

  loadDataBySearch(String searchQuery) async {
    try {
      successLoadSearch.value = false;

      final response = await http.get(
          Uri.parse('https://dummyjson.com/products/search?q=$searchQuery'));

      if (response.statusCode == 200) {
        responseModel.value = responseModelFromJson(response.body);
        successLoadSearch.value = true;
      } else {
        print('Search request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      print("Error during search: $e");
    }
  }

  final selectedCategory = "All".obs;

  void selectCategory(String categoryName) {
    selectedCategory.value = categoryName;
  }
}
