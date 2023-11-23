class WishlistItemModel {
  String productName;
  String productImage;
  double productPrice;
  double productRating;

  WishlistItemModel({
    required this.productName,
    required this.productImage,
    required this.productPrice,
    required this.productRating,
  });

  factory WishlistItemModel.fromJson(Map<String, dynamic> json) {
    return WishlistItemModel(
      productName: json['productName'],
      productImage: json['productImage'],
      productPrice: (json['productPrice'] as num).toDouble(),
      productRating: (json['productRating'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'productName': productName,
      'productImage': productImage,
      'productPrice': productPrice,
      'productRating': productRating,
    };
  }
}
