
import 'package:json_annotation/json_annotation.dart';
part 'catogries_model.g.dart';
@JsonSerializable()
class CategoryModel {
  @JsonKey(name: "parant")
  final Parant parant;
  @JsonKey(name: "children")
  final List<Child> children;
  @JsonKey(name: "products")
  final List<Product> products;

  CategoryModel({
    required this.parant,
    required this.children,
    required this.products,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}

@JsonSerializable()
class Child {
  @JsonKey(name: "categoryid")
  final int categoryid;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "description")
  final dynamic description;
  @JsonKey(name: "bannerimageurl")
  final dynamic bannerimageurl;
  @JsonKey(name: "parentcategoryid")
  final int parentcategoryid;
  @JsonKey(name: "createdat")
  final DateTime createdat;
  @JsonKey(name: "imageurl")
  final String imageurl;

  Child({
    required this.categoryid,
    required this.name,
    required this.description,
    required this.bannerimageurl,
    required this.parentcategoryid,
    required this.createdat,
    required this.imageurl,
  });

  factory Child.fromJson(Map<String, dynamic> json) => _$ChildFromJson(json);

  Map<String, dynamic> toJson() => _$ChildToJson(this);
}

@JsonSerializable()
class Parant {
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "banner_image")
  final String bannerImage;

  Parant({
    required this.name,
    required this.bannerImage,
  });

  factory Parant.fromJson(Map<String, dynamic> json) => _$ParantFromJson(json);

  Map<String, dynamic> toJson() => _$ParantToJson(this);
}

@JsonSerializable()
class Product {
  @JsonKey(name: "productid")
  final int productid;
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

  Product({
    required this.productid,
    required this.name,
    required this.price,
    required this.discount,
    required this.discountedPrice,
    required this.imageUrl,
  });

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
