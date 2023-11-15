import 'package:pas_mobile_xi_2/app/models/api_model.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class HomePageController extends GetxController {
  Rx<ResponseModel> responseModel = ResponseModel(
    products: [],
    total: 0,
    skip: 0,
    limit: 0,
  ).obs;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  loadData() async {
    try {
      final response =
          await http.get(Uri.parse('https://dummyjson.com/products?limit=100'));
      if (response.statusCode == 200) {
        responseModel.value = responseModelFromJson(response.body);
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      print("error: $e");
    }
  }

  final selectedCategory = "All".obs;

  void selectCategory(String categoryName) {
    selectedCategory.value = categoryName;
  }
}
