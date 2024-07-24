import 'package:json_annotation/json_annotation.dart';
part 'product_model.g.dart';
@JsonSerializable()
class ProductModel {
  @JsonKey(name: "productid")
  final int productId;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "discount")
  final int discount;
  @JsonKey(name: "price")
  final int price;
  @JsonKey(name: "discountedPrice")
  final double discountedPrice;
  @JsonKey(name: "product_image")
  final List<ProductImage> productImage;

  ProductModel({
    required this.productId,
    required this.name,
    required this.discount,
    required this.price,
    required this.discountedPrice,
    required this.productImage,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}

@JsonSerializable()
class ProductImage {
  @JsonKey(name: "imageurl")
  final String imageurl;

  ProductImage({
    required this.imageurl,
  });

  factory ProductImage.fromJson(Map<String, dynamic> json) => _$ProductImageFromJson(json);

  Map<String, dynamic> toJson() => _$ProductImageToJson(this);
}
