import 'package:meta/meta.dart';
import 'dart:convert';

List<CatsProducts> homePageProductFromJson(String str) =>
    List<CatsProducts>.from(
        json.decode(str).map((x) => CatsProducts.fromJson(x)));

// String testProductToJson(List<TestProduct> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CatsProducts {
  int productId;
  int sizeId;
  dynamic color;
  double price;
  int newprice;
  double cost;
  int quantity;
  int discount;
  double vat;
  dynamic image;
  dynamic image1;
  dynamic image2;
  dynamic image3;
  dynamic image4;
  dynamic barcodeImage;
  dynamic catsProduct;
  dynamic catsProductSize;
  dynamic carts;
  dynamic catsSelseDetails;
  dynamic catsStockInformation;
  int id;
  DateTime createdDate;
  DateTime updatedDate;
  dynamic createdBy;
  dynamic updatedBy;

  CatsProducts({
    required this.productId,
    required this.sizeId,
    required this.color,
    required this.price,
    required this.newprice,
    required this.cost,
    required this.quantity,
    required this.discount,
    required this.vat,
    required this.image,
    required this.image1,
    required this.image2,
    required this.image3,
    required this.image4,
    required this.barcodeImage,
    required this.catsProduct,
    required this.catsProductSize,
    required this.carts,
    required this.catsSelseDetails,
    required this.catsStockInformation,
    required this.id,
    required this.createdDate,
    required this.updatedDate,
    required this.createdBy,
    required this.updatedBy,
  });

  factory CatsProducts.fromJson(Map<String, dynamic> json) => CatsProducts(
        productId: json["productId"],
        sizeId: json["sizeId"],
        color: json["color"],
        price: json["price"]?.toDouble(),
        newprice: json["newprice"],
        cost: json["cost"]?.toDouble(),
        quantity: json["quantity"],
        discount: json["discount"],
        vat: json["vat"]?.toDouble(),
        image: json["image"],
        image1: json["image1"],
        image2: json["image2"],
        image3: json["image3"],
        image4: json["image4"],
        barcodeImage: json["barcodeImage"],
        catsProduct: json["catsProduct"],
        catsProductSize: json["catsProductSize"],
        carts: json["carts"],
        catsSelseDetails: json["catsSelseDetails"],
        catsStockInformation: json["catsStockInformation"],
        id: json["id"],
        createdDate: DateTime.parse(json["createdDate"]),
        updatedDate: DateTime.parse(json["updatedDate"]),
        createdBy: json["createdBy"],
        updatedBy: json["updatedBy"],
      );

  // Map<String, dynamic> toJson() => {
  //       "productId": productId,
  //       "sizeId": sizeId,
  //       "color": color,
  //       "price": price,
  //       "newprice": newprice,
  //       "cost": cost,
  //       "quantity": quantity,
  //       "discount": discount,
  //       "vat": vat,
  //       "image": image,
  //       "image1": image1,
  //       "image2": image2,
  //       "image3": image3,
  //       "image4": image4,
  //       "barcodeImage": barcodeImage,
  //       "catsProduct": catsProduct,
  //       "catsProductSize": catsProductSize,
  //       "carts": carts,
  //       "catsSelseDetails": catsSelseDetails,
  //       "catsStockInformation": catsStockInformation,
  //       "id": id,
  //       "createdDate": createdDate.toIso8601String(),
  //       "updatedDate": updatedDate.toIso8601String(),
  //       "createdBy": createdByValues.reverse[createdBy],
  //       "updatedBy": updatedBy,
  //     };
}

enum CreatedBy { HABIBUR_RAHMAN, NULL, ADMIN_USER }

final createdByValues = EnumValues({
  "Admin User": CreatedBy.ADMIN_USER,
  "Habibur Rahman": CreatedBy.HABIBUR_RAHMAN,
  "NULL": CreatedBy.NULL
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
