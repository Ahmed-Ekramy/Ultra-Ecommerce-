import 'package:freezed_annotation/freezed_annotation.dart';
 part  'product_details_model.g.dart';
@JsonSerializable()
class ProductDetailModel {
  @JsonKey(name: "productid")
  final int productid;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "description")
  final String description;
  @JsonKey(name: "price")
  final int price;
  @JsonKey(name: "sku")
  final String sku;
  @JsonKey(name: "createdat")
  final DateTime createdat;
  @JsonKey(name: "updatedat")
  final DateTime updatedat;
  @JsonKey(name: "discount")
  final int discount;
  @JsonKey(name: "brandId")
  final int brandId;
  @JsonKey(name: "highlights")
  final List<String> highlights;
  @JsonKey(name: "discountedPrice")
  final double discountedPrice;
  @JsonKey(name: "product_image")
  final List<ProductImage> productImage;
  @JsonKey(name: "specifications")
  final List<Specification> specifications;

  ProductDetailModel({
    required this.productid,
    required this.name,
    required this.description,
    required this.price,
    required this.sku,
    required this.createdat,
    required this.updatedat,
    required this.discount,
    required this.brandId,
    required this.highlights,
    required this.discountedPrice,
    required this.productImage,
    required this.specifications,
  });

  factory ProductDetailModel.fromJson(Map<String, dynamic> json) => _$ProductDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDetailModelToJson(this);
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

@JsonSerializable()
class Specification {
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "value")
  final String value;

  Specification({
    required this.name,
    required this.value,
  });

  factory Specification.fromJson(Map<String, dynamic> json) => _$SpecificationFromJson(json);

  Map<String, dynamic> toJson() => _$SpecificationToJson(this);
}
