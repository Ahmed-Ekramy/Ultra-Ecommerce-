import 'package:json_annotation/json_annotation.dart';
part 'product_model.g.dart';
@JsonSerializable()
class ProductModel {
  num? productid;
  String? name;
  num? discount;
  num? price;
  num? discountedPrice;
  List<ProductImage>? productImage;

  ProductModel({
    this.productid,
    this.name,
    this.discount,
    this.price,
    this.discountedPrice,
    this.productImage,
  });
  factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
@JsonSerializable()
class ProductImage {
  String? imageurl;
  ProductImage({this.imageurl});
  factory ProductImage.fromJson(Map<String, dynamic> json) => _$ProductImageFromJson(json);
  Map<String, dynamic> toJson() => _$ProductImageToJson(this);
}
