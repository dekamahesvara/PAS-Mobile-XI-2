import 'package:get/get.dart';

class HomePageController extends GetxController {
  final selectedCategory = "All".obs;

  void selectCategory(String categoryName) {
    selectedCategory.value = categoryName;
  }
}
