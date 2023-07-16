class CartModel {
  final String productImage;
  final String productName;
  final String productModel;
  final double productOldPrice;
  final double productPrice;
  final String productSize;
  final String productColor;
  final String productQuantity;

  CartModel({
    required this.productName,
    required this.productImage,
    required this.productModel,
    required this.productOldPrice,
    required this.productPrice,
    required this.productColor,
    required this.productQuantity,
    required this.productSize,
  });
}
