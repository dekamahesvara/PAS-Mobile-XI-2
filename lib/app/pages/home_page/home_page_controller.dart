import 'dart:convert';
import 'package:pas_mobile_xi_2/app/models/api_model.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePageController extends GetxController {
  late final SharedPreferences prefs;
  late String username = '';

  loadData() async {
    prefs = await SharedPreferences.getInstance();
    username = prefs.getString('username') ?? 'deka';
  }

  Rx<ResponseModel> responseModel = ResponseModel(
    products: [],
    total: 0,
    skip: 0,
    limit: 0,
  ).obs;

  RxList<dynamic> responseCategoryModel = <dynamic>[].obs;

  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadDataAll();
    loadData();
  }

  loadDataAll() async {
    try {
      isLoading.value = true;

      final response =
          await http.get(Uri.parse('https://dummyjson.com/products?limit=100'));
      final responseCategory = await http
          .get(Uri.parse('https://dummyjson.com/products/categories'));

      if (response.statusCode == 200) {
        responseModel.value = responseModelFromJson(response.body);
        responseCategoryModel.value = json.decode(responseCategory.body);
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      print("error: $e");
    } finally {
      isLoading.value = false;
    }
  }

  loadDataByCategory(String categoryName) async {
    try {
      isLoading.value = true;

      final response = await http.get(
          Uri.parse('https://dummyjson.com/products/category/$categoryName'));
      print("Load data by category: $categoryName");

      if (response.statusCode == 200) {
        responseModel.value = responseModelFromJson(response.body);
        print("Load data by category: $categoryName TRUE");
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      print("error: $e");
    } finally {
      isLoading.value = false;
    }
  }

  loadDataBySearch(String searchQuery) async {
    try {
      isLoading.value = true;

      final response = await http.get(
          Uri.parse('https://dummyjson.com/products/search?q=$searchQuery'));

      if (response.statusCode == 200) {
        responseModel.value = responseModelFromJson(response.body);
      } else {
        print('Search request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      print("Error during search: $e");
    } finally {
      isLoading.value = false;
    }
  }

  final selectedCategory = "All".obs;

  void selectCategory(String categoryName) {
    selectedCategory.value = categoryName;
  }
}
