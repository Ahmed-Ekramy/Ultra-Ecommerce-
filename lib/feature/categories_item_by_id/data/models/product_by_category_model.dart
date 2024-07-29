
import 'package:json_annotation/json_annotation.dart';
part 'product_by_category_model.g.dart';
@JsonSerializable()
class ProductCategoryModel {
  @JsonKey(name: "productid")
  final int productId;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "price")
  final int price;
  @JsonKey(name: "discount")
  final int discount;
  @JsonKey(name: "discountedPrice")
  final double discountedPrice;
  @JsonKey(name: "imageUrl")
  final String imageUrl;

  ProductCategoryModel({
    required this.productId,
    required this.name,
    required this.price,
    required this.discount,
    required this.discountedPrice,
    required this.imageUrl,
  });

  factory ProductCategoryModel.fromJson(Map<String, dynamic> json) => _$ProductCategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductCategoryModelToJson(this);
}
