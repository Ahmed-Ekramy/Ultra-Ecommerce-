
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'cart_model.g.dart';

CartModel cartModelFromJson(String str) => CartModel.fromJson(json.decode(str));

String cartModelToJson(CartModel data) => json.encode(data.toJson());

@JsonSerializable()
class CartModel {
  @JsonKey(name: "cartid")
  final int cartid;
  @JsonKey(name: "totalamount")
  final int totalamount;
  @JsonKey(name: "discount")
  final int discount;
  @JsonKey(name: "totalamountWithOutDiscount")
  final int totalamountWithOutDiscount;
  @JsonKey(name: "products")
  final List<Product> products;

  CartModel({
    required this.cartid,
    required this.totalamount,
    required this.discount,
    required this.totalamountWithOutDiscount,
    required this.products,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) => _$CartModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartModelToJson(this);
}

@JsonSerializable()
class Product {
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "price")
  final int price;
  @JsonKey(name: "discount")
  final int discount;
  @JsonKey(name: "productid")
  final int productid;
  @JsonKey(name: "imageurl")
  final String imageurl;
  @JsonKey(name: "quantity")
  final int quantity;

  Product({
    required this.name,
    required this.price,
    required this.discount,
    required this.productid,
    required this.imageurl,
    required this.quantity,
  });

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
